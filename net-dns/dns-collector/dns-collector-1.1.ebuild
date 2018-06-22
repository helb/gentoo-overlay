# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Collects data from DNS server into CSV file"
HOMEPAGE="https://github.com/CZ-NIC/dns-collector"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-dns/knot-2.6.4 net-libs/libtrace"
RDEPEND="${DEPEND}"

DOCS="README.md entrada-columns.md"
