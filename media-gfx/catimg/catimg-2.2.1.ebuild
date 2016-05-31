# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION="Renders images in the terminal."
HOMEPAGE="https://github.com/posva/catimg"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bash zsh"
REQUIRED_USE="?? ( bash zsh )"

DEPEND="zsh? ( app-shells/zsh media-gfx/imagemagick )
		bash? ( app-shells/bash media-gfx/imagemagick )"
RDEPEND="${DEPEND}"

src_install(){
	cmake-utils_src_install

	if use zsh ; then
		sed -i "1s/bash/zsh/" ${S}/${PN}
	fi
	
	if use zsh || use bash ; then
        insinto /usr/share/${PN}
        doins ${S}/catimg-ext-colors.png
        sed -i 's/COLOR_FILE=$(dirname "$0")/COLOR_FILE=\/usr\/share\/catimg/' ${S}/${PN}
		exeinto /usr/bin
		newexe ${S}/${PN} ${PN}.sh
	fi
}
