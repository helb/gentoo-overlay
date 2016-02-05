# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-r3

DESCRIPTION="MPD Web GUI - written in C, utilizing Websockets and Bootstrap/JS"
HOMEPAGE="http://www.ympd.org"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="static openssl repo-nofre"

if use repo-nofre; then
    EGIT_REPO_URI="https://github.com/nofre/ympd.git"
else
    EGIT_REPO_URI="https://github.com/notandy/ympd.git"
fi

DEPEND=">=net-libs/libwebsockets-9999[openssl?]"
RDEPEND="${DEPEND}"

src_configure() {
    local mycmakeargs=(
        $(cmake-utils_use_with static STATIC_WEBSOCKETS)
    )
    cmake-utils_src_configure
}

src_install() {
    cmake-utils_src_install
    newconfd "${FILESDIR}"/${PN}.confd ${PN}
    newinitd "${FILESDIR}"/${PN}.initd ${PN}
}
