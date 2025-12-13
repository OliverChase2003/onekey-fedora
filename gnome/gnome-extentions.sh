
download_dir="$HOME/downloads"
document_dir="$HOME/documents"
software_dir="$HOME/softwares"

## extensions
sudo dnf install python3-pip
pip install gnome-extensions-cli -i https://pypi.tuna.tsinghua.edu.cn/simple

extensions=(
	app-hider@lynith.dev
	appindicatorsupport@rgcjonas.gmail.com
	autohide-battery@sitnik.ru
	blur-my-shell@aunetx
	caffeine@patapon.info
	## clipboard-indicator@tudmotu.com
	compiz-alike-magic-lamp-effect@hermes83.github.com
	compiz-windows-effect@hermes83.github.com
	## drive-menu@gnome-shell-extensions.gcampax.github.com
	gnome-fuzzy-app-search@gnome-shell-extensions.Czarlie.gitlab.com
	## hide-volume-indicator@stephaniebread
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

## switch input source api
git clone https://github.com/herrscher-of-sleeping/gnome-input-source-dbus-interface \
	~/${software_dir}/gnome-input-source-dbus-interface/
cd ~/${software_dir}/gnome-input-source-dbus-interface/
make install ## install 
