## important!!!: before running this, you have to run firefox
## once then close it, gtk theme need firefox to be opened
## once.

download_dir="$HOME/Downloads"
document_dir="$HOME/Documents"
software_dir="$HOME/Softwares"

## themes url
whitesurgtk_url="https://gitcode.com/gh_mirrors/wh/WhiteSur-gtk-theme.git"
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
)
for ext in "${extensions[@]}"; do
	echo "installing extension: $ext"
	gnome-extensions-cli install "$ext"
done

## gtk theme
git clone "${whitesurgtk_url}" \
	"${software_dir}/WhiteSur-gtk-theme/" --depth 1
# install theme for desktop
chmod +x ~/Downloads/WhiteSur-gtk-theme/install.sh ## enable .sh file
chmod +x ~/Downloads/WhiteSur-gtk-theme/tweaks.sh  ## enable .sh file

sh ${software_dir}/WhiteSur-gtk-theme/install.sh \
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

## QT theme
## install dnf packages to compile decorations
sudo dnf install -y \
	qt5-qtbase-devel \
	qt5-qtbase-private-devel \
	qt5-qtdeclarative-devel \
	qt5-qtsvg-devel \
	qt5-qtwayland-devel \
	qt5-qtbase-static \
	qt5ct \
	qt6-qtbase-devel \
	qt6-qtbase-private-devel \
	qt6-qtdeclarative-devel \
	qt6-qtsvg-devel \
	qt6-qtwayland-devel \
	qt6-qtbase-static \
	qt6ct \
	wayland-devel

## clone QT decoration
git clone ${whitesurqt_url} \
	${software_dir}/QWhiteSurGtkDecorations/
cd ${software_dir}/QWhiteSurGtkDecorations/
mkdir build && cd build

## compile QT5 version and install
cmake -DHAS_QT6_SUPPORT=true ..
make
sudo cp src/libqwhitesurgtkdecorations.so \
	/usr/lib64/qt5/plugins/wayland-decoration-client/
## compile QT6 version and install
cmake -DUSE_QT6=true -DHAS_QT6_SUPPORT=true ..
make
sudo cp src/libqwhitesurgtkdecorations.so \
	/usr/lib64/qt6/plugins/wayland-decoration-client/

## fonts
## Nerd Fonts install
git clone https://gitcode.com/gh_mirrors/ne/nerd-fonts.git \
	${software_dir}/nerd-fonts/ --depth 1
chmod +x ${download_dir}/nerd-fonts/install.sh
sh ${software_dir}/nerd-fonts/install.sh JetBrainsMono
## sh ${download_dir}/nerd-fonts/install.sh CascadiaMono

## dnf font packages
sudo dnf install -y \
	google-noto-sans-cjk-fonts \
	google-noto-sans-cjk-vf-fonts \
	google-noto-sans-mono-cjk-vf-fonts \
	google-noto-sans-emoji-fonts
