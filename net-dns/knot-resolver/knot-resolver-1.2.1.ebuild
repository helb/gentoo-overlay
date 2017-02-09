# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils flag-o-matic systemd user

DESCRIPTION="A caching full DNS resolver implementation written in C and LuaJIT"
HOMEPAGE="https://www.knot-resolver.cz/"
SRC_URI="https://secure.nic.cz/files/${PN}/${P}.tar.xz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="go hardened memcached redis systemd test"

RDEPEND="
	>=net-dns/knot-2.3.1
	>=dev-libs/libuv-1.7.0
	dev-lang/luajit:2
	dev-lua/luasocket
	dev-lua/luasec
	go? ( >=dev-lang/go-1.5.0 )
	memcached? ( dev-libs/libmemcached )
	redis? ( >=dev-libs/hiredis-0.11.0 )
	systemd? ( sys-apps/systemd )"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	test? ( dev-util/cmocka )"

pkg_setup() {
	enewgroup kresd
	enewuser kresd -1 -1 /etc/kresd kresd
}

src_prepare() {
	sed -i 's/ -D_FORTIFY_SOURCE=2//g' ./config.mk \
		|| die "sed fix failed. Uh-oh..."

	eapply_user
}

src_compile() {
	append-cflags -DNDEBUG
	emake \
		PREFIX="${EPREFIX}/usr" \
		ETCDIR="${EPREFIX}/etc/kresd" \
		HAS_go=$(usex go) \
		HAS_libmemcached=$(usex memcached) \
		HAS_hiredis=$(usex redis) \
		HAS_libsystemd=$(usex systemd) \
		HAS_cmocka=$(usex test) \
		HARDENING=$(usex hardened) \
		|| die 'emake failed'
}

src_test() {
	emake check
}

src_install() {
	emake \
		PREFIX="${EPREFIX}/usr" \
		ETCDIR="${EPREFIX}/etc/kresd" \
		DESTDIR="${D}" install \
			|| die 'emake install failed'

	newconfd "${FILESDIR}"/kresd.confd kresd
	newinitd "${FILESDIR}"/kresd.initd kresd

	systemd_dounit "${FILESDIR}"/kresd.service
	systemd_dounit "${FILESDIR}"/kresd.socket
	systemd_dounit "${FILESDIR}"/kresd-control.socket
	systemd_dounit "${FILESDIR}"/kresd-tls.socket
	systemd_newtmpfilesd "${FILESDIR}"/kresd.tmpfilesd kresd.conf

	insinto /etc/kresd
	doins etc/config.personal
	doins etc/config.cluster
	doins etc/config.isp
	doins etc/config.splitview
	dosym /etc/kresd/config.personal /etc/kresd/config
	fperms 0640 /etc/kresd/config.personal
	fperms 0640 /etc/kresd/config.cluster
	fperms 0640 /etc/kresd/config.isp
	fperms 0640 /etc/kresd/config.splitview

	dodoc README.md
	dodoc AUTHORS
	dodoc COPYING
	dodoc NEWS

	insinto /etc/logrotate.d
	newins "${FILESDIR}"/kresd.logrotate kresd
}
