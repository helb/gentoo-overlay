# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="A high performance CSV command line toolkit"
HOMEPAGE="https://github.com/BurntSushi/xsv/"
SRC_URI="${HOMEPAGE}releases/download/${PV}/xsv-${PV}-x86_64-unknown-linux-musl.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="!app-misc/xsv"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	dobin ${WORKDIR}/xsv
}
