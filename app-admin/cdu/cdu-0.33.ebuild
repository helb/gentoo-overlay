# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="cdu is a perl script which call du and display a pretty histogram"
HOMEPAGE="http://arsunik.free.fr/prog/cdu.html"
SRC_URI="http://arsunik.free.fr/pkg/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="virtual/perl-PodParser virtual/perl-Getopt-Long"
RDEPEND="${DEPEND}"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}
