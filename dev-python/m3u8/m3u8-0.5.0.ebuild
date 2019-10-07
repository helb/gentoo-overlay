# By eroen, 2014
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# $Header: $

EAPI=5
# needs 2to3 for urlparse
PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} )

DESCRIPTION="Python m3u8 Parser for HTTP Live Streaming (HLS) Transmissions"
HOMEPAGE="https://pypi.python.org/pypi/m3u8 https://github.com/globocom/m3u8"
if [[ ${PV} == *9999* ]]; then
	inherit distutils-r1 git-r3
	EGIT_REPO_URI="https://github.com/globocom/m3u8.git"
	VCS_DEPEND="dev-vcs/git[curl]"
else
	inherit distutils-r1
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="test"
# test suite missing from tarballs
[[ ${PV} != *9999* ]] && RESTRICT="test"

DEPEND="${VCS_DEPEND}
	dev-python/iso8601[${PYTHON_USEDEP}]
	test? ( app-shells/bash
		dev-python/bottle[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		sys-apps/coreutils
		sys-apps/findutils
		sys-apps/grep
		sys-process/procps )"
RDEPEND=""

python_test() {
	sed -e '/pip install/c:' \
		-i runtests || die
	./runtests || die
}
