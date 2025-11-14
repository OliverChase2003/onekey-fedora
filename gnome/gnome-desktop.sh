## gnome desktop

## default user dirs
download_dir = "$HOME/Downloads"
document_dir = "$HOME/Documents"
software_dir = "$HOME/Softwares"

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
	gnome-system-monitor
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
	decibals
	showtime
)
exclude_string=$(
	IFS=,
	echo "${exclude_pkgs[*]}"
)
## install gnome-desktop
sudo dnf group install gnome-desktop --exclude="${exclude_string}" -y

## add sound support
sudo dnf install -y \
	alsa-sof-firmware
## install wifi driver
sudo dnf install -y \
	iwlwifi-dvm-firmware \
	iwlwifi-mvm-firmware
## install language support
sudo dnf install -y \
	langpacks-core-zh_CN
## install some basic desktop apps
sudo dnf install -y \
	gnome-extensions-app \
	gnome-tweaks \
	gthumb \
	celluloid
## set graphic as default
sudo systemctl set-default graphical.target
