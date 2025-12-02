## important!!!: before running this, you have to run firefox
## once then close it, gtk theme need firefox to be opened
## once.

download_dir="$HOME/downloads"
document_dir="$HOME/documents"
software_dir="$HOME/softwares"

## themes url
whitesurgtk_url="https://github.com/vinceliuice/WhiteSur-gtk-theme.git"
whitesurqt_url="https://github.com/FengZhongShaoNian/QWhiteSurGtkDecorations.git"

## gtk theme
git clone "${whitesurgtk_url}" \
	"${software_dir}/WhiteSur-gtk-theme/" --depth 1
# install theme for desktop
chmod +x "${software_dir}/WhiteSur-gtk-theme/install.sh" ## enable .sh file
chmod +x "${software_dir}/WhiteSur-gtk-theme/tweaks.sh"  ## enable .sh file

sh "${software_dir}/WhiteSur-gtk-theme/install.sh" \
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
