# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id: bibblepro-bin-5.0.2.ebuild 1585 2010-02-18 07:34:42Z casta $

EAPI=2

inherit eutils versionator

DESCRIPTION="Professional photo workflow and RAW conversion software"
HOMEPAGE="http://www.bibblelabs.com"
RESTRICT="mirror strip"
MY_P="bibble5pro"
BUILD="${PV//\./}"
SRC_URI="x86? ( http://edge.bibblelabs.com/${BUILD}-20100318/${MY_P}-${PV}_i386.deb )
		 amd64? ( http://edge.bibblelabs.com/${BUILD}-20100318/${MY_P}-${PV}_amd64.deb )"
LICENSE="bibblepro"
SLOT="5"
KEYWORDS="~x86 ~amd64"
IUSE="andrea brenda color-popper curva ghostwriter gradleia grid harry inda lay
opacita pixie presettoni sally sallypro splittoni texa zone"

DEPEND="sys-apps/debianutils"
RDEPEND="virtual/libc
	media-libs/fontconfig
	media-libs/freetype
	sys-libs/zlib
	dev-libs/expat
	dev-libs/glib:2"

# blockers are used to help portage managing collisions
PDEPEND="andrea?	( media-plugins/bibble5-plugins-andrea )
	!andrea?		( !media-plugins/bibble5-plugins-andrea )
	brenda?			( media-plugins/bibble5-plugins-brenda )
    color-popper?	( media-plugins/bibble5-plugins-color-popper )
	curva?			( media-plugins/bibble5-plugins-curva )
	ghostwriter?	( media-plugins/bibble5-plugins-ghostwriter )
	gradleia?		( media-plugins/bibble5-plugins-gradleia )
	grid?			( media-plugins/bibble5-plugins-grid )
	harry?			( media-plugins/bibble5-plugins-harry )
	inda?			( media-plugins/bibble5-plugins-inda )
	lay?			( media-plugins/bibble5-plugins-lay )
	opacita?		( media-plugins/bibble5-plugins-opacita )
	pixie?			( media-plugins/bibble5-plugins-pixie )
	presettoni?		( media-plugins/bibble5-plugins-presettoni )
	sally?			( media-plugins/bibble5-plugins-sally )
	sallypro?		( media-plugins/bibble5-plugins-sallypro )
	splittoni?		( media-plugins/bibble5-plugins-splittoni )
	texa?			( media-plugins/bibble5-plugins-texa )
	zone?			( media-plugins/bibble5-plugins-zone )
	"

# Skip some QA checks we cannot fix
QA_EXECSTACK="opt/bibble5pro/bin/bibblepro
opt/bibble5pro/lib/libkodakcms.so"
QA_TEXTRELS="opt/bibble5pro/supportfiles/plugins/*.so
opt/bibble5pro/lib/libkodakcms.so"

src_unpack() {
	unpack ${A}
	unpack ./data.tar.gz
	rm -f control.tar.gz data.tar.gz debian-binary

	# if using andrea remove the bundled demo plugin to avoid collisions
	if use andrea; then
		rm "${WORKDIR}/opt/bibble5pro/supportfiles/plugins/Andrea.so"
		rm "${WORKDIR}/opt/bibble5pro/supportfiles/tools/Plugins/Andrea.ui"
	fi
}

src_install() {
	dodir /opt/bibble5pro

	# bibble binary
	dodir /opt/bibble5pro/bin
	exeinto /opt/bibble5pro/bin
	doexe opt/bibble5pro/bin/bibblepro
	exeinto /usr/bin
	doexe usr/bin/bibble5pro

	# bibble data files
	insinto /opt/bibble5pro
	doins -r opt/bibble5pro/supportfiles

	# bibble libs
	# We use cp -pPR to preserve files (libs) permissions without listing all files
	cp -pPR opt/bibble5pro/lib "${D}/opt/bibble5pro/" || die "failed to copy"

	# bibble icon
	dodir /usr/share/pixmaps
	insinto /usr/share/pixmaps
	doins usr/share/pixmaps/bibble5pro.png

	# .desktop file
	insinto /usr/share/applications
	doins usr/share/applications/bibblelabs-bibble5pro.desktop
}
