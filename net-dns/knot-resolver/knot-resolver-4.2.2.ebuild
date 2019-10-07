# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils meson systemd user

DESCRIPTION="A caching full DNS resolver implementation written in C and LuaJIT"
HOMEPAGE="https://www.knot-resolver.cz/"
SRC_URI="https://secure.nic.cz/files/${PN}/${P}.tar.xz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="go hardened memcached redis systemd test"

RDEPEND="
	>=net-dns/knot-2.8
	>=dev-libs/libuv-1.7.0
	dev-libs/jansson
	dev-lang/luajit:2
	dev-lua/luasocket
	dev-lua/luasec
	dev-db/lmdb
	net-libs/gnutls
	go? ( >=dev-lang/go-1.5.0 )
	memcached? ( dev-libs/libmemcached )
	redis? ( >=dev-libs/hiredis-0.11.0 )
	systemd? ( sys-apps/systemd )"

DEPEND="${RDEPEND}
	dev-util/ninja
	>=dev-util/meson-0.46
	virtual/pkgconfig
	test? ( dev-util/cmocka )"

pkg_setup() {
	enewgroup knot-resolver
	enewuser knot-resolver -1 -1 /etc/kresd knot-resolver
}

src_install() {
	meson_src_install

	mv ${D}/usr/share/doc/${PN} ${D}/usr/share/doc/${PF}

	newconfd "${FILESDIR}"/kresd.confd kresd
	newinitd "${FILESDIR}"/kresd.initd kresd
	systemd_dounit "${FILESDIR}"/kresd.service
	systemd_dounit "${FILESDIR}"/kresd.socket
	systemd_dounit "${FILESDIR}"/kresd-control.socket
	systemd_dounit "${FILESDIR}"/kresd-tls.socket
	systemd_newtmpfilesd "${FILESDIR}"/kresd.tmpfilesd kresd.conf

	insinto /etc/logrotate.d
	newins "${FILESDIR}"/kresd.logrotate kresd

	fowners knot-resolver:knot-resolver /etc/${PN}/
}
