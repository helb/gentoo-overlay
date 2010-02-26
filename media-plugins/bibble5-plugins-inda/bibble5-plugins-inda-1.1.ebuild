# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit bibble5-plugins

DESCRIPTION="iNDA is a Black/White film simulator for Bibble5."
HOMEPAGE="http://www.kbarni.net/#Inda"
SRC_URI="http://www.weebly.com/uploads/2/2/0/4/2204711/inda.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""

PLUGINS=(
	"Inda.ui"
	"Inda.so"
)

bibble5-plugins-qa
