TERMUX_PKG_HOMEPAGE="https://esa.github.io/pagmo2/index.html"
TERMUX_PKG_DESCRIPTION="Scientific library for massively parallel optimization"
TERMUX_PKG_GROUPS="science"
TERMUX_PKG_LICENSE="LGPL-3.0, GPL-3.0"
TERMUX_PKG_LICENSE_FILE="COPYING.lgpl3"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="2.18.0"
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL="https://github.com/esa/pagmo2/archive/refs/tags/v$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=5ad40bf3aa91857a808d6b632d9e1020341a33f1a4115d7a2b78b78fd063ae31
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="libc++, boost, libtbb, eigen, nlopt"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DPAGMO_BUILD_TESTS=OFF
-DPAGMO_BUILD_BENCHMARKS=OFF
-DPAGMO_BUILD_TUTORIALS=OFF
-DPAGMO_WITH_EIGEN3=ON
-DPAGMO_WITH_NLOPT=ON
-DPAGMO_WITH_IPOPT=OFF
-DPAGMO_BUILD_STATIC_LIBRARY=OFF
"
