## icon theme

install_icon() {
	sudo dnf copr enable rivenirvana/morewaita-icon-theme
	sudo dnf install -y \
		morewaita-icon-theme
}

case $1 in
	--install)
		install_icon
		;;
	*)
		echo "Usage: $0 [--install]"
		exit 1
		;;
esac
