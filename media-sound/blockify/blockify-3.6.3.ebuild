# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

PYTHON_COMPAT=( python3_7 python3_8 python3_9 )

inherit distutils-r1

DESCRIPTION="Mutes Spotify advertisements"
HOMEPAGE="https://github.com/mikar/blockify"
SRC_URI="https://github.com/mikar/blockify/archive/v${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/dbus-python
		 x11-misc/wmctrl
         dev-python/docopt
         dev-python/gst-python
         dev-python/pygtk
         dev-python/setuptools
         media-libs/alsa-oss
         media-sound/pulseaudio
         media-sound/spotify"
DEPEND="${RDEPEND}"

python_compile_all () {
	distutils-r1_python_compile_all
}

python_install_all() {
	distutils-r1_python_install_all
}
