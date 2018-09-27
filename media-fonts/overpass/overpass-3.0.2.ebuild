# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit font

DESCRIPTION="An open source font family inspired by Highway Gothic."
HOMEPAGE="http://overpassfont.org"
SRC_URI="https://github.com/RedHatBrand/Overpass/releases/download/${PV}/overpass-desktop-fonts.zip -> ${P}.zip"
LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
S="${WORKDIR}"

DEPEND="app-arch/unzip"
RDEPEND=""

FONT_S="overpass overpass-mono"
FONT_SUFFIX="otf"
