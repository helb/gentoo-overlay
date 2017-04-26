# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2-utils

DESCRIPTION="Advanced GTK3 tiling terminal emulator"
HOMEPAGE="https://gnunn1.github.io/tilix-web/"
SRC_URI="https://github.com/gnunn1/tilix/releases/download/${PV}/tilix.zip -> ${P}.zip"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip
		dev-libs/glib:2
"

RDEPEND=""

S="${WORKDIR}/usr"

src_install() {
	mv "${S}" "${D}"
	cd "${WORKDIR}" || die
}

pkg_postinst() {
	/usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas
}

pkg_postrm() {
	pkg_postinst
}
