# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Slow but thorough PNG optimizer (just a glorified 'pnquant | zopfli' alias)"
HOMEPAGE="https://github.com/helb/crunch-lite"
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~*"
IUSE=""

DEPEND="media-gfx/pngquant
		|| ( app-arch/zopfli-chrissimpkins app-arch/zopfli )"
RDEPEND="${DEPEND}"

src_install() {
	newbin crunch.sh crunch;
}
