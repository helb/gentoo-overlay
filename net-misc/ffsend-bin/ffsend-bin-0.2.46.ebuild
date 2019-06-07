# Copyright 2017-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils

DESCRIPTION="Easily and securely share files from the command line. A fully featured Firefox Send client."
HOMEPAGE="https://gitlab.com/timvisee/ffsend"
SRC_URI="https://github.com/timvisee/ffsend/releases/download/v${PV}/ffsend-v${PV}-linux-x64"
RESTRICT="mirror"
LICENSE="GPL-3.0" # Update to proper Gentoo format
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/ffsend-v${PV}-linux-x64" "${WORKDIR}/ffsend"
}

src_install() {
	dobin ffsend
}
