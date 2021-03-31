# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font git-r3

DESCRIPTION="San Francisco - the Apple Watch font"
HOMEPAGE="https://github.com/supermarin/YosemiteSanFranciscoFont"
EGIT_REPO_URI="https://github.com/supermarin/YosemiteSanFranciscoFont.git"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd"

FONT_SUFFIX="ttf"
FONTDIR="/usr/share/fonts/${PN}"
FONT_S="${S}/text-face"

src_prepare() {
	mv "${S}/Text Face (alternate)" "${S}/text-face"
}

