# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id: bibble5-plugins-brenda-1.0a.ebuild 1575 2010-02-12 22:25:14Z casta $

EAPI=2

inherit bibble5-plugins

DESCRIPTION="Sally is a selective color filter."
HOMEPAGE="http://www.kbarni.net/#Sally"
SRC_URI="http://www.weebly.com/uploads/2/2/0/4/2204711/sallytrial.zip"

KEYWORDS="~x86 ~amd64"
IUSE=""

PLUGINS=(
	"Sally.ui"
	"Sally.so"
)

bibble5-plugins-qa
