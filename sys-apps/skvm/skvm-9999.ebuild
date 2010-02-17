# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit mercurial

DESCRIPTION="A lightweight volume manager."
HOMEPAGE="http://tools.suckless.org/skvm"
EHG_REPO_URI="http://hg.suckless.org/skvm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="sys-apps/hal sys-apps/dbus"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_unpack() {
	mercurial_src_unpack
#	cd "${S}"
#	epatch "${FILESDIR}"/Makefile-rc.d-init.d.patch
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	newinitd "${FILESDIR}"/skvm.rc skvm
	exeinto /usr/bin
	doexe skvm
}
