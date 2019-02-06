# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The macOS and Linux Disassembler"
HOMEPAGE="https://www.hopperapp.com/"
SRC_URI="https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-${PV}-Linux.pkg.tar.xz"

LICENSE="EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	insinto /
	doins -r usr
	doins -r opt
	fperms +x /opt/hopper-v4/bin/Hopper
	exeinto /usr/bin
	newexe opt/hopper-v4/bin/Hopper Hopper
}
