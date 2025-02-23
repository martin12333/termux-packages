TERMUX_PKG_HOMEPAGE=https://electrum.org
TERMUX_PKG_DESCRIPTION="Electrum is a lightweight Bitcoin wallet"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=4.3.3
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://download.electrum.org/$TERMUX_PKG_VERSION/Electrum-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=34f5c67db1234fd97cf199c66c3704dfea06c53853cd6ed87deb01cecb06b1b7
TERMUX_PKG_DEPENDS="python, libsecp256k1"
TERMUX_PKG_PYTHON_TARGET_DEPS="'qrcode', 'protobuf<4,>=3.12', 'qdarkstyle>=2.7', 'aiorpcx<0.23,>=0.22.0', 'aiohttp<4.0.0,>=3.3.0', 'aiohttp_socks>=0.3', 'certifi', 'bitstring', 'attrs>=19.2.0', 'dnspython>=2.0'"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true
# asciinema previously contained some files that python packages have in common
TERMUX_PKG_CONFLICTS="asciinema (<< 1.4.0-1)"
TERMUX_PKG_PYTHON_COMMON_DEPS="wheel"

termux_step_create_debscripts() {
	cat <<- EOF > ./postinst
	#!$TERMUX_PREFIX/bin/sh
	echo "Installing dependencies through pip..."
	pip3 install ${TERMUX_PKG_PYTHON_TARGET_DEPS//, / }
	EOF
}
