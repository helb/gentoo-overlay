# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="Command line tool to take screenshots of the desktop"
HOMEPAGE="https://github.com/naelstrof/maim"
EGIT_REPO_URI="https://github.com/naelstrof/maim.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	virtual/jpeg:*
	media-libs/libpng:0
	x11-libs/libX11
	x11-libs/libXrandr
	x11-libs/libXfixes
	>=x11-misc/slop-5.3.37"
RDEPEND="${DEPEND}"
