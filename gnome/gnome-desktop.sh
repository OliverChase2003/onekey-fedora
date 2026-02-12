## gnome desktop

source ../var/var.sh

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
sudo dnf install -y \
	xdg-terminal-exec
## install some basic desktop apps
sudo dnf install -y \
	firefox \
	kitty \
	gnome-extensions-app \
	gnome-tweaks \
	gthumb \
	celluloid

## nautilus
##sudo dnf copr enable monkeygold/nautilus-open-any-terminal -y
##sudo dnf install nautilus-open-any-terminal
##gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty

## set graphic as default
## sudo systemctl set-default graphical.target
