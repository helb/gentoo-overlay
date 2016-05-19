# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils versionator unpacker

DESCRIPTION="Professional photo workflow and RAW conversion software"
HOMEPAGE="http://www.corel.com/corel/product/index.jsp?pid=prod4670071"

SRC_URI="http://dwnld.aftershotpro.com/trials/3/AfterShotPro3.deb"

LICENSE="AfterShotPro"
SLOT="3"
KEYWORDS="-* ~amd64"

RDEPEND="
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/libffi
	sys-libs/zlib
	media-libs/fontconfig
	media-libs/freetype
	media-libs/libpng
	media-libs/tiff:3
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libxcb
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXrender
	"
DEPEND="sys-apps/debianutils"
BASEDIR="opt/AfterShot3(64-bit)"

S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	dodir "/${BASEDIR}"

	# AfterShot binary
	#dodir "/${BASEDIR}/bin"
	#exeinto "/${BASEDIR}/bin"
	dodir "/${BASEDIR}/bin/Corel AfterShot HDR/"
	exeinto "/${BASEDIR}/bin/Corel AfterShot HDR/"
	doexe "${BASEDIR}/bin/Corel AfterShot HDR/Corel Aftershot HDR"
	exeinto "usr/local/bin"
	doexe "${BASEDIR}/bin/AfterShot"

	# AfterShot HDR data files
	insinto "/${BASEDIR}/bin/Corel AfterShot HDR"
	doins -r "${BASEDIR}/bin/Corel AfterShot HDR/Brushes"
	doins -r "${BASEDIR}/bin/Corel AfterShot HDR/CameraCurve"
	doins -r "${BASEDIR}/bin/Corel AfterShot HDR/GettingStartedPage"
	doins -r "${BASEDIR}/bin/Corel AfterShot HDR/Presets"
	doins -r "${BASEDIR}/bin/Corel AfterShot HDR/PSPPProvidePreset"

	# AfterShot data files
	#insinto "/${BASEDIR}"
	#doins -r "${BASEDIR}/supportfiles"

	# AfterShot libs
	# We use cp -pPR to preserve files (libs) permissions without listing all files
	cp -pPR "${BASEDIR}/lib" "${D}/${BASEDIR}/" || die "failed to copy libs"
	cp -pPR "${BASEDIR}/supportfiles" "${D}/${BASEDIR}/" || die "failed to copy supportfiles"
}
