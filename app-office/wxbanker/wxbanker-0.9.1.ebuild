# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_5,2_6,2_7} )

inherit distutils-r1


DESCRIPTION="Simple personal finance."
HOMEPAGE="https://launchpad.net/wxbanker"
SRC_URI="http://launchpad.net/wxbanker/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="${PYTHON_DEPS}
		dev-python/wxpython:2.8
		dev-python/pyquery
		dev-python/keyring
		dev-python/python-dateutil
		>=dev-python/numpy-1.04
		dev-python/simplejson
		dev-python/beautifulsoup"

DEPEND="${RDEPEND}"

DOCS=( README.md CHANGELOG.txt )
