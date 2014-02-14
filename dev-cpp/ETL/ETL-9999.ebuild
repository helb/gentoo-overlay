# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit autotools git-2

DESCRIPTION="Multiplatform class and template library designed to complement and supplement the C++ STL"

HOMEPAGE="http://www.synfig.org/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/synfig/synfig.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	S="${WORKDIR}/${P}/ETL"
	cd "${S}"
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc AUTHORS README NEWS || die
}
