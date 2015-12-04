# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-utils user

DESCRIPTION="Layer 2 P2P VPN. Meyerd's development fork."
HOMEPAGE="http://www.ntop.org/products/n2n/ https://github.com/meyerd/n2n"
EGIT_REPO_URI="https://github.com/meyerd/n2n.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/n2n_v2"

pkg_setup() {
	enewgroup n2n
	enewuser n2n -1 -1 /var/empty n2n
}

pkg_preinst() {
	keepdir /var/log/n2n
	fowners n2n:n2n /var/log/n2n

	newconfd "${FILESDIR}/supernode.confd" supernode
	newinitd "${FILESDIR}/supernode.initd" supernode
	newconfd "${FILESDIR}/edge.confd" edge
	newinitd "${FILESDIR}/edge.initd" edge
}
