## bugjump plymouth theme
source ../var/var.sh

bugjumpplymouthurl="https://github.com/ChenPi11/bugjump.git"
theme="bugjump"

sudo dnf install plymouth-plugin-*

git clone $bugjumpplymouthrul $software_dir/$theme

sudo cp -r $download_dir/$theme/bugjump/ \
	/usr/share/plymouth/themes/

sudo plymouth-set-default-theme bugjump
