## others

source ../var/var.sh

## plymouth themes
## bugjump
git clone https://github.com/ChenPi11/bugjump.git \
	${download_dir}/bugjump/
sudo cp -r ${download_dir}/bugjump/bugjump/ \
	/usr/share/plymouth/themes/

sudo dnf install plymouth-plugin-*
sudo plymouth-set-default-theme bugjump
