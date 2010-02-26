# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id: bibble5-plugins-brenda-1.0a.ebuild 1575 2010-02-12 22:25:14Z casta $

EAPI=2

inherit bibble5-plugins

DESCRIPTION="Curva is used to apply photoshop curves (.acv) to an image."
HOMEPAGE="http://bibble.sadman.net/curva/"
SRC_URI="http://bibble.sadman.net/files/curva_v0.2_b501_lnx.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""

PLUGINS=(
	"Curva.ui"
	"Curva.so"
)

bibble5-plugins-qa
