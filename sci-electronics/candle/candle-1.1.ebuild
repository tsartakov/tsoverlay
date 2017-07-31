EAPI=6

inherit qmake-utils

DESCRIPTION="grblControler - GRBL controller application with G-Code visualizer written in Qt."
HOMEPAGE="https://github.com/Denvi/Candle"

MY_PN="Candle"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}/src"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
    dev-qt/qtcore:5
    dev-qt/qtgui:5
    dev-qt/qtopengl:5
    dev-qt/qtserialport:5
    dev-qt/qtwidgets:5
"
RDEPEND="${DEPEND}"

PATCHES=("${FILESDIR}/patches/${PV}")

src_configure() {
    eqmake5 candle.pro
}
