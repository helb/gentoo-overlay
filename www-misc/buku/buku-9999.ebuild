# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Powerful command line bookmark manager"
HOMEPAGE="https://github.com/jarun/Buku"
EGIT_REPO_URI="${HOMEPAGE}.git"
PYTHON_COMPAT=( python{3_4,3_5} )
inherit git-r3 python-r1

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="encryption"

RDEPEND="encryption? ( dev-python/pycrypto[${PYTHON_USEDEP}] )"

DEPEND="${RDEPEND}"

src_compile() {
	return
}

src_install() {
	dobin buku
	doman buku.1
}
