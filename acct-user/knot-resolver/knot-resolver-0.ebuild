# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="User for Knot Resolver"
ACCT_USER_ID=-1
ACCT_USER_HOME=/etc/kresd/
ACCT_USER_GROUPS=( knot-resolver )

acct-user_add_deps
