# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Graphical tool to make photo collage posters"
HOMEPAGE="https://github.com/adrienverge/PhotoCollage"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
		"
RDEPEND="
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pycairo[${PYTHON_USEDEP}]
"

S="${WORKDIR}/PhotoCollage-${PV}"
