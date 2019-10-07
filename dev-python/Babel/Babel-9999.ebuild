# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/Babel/Babel-1.3-r1.ebuild,v 1.7 2014/12/07 12:01:28 ago Exp $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_6,3_7} pypy )
inherit distutils-r1 git-r3

DESCRIPTION="A collection of tools for internationalizing Python applications"
HOMEPAGE="http://babel.pocoo.org/ https://github.com/mitsuhiko/babel"
EGIT_REPO_URI="https://github.com/mitsuhiko/babel.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE="doc test"

RDEPEND="dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]"
DEPEND="${DEPEND}
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-2.3.5[${PYTHON_USEDEP}] )"

python_prepare_all() {
	# Make the tests use implementation-specific datadir,
	# because they try to write in it.
	sed -e '/datadir =/s:os\.path\.dirname(__file__):os.environ["BUILD_DIR"]:' \
		-i tests/messages/test_frontend.py || die
	sed -e '/^intersphinx_mapping/,+3d' -i docs/conf.py || die
	distutils-r1_python_prepare_all
}

python_test() {
	# Create implementation-specific datadir for tests.
	cp -R -l tests/messages/data "${BUILD_DIR}"/ || die
	export BUILD_DIR
	py.test
}

python_compile_all() {
	use doc && emake -C docs html
    	esetup.py import_cldr || die "import_cldr failed"
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	distutils-r1_python_install_all
}
