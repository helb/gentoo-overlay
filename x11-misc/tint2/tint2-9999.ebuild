# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs eutils subversion
ESVN_REPO_URI="http://tint2.googlecode.com/svn/trunk/"

DESCRIPTION="Tint2 is a lightweight taskbar originally based on TTM"
HOMEPAGE="http://code.google.com/p/tint2/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="battery examples tint2conf"

RDEPEND="x11-libs/cairo
	x11-libs/pango
	=dev-libs/glib-2*
	media-libs/imlib2
	x11-libs/libXinerama
	x11-libs/libX11
	tint2conf? ( >=dev-python/pygtk-2.0 )
	!x11-misc/tint"
DEPEND="dev-util/pkgconfig ${RDEPEND}"

src_unpack() {
	subversion_src_unpack
	./autogen.sh || die
}

src_compile() {
	econf $(use_enable battery) \
		  $(use_enable examples) \
		  $(use_enable tint2conf) \
		  || die "econf failed"
	
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
