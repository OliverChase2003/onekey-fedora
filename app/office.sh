source ../var/var.sh

install_libreoffice() {
	sudo dnf group install -y \
		libreoffice
	sudo dnf install -y \
		libreoffice-langpack-zh-Hans
}

onlyoffice_url="https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors.x86_64.rpm"
install_onlyoffice() {
	curl -LO --output-dir "$download_dir" "$onlyoffice_url"
	sudo dnf install -y "$download_dir/onlyoffice-desktopeditors.x86_64.rpm"
}

case $1 in
	--libre)
		install_libreoffice
		;;
	--only)
		install_onlyoffice
		;;
	*)
		echo "Usage: $0 [--libre|--only]"
		exit 1
		;;
esac
