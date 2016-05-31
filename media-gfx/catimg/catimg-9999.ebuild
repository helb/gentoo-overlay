# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit git-r3 cmake-utils

DESCRIPTION="Renders images in the terminal."
HOMEPAGE="https://github.com/posva/catimg"
EGIT_REPO_URI="${HOMEPAGE}.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bash zsh"
REQUIRED_USE="^^ ( bash zsh )"

DEPEND="zsh? ( app-shells/zsh media-gfx/imagemagick )
		bash? ( app-shells/bash media-gfx/imagemagick )"
RDEPEND="${DEPEND}"

src_install(){
	cmake-utils_src_install

	if use zsh ; then
		sed -i "1s/bash/zsh/" ${S}/${PN}
	fi
	
	if use zsh || use bash ; then
		exeinto /usr/bin
		newexe ${S}/${PN} ${PN}.sh
	fi
}
