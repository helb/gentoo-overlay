# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils meson ninja-utils systemd user

DESCRIPTION="A caching full DNS resolver implementation written in C and LuaJIT"
HOMEPAGE="https://www.knot-resolver.cz/"
SRC_URI="https://secure.nic.cz/files/${PN}/${P}.tar.xz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
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
