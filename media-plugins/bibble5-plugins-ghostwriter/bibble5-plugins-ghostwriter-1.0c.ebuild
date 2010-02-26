# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit bibble5-plugins

DESCRIPTION="Displays png image over the main layer."
HOMEPAGE="http://www.joachim-jaeckel.de/index.pl?loc=Bibble&bib=Ghostwriter"
SRC_URI="http://www.joachim-jaeckel.de/bibble/ghostwriter_${PV}_linux.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""

PLUGINS=(
	"Ghostwriter.ui"
	"Ghostwriter.so"
)

bibble5-plugins-qa
