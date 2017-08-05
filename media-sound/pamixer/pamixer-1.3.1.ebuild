# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="Pulseaudio command line mixer"
HOMEPAGE="https://github.com/cdemoulins/pamixer"
SRC_URI="https://github.com/cdemoulins/pamixer/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-sound/pulseaudio
		dev-libs/boost"
RDEPEND="${DEPEND}"

src_compile() {
	# The Makefile uses -std=c++11, but only if CXXFLAGS is undefined.
	emake CXXFLAGS="${CXXFLAGS} -std=c++11"
}

src_install() {
	dobin pamixer
}
