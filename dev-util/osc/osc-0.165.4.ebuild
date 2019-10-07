# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Commandline client for Open Build Service"
HOMEPAGE="https://github.com/openSUSE/osc"
KEYWORDS="~amd64"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${P}.tar.gz"
SLOT="0"
LICENSE="GPL-2"
IUSE=""
RDEPEND="dev-python/urlgrabber[${PYTHON_USEDEP}]
		 app-arch/rpm[python,${PYTHON_USEDEP}]
		 dev-python/m2crypto[${PYTHON_USEDEP}]
	 	 ${PYTHON_DEPS}
"

PDEPEND="${DEPEND}
	app-admin/sudo
	dev-util/obs-service-meta
"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_install() {
	distutils-r1_src_install
	dosym osc-wrapper.py /usr/bin/osc
	keepdir /usr/lib/osc/source_validators
	cd "${ED}"/usr/
	find . -type f -exec sed -i 's|/usr/bin/build|/usr/bin/suse-build|g'     {} +
	find . -type f -exec sed -i 's|/usr/lib/build|/usr/libexec/suse-build|g' {} +
	find . -type f -exec sed -i 's|/usr/lib/obs|/usr/libexec/obs|g'          {} +
	rm -f "${ED}"/usr/share/doc/${PN}*/TODO*
}
