# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="A caching full DNS resolver implementation written in C and LuaJIT"
HOMEPAGE="https://www.knot-resolver.cz/"
SRC_URI="https://secure.nic.cz/files/${PN}/${P}.tar.xz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="systemd utils dnstap"

RDEPEND="
	acct-group/knot-resolver
	acct-user/knot-resolver
	>=net-dns/knot-3.0.2
	>=dev-libs/libuv-1.7.0
	dev-lang/luajit:2
	dev-db/lmdb
	net-libs/gnutls"

DEPEND="${RDEPEND}
	dev-util/ninja
	>=dev-util/meson-0.46
	virtual/pkgconfig
	dnstap? (
		dev-libs/fstrm
		dev-libs/protobuf-c:=
	)"

src_configure() {
		local emesonargs=(
				-Dinstall_kresd_conf="enabled"
				-Dsystemd_files=$(usex systemd "enabled" "disabled")
				-Dutils=$(usex utils "enabled" "disabled")
				-Ddnstap=$(usex dnstap "enabled" "disabled")
		)
		meson_src_configure
}

src_install() {
	meson_src_install

	mv "${D}"/usr/share/doc/"${PN}" "${D}"/usr/share/doc/"${PF}"

	# OpenRC
	newconfd "${FILESDIR}"/kresd.confd kresd
	newinitd "${FILESDIR}"/kresd.initd kresd
	newinitd "${FILESDIR}"/kres-cache-gc.initd kres-cache-gc

	# systemd files are installed by knot-resolver if the flag is enabled

	# logrotate
	insinto /etc/logrotate.d
	newins "${FILESDIR}"/kresd.logrotate kresd
	newins "${FILESDIR}"/kres-cache-gc.logrotate kres-cache-gc

	# fd limits
	insinto /etc/security/limits.d
	newins "${FILESDIR}"/50-"${PN}".conf 50-"${PN}".conf

	# conf dir permissions
	fowners -R knot-resolver:knot-resolver /etc/"${PN}"/
	fperms -R 0750 /etc/"${PN}"/
}
