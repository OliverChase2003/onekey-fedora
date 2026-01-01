## add user group
## virtual mechine
sudo usermod -aG libvirt $(whoami)
## usb device
sudo usermod -aG dialout $(whoami)

set xdg user dirs
mkdir -p \
	$HOME/downloads \
	$HOME/pictures \
	$HOME/videos \
	$HOME/music \
	$HOME/documents \
	$HOME/documents/templates \
	$HOME/documents/public \
	$HOME/softwares \
	$HOME/.config \
	$HOME/.cache \
	$HOME/.local

cp ./user-dirs.dirs $HOME/.config
