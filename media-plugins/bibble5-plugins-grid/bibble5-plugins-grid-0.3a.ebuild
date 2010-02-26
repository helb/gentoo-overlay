# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id: bibble5-plugins-brenda-1.0a.ebuild 1575 2010-02-12 22:25:14Z casta $

EAPI=2

inherit bibble5-plugins

DESCRIPTION="Simple customizable grid over the photo."
HOMEPAGE="http://www.joachim-jaeckel.de/index.pl?loc=Bibble&bib=Grid"
SRC_URI="http://www.joachim-jaeckel.de/bibble/grid_${PV}_linux.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""

PLUGINS=(
	"Grid.ui"
	"Grid.so"
)

bibble5-plugins-qa
