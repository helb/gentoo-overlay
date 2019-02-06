# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Script to play Czech Television (Česká televize) stream in a custom player"
HOMEPAGE="https://github.com/ziima/televize"
KEYWORDS="~amd64"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${P}.tar.gz"
SLOT="0"
LICENSE="GPL-2"
IUSE=""
RDEPEND="dev-python/docopt[${PYTHON_USEDEP}]
		 dev-python/lxml[${PYTHON_USEDEP}]
		 dev-python/requests[${PYTHON_USEDEP}]
		 >=dev-python/m3u8-0.3[${PYTHON_USEDEP}]"
