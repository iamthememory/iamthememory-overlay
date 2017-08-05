# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# From Michael Rose's bug report:
# <https://bugs.gentoo.org/show_bug.cgi?id=591996>

EAPI=6

inherit toolchain-funcs

DESCRIPTION="Hides mouse pointer while not in use. Airblader's xfixes rewrite"
HOMEPAGE="https://github.com/Airblader/unclutter-xfixes"
SRC_URI="https://github.com/Airblader/unclutter-xfixes/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/libX11
		 x11-libs/libXfixes
		 x11-libs/libXi
		 dev-libs/libev
		 !x11-misc/unclutter"

DEPEND="${RDEPEND}
		app-text/asciidoc
		virtual/pkgconfig"

src_compile() {
	emake CDEBUGFLAGS="${CFLAGS}" CC="$(tc-getCC)" LDOPTIONS="${LDFLAGS}"
}

src_install () {
	dobin unclutter
	doman "${WORKDIR}/${P}/man/unclutter-xfixes.1"
}
