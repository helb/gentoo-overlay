# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="Very good, but slow, deflate or zlib compression"
HOMEPAGE="https://github.com/chrissimpkins/zopfli"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/zopfli-${PV}"

LICENSE="Apache-2.0"
SLOT="0/1"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
RDEPEND="!app-arch/zopfli"

DOCS=( CONTRIBUTORS README.md )


src_compile() {
	make zopfli
	make zopflipng
}

src_install() {
	dobin zopfli
	dobin zopflipng
}
