# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mercurial meson

DESCRIPTION="An obs-studio plugin that allows you to screen capture on wlroots based wayland compositors"
HOMEPAGE="https://hg.sr.ht/~scoopta/wlrobs"
EHG_REPO_URI="https://hg.sr.ht/~scoopta/wlrobs"

LICENSE="GPL3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-video/obs-studio"
RDEPEND="${DEPEND}"
BDEPEND=""
