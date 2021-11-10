# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python{3_7,3_8,3_9,3_10} )

inherit python-r1

DESCRIPTION="Use Python in shell pipes"
HOMEPAGE="https://pypi.org/project/pz/"
SRC_URI="https://github.com/CZ-NIC/pz/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install(){
	dobin pz
	dodoc README.md
}
