# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit bibble5-plugins

DESCRIPTION="Brenda - Colour Grading"
HOMEPAGE="http://nexi.com/brenda"
SRC_URI="http://nexi.com/b5/package/Brenda-${PV}.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""

PLUGINS=(
	"Brenda.ui"
	"Brenda.so"
)

bibble5-plugins-qa
