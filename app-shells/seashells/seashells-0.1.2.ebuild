# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4,3_5,3_6} )
inherit distutils-r1

DESCRIPTION="Pipe commandline output to the web in real time."
HOMEPAGE="https://seashells.io/"
SRC_URI="https://github.com/anishathalye/seashells/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
