# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit font

DESCRIPTION="Variable font family for code & UI (static version)"
HOMEPAGE="https://www.recursive.design/"
SRC_URI="https://github.com/arrowtype/recursive/releases/download/v${PV}/recursive-static_fonts-b020.zip -> ${P}.zip"
LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
S="${WORKDIR}/recursive-static-b1_020"

DEPEND="app-arch/unzip"
RDEPEND=""

FONT_S="recursive_mono-static_otf recursive_sans-static_otf"

FONT_SUFFIX="otf"
