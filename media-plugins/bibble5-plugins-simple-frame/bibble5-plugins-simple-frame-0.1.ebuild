# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit bibble5-plugins

DESCRIPTION="Simple plugin for photo framing."
HOMEPAGE="http://baruchel.free.fr/bibble/?p=225"
	SRC_URI="http://baruchel.free.fr/bibble/?dl_id=27 -> SimpleFrame.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""
RESTRICT="mirror"

PLUGINS=(
	"SimpleFrame.ui"
	"SimpleFrame.so"
)

bibble5-plugins-qa
