# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit font

DESCRIPTION="IBM's new corporate typeface"
HOMEPAGE="https://www.ibm.com/plex/"
SRC_URI="https://github.com/IBM/plex/releases/download/v${PV}/OpenType.zip -> ${P}.zip"
LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
S="${WORKDIR}"

DEPEND="app-arch/unzip"
RDEPEND=""

FONT_S="OpenType/IBM-Plex-Mono
		OpenType/IBM-Plex-Sans
		OpenType/IBM-Plex-Sans-Condensed
		OpenType/IBM-Plex-Serif"
FONT_SUFFIX="otf"
