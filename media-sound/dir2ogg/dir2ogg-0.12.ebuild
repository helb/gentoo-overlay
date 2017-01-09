# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python2_7 )
inherit versionator python-r1

MY_PR=$(get_version_component_range 1-2)

DESCRIPTION="Converts mp3, m4a, wma, and wav files to Ogg Vorbis format"
HOMEPAGE="http://jak-linux.org/projects/dir2ogg/"
SRC_URI="http://jak-linux.org/projects/${PN}/${MY_PR}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="aac cdparanoia flac mac mp3 musepack wavpack wma"

RDEPEND="
	dev-python/pyid3lib
	media-sound/vorbis-tools[ogg123]
	>=media-libs/mutagen-1.11
	aac? ( || ( media-libs/faad2
				media-video/mplayer
				media-video/mpv ) )
	cdparanoia? ( || ( dev-libs/libcdio-paranoia
		media-sound/cdparanoia ) )
	flac? ( || ( media-libs/flac
				 media-video/mplayer
				 media-video/mpv ) )
	mac? ( || ( media-sound/mac
				media-video/mplayer
				media-video/mpv ) )
	mp3? ( || ( media-sound/mpg123
				media-sound/lame
				media-video/mplayer
				media-sound/mpg321 ) )
	musepack? ( || ( >=media-sound/musepack-tools-444
					 media-video/mplayer
					 media-video/mpv ) )
	wavpack? ( || ( media-sound/wavpack
					media-video/mplayer
					media-video/mpv ) )
	wma? ( || ( media-video/mplayer
				media-video/mpv ) )"
DEPEND=""

src_prepare() {
	epatch "${FILESDIR}/0001-use-python2-binary.patch"
	epatch "${FILESDIR}/0002-mpv-support.patch"
	epatch "${FILESDIR}/0003-add-mpv-to-README-and-manpage.patch"
	eapply_user
}

src_install() {
	dobin dir2ogg || die
	doman dir2ogg.1
	dodoc NEWS README
}
