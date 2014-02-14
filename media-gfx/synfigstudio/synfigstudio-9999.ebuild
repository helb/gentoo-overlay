# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2 autotools libtool

DESCRIPTION="Synfig: Film-Quality Vector Animation (core engine)"
HOMEPAGE="http://www.synfig.org"
SRC_URI=""
EGIT_REPO_URI="git://github.com/synfig/synfig.git"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="imagemagick ffmpeg dv openexr truetype jpeg tiff fontconfig nls"

DEPEND=">=dev-libs/libsigc++-2.0.0
	=media-gfx/synfig-${PV}
	>=dev-cpp/libxmlpp-2.6.1
	media-libs/libpng
	ffmpeg? ( media-video/ffmpeg )
	openexr? ( media-libs/openexr )
	truetype? ( >=media-libs/freetype-2.1.9 )
	fontconfig? ( media-libs/fontconfig )
	jpeg? ( virtual/jpeg )
	tiff? ( media-libs/tiff )
	nls? ( sys-devel/gettext )"

RDEPEND="${DEPEND}
	dv? ( media-libs/libdv )
	imagemagick? ( media-gfx/imagemagick )"

src_prepare() {	
	S="${WORKDIR}/${P}/synfig-studio"
    cd ${S}
	libtoolize --ltdl --copy --force || die "libtoolize failed"
	eautoreconf --install --force || die "autoreconf failed"
}

src_compile() {
	econf \
		$(use_with ffmpeg) \
		$(use_with fontconfig) \
		$(use_with imagemagick) \
		$(use_with dv libdv) \
		$(use_with openexr ) \
		$(use_with truetype freetype) \
		$(use_with jpeg) \
		|| die "Configure failed!"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed!"
	#dodoc doc/*.txt
	#insinto /usr/share/${PN}/examples
	#doins examples/*.sif
	#`doins examples/*.sifz
}
