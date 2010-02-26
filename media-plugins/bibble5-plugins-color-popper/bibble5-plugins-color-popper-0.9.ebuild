# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit bibble5-plugins

DESCRIPTION="Bibble plugin which allows you to change the color levels without altering the exposure and contrast."
HOMEPAGE="http://www.xs4all.nl/~mmzeeman/bibble/#color-popper"
SRC_URI="http://www.xs4all.nl/~mmzeeman/bibble/Color-Popper-${PV/./-}.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""

PLUGINS=(
	"Color-Popper-0-9/Pop Colors.ui"
	"Color-Popper-0-9/pop_colors.so"
)

bibble5-plugins-qa
