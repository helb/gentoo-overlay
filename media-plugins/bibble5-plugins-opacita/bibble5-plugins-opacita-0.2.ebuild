# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit bibble5-plugins

DESCRIPTION="Plugin that allows to set opacity of the layers."
HOMEPAGE="http://bibble.sadman.net/opacita/"
SRC_URI="http://bibble.sadman.net/files/opacita_v${PV}_b501_lnx.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""

PLUGINS=(
	"Opacita.ui"
	"Opacita.so"
)

bibble5-plugins-qa
