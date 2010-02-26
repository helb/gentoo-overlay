# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id: bibble5-plugins-brenda-1.0a.ebuild 1575 2010-02-12 22:25:14Z casta $

EAPI=2

inherit bibble5-plugins

DESCRIPTION="Split toning plugin based on the built-in Lightroom tool."
HOMEPAGE="http://bibble.sadman.net/splittoni/"
SRC_URI="http://bibble.sadman.net/files/splittoni_v0.3_b501_lnx.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""

PLUGINS=(
	"SplitToni.ui"
	"SplitToni.so"
)

bibble5-plugins-qa
