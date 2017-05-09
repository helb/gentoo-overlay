# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit golang-build golang-vcs-snapshot

KEYWORDS="~amd64"
EGO_PN=github.com/ericchiang/${PN}
HOMEPAGE="https://${EGO_PN}"
EGIT_COMMIT="fb09a23cce6c8ed60ba9b85035e3e27adff96aa3"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="HTML parser for the command line"
LICENSE="MIT"
SLOT="0"
IUSE=""
DEPEND="dev-go/go-tools:="
RDEPEND=""

src_install() {
	dobin ${PN}
	dodoc src/${EGO_PN}/README.md
}
