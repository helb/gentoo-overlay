# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit bibble5-plugins

DESCRIPTION="Pixie is a fast hot/dark pixel remover."
HOMEPAGE="http://www.kbarni.net/#Pixie"
SRC_URI="http://www.weebly.com/uploads/2/2/0/4/2204711/pixie.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""

PLUGINS=(
	"Pixie.ui"
	"Pixie.so"
)

bibble5-plugins-qa
