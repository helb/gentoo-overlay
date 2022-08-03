# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake git-r3

DESCRIPTION="Tool that ueries for a selection from the user"
HOMEPAGE="https://github.com/naelstrof/slop"
EGIT_REPO_URI="https://github.com/naelstrof/slop.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	x11-libs/libX11
	x11-libs/libXext
	media-libs/glew:0=
	media-libs/imlib2
	virtual/opengl
	x11-libs/libXrandr
	x11-libs/libXrender
"

DEPEND="
	media-libs/glm
"
