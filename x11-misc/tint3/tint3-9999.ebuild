# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-r3

DESCRIPTION="C++ rewrite of the tint2 panel."
HOMEPAGE="https://github.com/jmc-88/tint3"
EGIT_REPO_URI="git://github.com/jmc-88/tint3.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
		media-libs/imlib2[X]
		x11-libs/libxcb
		x11-libs/cairo
        x11-libs/pango[X]
		x11-libs/startup-notification
		app-text/pandoc
		"

RDEPEND="${DEPEND}"
