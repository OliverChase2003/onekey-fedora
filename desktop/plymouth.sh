## bugjump plymouth theme
source ../var/var.sh

bugjumpplymouthurl="https://github.com/ChenPi11/bugjump.git"
theme="bugjump"

install_deps() {
	sudo dnf install plymouth-plugin-*
}

install_bugjump_plymouth() {
	git clone $bugjumpplymouthrul $software_dir/$theme
	sudo cp -r $download_dir/$theme/bugjump/ \
		/usr/share/plymouth/themes/
}

set_bugjump_theme() {
	sudo plymouth-set-default-theme bugjump
}

case $1 in
	--install)
		install_deps
		install_bugjump_plymouth
		;;
	*)
		echo "$0 [--install]"
		exit 1
		;;
esac
