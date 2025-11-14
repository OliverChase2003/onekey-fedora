## important!!!: before running this, you have to run firefox
## once then close it, gtk theme need firefox to be opened
## once.

download_dir="$HOME/downloads"
document_dir="$HOME/documents"
software_dir="$HOME/softwares"

## themes url
whitesurgtk_url="https://github.com/vinceliuice/WhiteSur-gtk-theme.git"
whitesurqt_url="https://github.com/FengZhongShaoNian/QWhiteSurGtkDecorations.git"

## extensions
sudo dnf install python3-pip
pip install gnome-extensions-cli -i https://pypi.tuna.tsinghua.edu.cn/simple

extensions=(
	app-hider@lynith.dev
	appindicatorsupport@rgcjonas.gmail.com
	autohide-battery@sitnik.ru
	blur-my-shell@aunetx
	caffeine@patapon.info
	clipboard-indicator@tudmotu.com
	compiz-alike-magic-lamp-effect@hermes83.github.com
	compiz-windows-effect@hermes83.github.com
	drive-menu@gnome-shell-extensions.gcampax.github.com
	gnome-fuzzy-app-search@gnome-shell-extensions.Czarlie.gitlab.com
	hide-volume-indicator@stephaniebread
	quick-settings-audio-panel@rayzeq.github.io
	system-monitor@gnome-shell-extensions.gcampax.github.com
	transparent-window-moving@noobsai.github.com
	user-theme@gnome-shell-extensions.gcampax.github.com
	workspace-indicator@gnome-shell-extensions.gcampax.github.com
	dash-to-dock@micxgx.gmail.com
)
for ext in "${extensions[@]}"; do
	echo "installing extension: $ext"
	gnome-extensions-cli install "$ext"
done

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
