# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games subversion

DESCRIPTION="Super Mario War is a Super Mario multiplayer game."
HOMEPAGE="http://smw.72dpiarmy.com/?q=node"

ESVN_REPO_URI="svn://svn.72dpiarmy.com/smw"
ESVN_PROJECT="smw"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="media-libs/sdl-mixer
	media-libs/sdl-image"
DEPEND="${RDEPEND}"

S="${WORKDIR}/smw"

src_compile() {
	econf || die "Configuration failed!"
	emake || die "Make failed!"
}

src_install() {
	make DESTDIR=${D} install || die
}
