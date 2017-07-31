EAPI=6

inherit qmake-utils flag-o-matic versionator

DESCRIPTION="grblControler - GRBL controller application with G-Code visualizer written in Qt."
HOMEPAGE="https://github.com/Denvi/Candle"

MY_PN="Candle"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}/src"

LICENSE=""
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

pkg_pretend() {
    if [[ ${MERGE_TYPE} != binary ]]; then
        if ! test-flag-CXX -std=c++11; then
            eerror "${P} requires C++11-capable C++ compiler. Your current compiler"
            eerror "does not seem to support -std=c++11 option. Please upgrade your compiler"
            eerror "to gcc-4.7 or an equivalent version supporting C++11."
            die "Currently active compiler does not support -std=c++11"
        fi
    fi
}

src_prepare() {
    eapply "${FILESDIR}/${PN}-1.1-fix-gl-program-point-size-definition.patch"
    eapply "${FILESDIR}/${PN}-1.1-fix-qglformat-definition.patch"
    eapply "${FILESDIR}/${PN}-1.1-fix-install-path.patch"

    eapply_user
}

src_configure() {
    eqmake5 candle.pro
}
