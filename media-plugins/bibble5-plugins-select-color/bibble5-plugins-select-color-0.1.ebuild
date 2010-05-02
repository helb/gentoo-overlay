# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit bibble5-plugins

DESCRIPTION="Adjsut color selected by its dominant wavelength"
HOMEPAGE="http://baruchel.free.fr/bibble/?p=183"
	SRC_URI="http://baruchel.free.fr/bibble/?dl_id=24 -> SelectColor.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""
RESTRICT="mirror"

PLUGINS=(
	"SelectColor.ui"
	"SelectColor.so"
)

bibble5-plugins-qa
