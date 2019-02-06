# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5,6} )

inherit distutils-r1 git-r3

DESCRIPTION="Python library to use Jabber/XMPP networks in a non-blocking way"
HOMEPAGE="https://dev.gajim.org/gajim/python-nbxmpp"
KEYWORDS="~amd64"
EGIT_REPO_URI="https://dev.gajim.org/gajim/python-nbxmpp.git"
EGIT_COMMIT="nbxmpp-${PV}"
SLOT="0"
LICENSE="BSD"
IUSE=""
