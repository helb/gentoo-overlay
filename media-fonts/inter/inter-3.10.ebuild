# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit font

DESCRIPTION="A typeface specially designed for user interfaces."
HOMEPAGE="https://rsms.me/inter/"
SRC_URI="https://github.com/rsms/inter/releases/download/v${PV}/Inter-${PV}.zip"
LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
S="${WORKDIR}/Inter (OTF)"

DEPEND="app-arch/unzip"
RDEPEND=""

FONT_SUFFIX="otf"
