# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{5,6} )
PYTHON_REQ_USE="sqlite,xml"

inherit distutils-r1 gnome2-utils xdg-utils

DESCRIPTION="Jabber client written in PyGTK"
HOMEPAGE="https://www.gajim.org/"
KEYWORDS="~amd64"
SRC_URI="https://gajim.org/downloads/1.1/gajim-${PV}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
IUSE="crypt dbus gnome idle jingle networkmanager nls spell +srv test X xhtml zeroconf"

REQUIRED_USE="
	${PYTHON_REQUIRED_USE}
	zeroconf? ( dbus )"

COMMON_DEPEND="
	${PYTHON_DEPS}
	x11-libs/gtk+:3"
DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.40.1
	virtual/pkgconfig
	>=sys-devel/gettext-0.17-r1"
RDEPEND="${COMMON_DEPEND}
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	dev-python/protobuf-python[${PYTHON_USEDEP}]
	dev-python/pycrypto[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pycurl[${PYTHON_USEDEP}]
	dev-python/qrcode[${PYTHON_USEDEP}]
	dev-python/precis-i18n[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-0.14[${PYTHON_USEDEP}]
	>=dev-python/python-nbxmpp-0.6.3[${PYTHON_USEDEP}]
	>=dev-python/cssutils-1.0.2[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]
	crypt? (
		app-crypt/gnupg
		dev-python/python-gnupg[${PYTHON_USEDEP}]
		)
	dbus? (
		dev-python/dbus-python[${PYTHON_USEDEP}]
		virtual/notification-daemon
		dev-libs/dbus-glib
		)
	gnome? (
		dev-python/libgnome-python[${PYTHON_USEDEP}]
		dev-python/egg-python[${PYTHON_USEDEP}]
		)
	idle? ( x11-libs/libXScrnSaver )
	jingle? ( net-libs/farstream:0.2[python,${PYTHON_USEDEP}] )
	networkmanager? (
			dev-python/dbus-python[${PYTHON_USEDEP}]
			net-misc/networkmanager
		)
	spell? ( app-text/gtkspell:2 )
	srv? (
		|| (
			dev-python/libasyncns-python[${PYTHON_USEDEP}]
			net-dns/bind-tools
			)
		)
	xhtml? ( dev-python/docutils[${PYTHON_USEDEP}] )"

RESTRICT="test"

pkg_postinst() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}
