TERMUX_PKG_HOMEPAGE=https://github.com/OwO-Network/nexttrace-enhanced
TERMUX_PKG_DESCRIPTION="An open source visual routing tool that pursues light weight"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.1.11-beta.5"
TERMUX_PKG_SRCURL=https://github.com/OwO-Network/nexttrace-enhanced/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=f71795ae9aff9a93b9bb64461b297c1fdb478d3b46438e70a81a6ca15e5e39b1
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_golang

	go mod init || :
	go mod tidy
}

termux_step_make() {
	go build
}

termux_step_make_install() {
	install -Dm700 -t "${TERMUX_PREFIX}"/bin nexttrace
}
