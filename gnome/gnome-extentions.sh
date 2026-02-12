## extensions

source ../var/var.sh

## pip
sudo dnf install python3-pip
pip install gnome-extensions-cli -i https://pypi.tuna.tsinghua.edu.cn/simple

extensions=(
	app-hider@lynith.dev
	appindicatorsupport@rgcjonas.gmail.com
	auto-move-windows@gnome-shell-extensions.gcampax.github.com
	autohide-battery@sitnik.ru
	blur-my-shell@aunetx
	caffeine@patapon.info
	compiz-alike-magic-lamp-effect@hermes83.github.com
	compiz-windows-effect@hermes83.github.com
	gnome-fuzzy-app-search@gnome-shell-extensions.Czarlie.gitlab.com
	quick-settings-audio-panel@rayzeq.github.io
	system-monitor@gnome-shell-extensions.gcampax.github.com
	transparent-window-moving@noobsai.github.com
	user-theme@gnome-shell-extensions.gcampax.github.com
	dash-to-dock@micxgx.gmail.com
	input-source-dbus-interface@raiden_fumo ## provide gdbus api to auto switch im in vim like editor
	ibus-tweaker@tuberry.github.com
)

for ext in "${extensions[@]}"; do
	echo "installing extension: $ext"
	gnome-extensions-cli install "$ext"
done

