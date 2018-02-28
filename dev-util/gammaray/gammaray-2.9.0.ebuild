# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Tool to poke around in a Qt-application and also to manipulate the application to some extent"
HOMEPAGE="http://www.kdab.com/gammaray"
MY_PN="GammaRay"
SRC_URI="https://github.com/KDAB/${MY_PN}/archive/v${PV}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

DEPEND="
dev-qt/qtcore
dev-qt/qtgui
"

RDEPEND="${DEPEND}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

