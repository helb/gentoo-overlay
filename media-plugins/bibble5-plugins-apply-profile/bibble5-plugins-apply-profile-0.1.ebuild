# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit bibble5-plugins

DESCRIPTION="Apply ICC profiles on a picture."
HOMEPAGE="http://baruchel.free.fr/bibble/?p=192"
SRC_URI="http://baruchel.free.fr/bibble/?dl_id=26 -> ApplyProfile.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""
RESTRICT="mirror"

PLUGINS=(
	"ApplyProfile.ui"
	"ApplyProfile.so"
)

bibble5-plugins-qa
