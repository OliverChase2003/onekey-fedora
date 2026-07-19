source ../var/var.sh

install_gnome_desktop() {
	## list excluded pkgs
	exclude_pkgs=(
		gnome-boxes
		gnome-connections
		gnome-software
		gnome-text-editor
		gnome-calendar
		gnome-characters
		gnome-contacts
		gnome-logs
		gnome-maps
		gnome-weather
		gnome-epub-thumbnailer
		gnome-user-docs
		gnome-user-share
		gnome-classic-session
		gnome-clocks
		gnome-color-manager
		gnome-font-viewer
		loupe
		sushi
		snapshot
		baobab
		simple-scan
		totem
		evince
		evince-djvu
		yelp
		rygel
		gnome-calculator
		gnome-tour
		malcontent-control
		malcontent-ui-libs
		papers
		decibels
		showtime
		ptyxis
	)

	exclude_string=$(
		IFS=,
		echo "${exclude_pkgs[*]}"
	)

	## install gnome-desktop
	sudo dnf group install gnome-desktop --exclude="${exclude_string}" -y
}

install_workstation_repo() {
	sudo dnf install -y fedora-workstation-repositories
}

install_base_packages() {
	## add sound support
	sudo dnf install -y \
		alsa-sof-firmware \
		alsa-utils
	## install wifi driver
	sudo dnf install -y \
		iwlwifi-dvm-firmware \
		iwlwifi-mvm-firmware
	## install language support
	sudo dnf install -y \
		langpacks-core-zh_CN
}

install_desktop_apps() {
	sudo dnf install -y \
		kitty \
		gnome-extensions-app \
		gnome-tweaks \
		gthumb \
		celluloid \
		ibus-rime
}

set_graphic_default() {
	sudo systemctl set-default graphical.target
}

set_gsetting_opts() {
	## xdg-terminal-exec
	sudo dnf install -y \
		xdg-terminal-exec
	## nautilus open
	sudo dnf copr enable monkeygold/nautilus-open-any-terminal -y && sudo dnf update -y
	sudo dnf install -y \
		nautilus-open-any-terminal
}

case "$1" in
	--install)
		install_gnome_desktop
		install_alsa_support
		install_base_packages
		install_desktop_apps
		set_gsetting_opts
		;;
	--graph_default)
		set_graphic_default
		;;
	*)
		echo "Usage: $0 [--install|--graph_default]"
		exit 1
		;;
esac
