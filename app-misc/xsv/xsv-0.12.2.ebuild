# Copyright 2017-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.1.4

EAPI=6

CRATES="
aho-corasick-0.6.3
byteorder-1.0.0
chan-0.1.19
csv-1.0.0-beta.4
csv-core-0.1.3
csv-index-0.1.3
docopt-0.7.0
filetime-0.1.10
kernel32-sys-0.2.2
lazy_static-0.2.8
libc-0.2.23
log-0.3.8
memchr-1.0.1
num-0.1.37
num-bigint-0.1.37
num-complex-0.1.37
num-integer-0.1.34
num-iter-0.1.33
num-rational-0.1.36
num-traits-0.1.37
num_cpus-1.4.0
quickcheck-0.4.1
quote-0.3.15
rand-0.3.15
regex-0.2.2
regex-syntax-0.4.1
rustc-serialize-0.3.24
serde-1.0.8
serde_derive-1.0.8
serde_derive_internals-0.15.1
streaming-stats-0.1.28
strsim-0.6.0
syn-0.11.11
synom-0.11.3
tabwriter-1.0.3
thread-id-3.1.0
thread_local-0.3.3
threadpool-1.3.2
unicode-width-0.1.4
unicode-xid-0.0.4
unreachable-0.1.1
utf8-ranges-1.0.0
void-1.0.2
winapi-0.2.8
winapi-build-0.1.1
xsv-0.12.2
"

inherit cargo

DESCRIPTION="A high performance CSV command line toolkit."
HOMEPAGE="https://github.com/BurntSushi/xsv"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="Unlicense/MIT" # Update to proper Gentoo format
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""
