TERMUX_PKG_HOMEPAGE=https://gitlab.com/volian/nala
TERMUX_PKG_DESCRIPTION="Commandline frontend for the apt package manager"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.12.1
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://gitlab.com/volian/nala/-/archive/v${TERMUX_PKG_VERSION}/nala-v${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=98738c0cc98bc4b35a2c246632336febbfe7c9aaa210336f56f75baa219b3906
TERMUX_PKG_DEPENDS="python-apt"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_PYTHON_COMMON_DEPS="poetry"
TERMUX_PKG_PYTHON_TARGET_DEPS="anyio, httpx, jsbeautifier, pexpect, python-debian, rich, tomli, typer, typing-extensions"

termux_step_pre_configure() {
	rm -rf nala/__init__.py.orig
}

termux_step_post_make_install() {
	install -Dm600 -t $TERMUX_PREFIX/etc/nala debian/nala.conf
}

termux_step_create_debscripts() {
	cat <<- EOF > ./postinst
	#!$TERMUX_PREFIX/bin/sh
	mkdir -p $TERMUX_PREFIX/var/lib/nala
	mkdir -p $TERMUX_PREFIX/var/log/nala
	mkdir -p $TERMUX_PREFIX/var/lock
	echo "Installing dependencies through pip..."
	pip3 install ${TERMUX_PKG_PYTHON_TARGET_DEPS//, / }
	EOF
}
