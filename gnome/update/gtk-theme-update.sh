source ../var/var.sh

cd ${software_dir}/WhiteSur-gtk-theme/

git pull

sh "./install.sh" \
	--dest "/home/oliver/.local/share/themes/" \
	--opacity normal \
	--color light \
	--nautilus glassy \
	--libadwaita \
	--shell -i fedora -b default -p 60 -h bigger -normal \
	--round --darker

# install theme for firefox & gdm
##sudo sh ${software_dir}/WhiteSur-gtk-theme/tweaks.sh \
##	--gdm -i fedora -noblur ## gdm theme
sudo sh ${software_dir}/WhiteSur-gtk-theme/tweaks.sh \
	--firefox flat ## firefox theme
