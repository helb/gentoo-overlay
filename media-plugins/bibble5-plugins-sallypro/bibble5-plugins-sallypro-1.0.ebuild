# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id: bibble5-plugins-brenda-1.0a.ebuild 1575 2010-02-12 22:25:14Z casta $

EAPI=2

inherit bibble5-plugins

DESCRIPTION="Trial verison of the ultimate color processing plugin."
HOMEPAGE="http://www.kbarni.net/#SallyPro"
SRC_URI="http://www.weebly.com/uploads/2/2/0/4/2204711/sallyprotrial.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""

PLUGINS=(
	"SallyPro A.ui"
	"SallyPro B.ui"
	"SallyPro.so"
)

bibble5-plugins-qa
