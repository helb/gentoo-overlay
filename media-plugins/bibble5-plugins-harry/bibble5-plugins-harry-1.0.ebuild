# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit bibble5-plugins

DESCRIPTION="Black and white converter filter using color equalizer."
HOMEPAGE="http://www.kbarni.net/#Harry"
SRC_URI="http://www.weebly.com/uploads/2/2/0/4/2204711/harrytrial.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""

PLUGINS=(
	"Harry.ui"
	"Harry.so"
)

bibble5-plugins-qa
