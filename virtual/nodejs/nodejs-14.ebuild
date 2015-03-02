# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Virtual package for node.js implementations"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
KEYWORDS="~amd64 ~x86"
IUSE="+npm snapshot"
SLOT="14"

DEPEND=""
RDEPEND="
	|| (
		net-libs/iojs[npm?,snapshot?]
		net-libs/nodejs[npm?,snapshot?]
	)
	"
