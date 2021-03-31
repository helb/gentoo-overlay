# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Variable type family built for better code & UI"
HOMEPAGE="https://www.recursive.design/"
SRC_URI="https://github.com/arrowtype/recursive/releases/download/v${PV}/ArrowType-Recursive-${PV}.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/ArrowType-Recursive-${PV}"
FONT_SUFFIX="otc"
FONT_S=(${WORKDIR}/ArrowType-Recursive-${PV}/Recursive_Desktop)
