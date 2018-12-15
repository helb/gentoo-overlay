# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
MY_PV="${PV//_/-}"

DESCRIPTION="A hackable text editor for the 21st Century"
HOMEPAGE="https://atom.io/"
SRC_URI="https://github.com/atom/atom/releases/download/v${MY_PV}/atom-amd64.tar.gz -> atom-${PV}.tar.gz"

LICENSE="MIT"
KEYWORDS="amd64"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MY_PV}-amd64"

src_install() {
    insinto "/opt/${PN}"
	doins -r *
	dosym "/opt/${PN}/atom" "/usr/bin/atom"
	dosym "/opt/${PN}/resources/app/apm/bin/apm" "/usr/bin/apm"
	fperms +x "/opt/${PN}/atom"
	fperms +x "/opt/${PN}/libnode.so"
	fperms +x "/opt/${PN}/resources/app/apm/bin/apm"
	fperms +x "/opt/${PN}/resources/app/apm/bin/node"
	doicon atom.png
}
