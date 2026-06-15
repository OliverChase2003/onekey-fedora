## extensions
source ../var/var.sh

extensions=(
	app-hider@lynith.dev
	appindicatorsupport@rgcjonas.gmail.com
	auto-move-windows@gnome-shell-extensions.gcampax.github.com
	autohide-battery@sitnik.ru
	blur-my-shell@aunetx
	caffeine@patapon.info
	compiz-alike-magic-lamp-effect@hermes83.github.com
	compiz-windows-effect@hermes83.github.com
	dash-to-dock@micxgx.gmail.com
	gnome-fuzzy-app-search@gnome-shell-extensions.Czarlie.gitlab.com
	ibus-tweaker@tuberry.github.com
	input-source-dbus-interface@raiden_fumo
	moveclock@kuvaus.org
	system-monitor@gnome-shell-extensions.gcampax.github.com
	user-theme@gnome-shell-extensions.gcampax.github.com
	vim-altTab@kokong.info
)

install_pip_deps() {
	pip install gnome-extensions-cli -i https://pypi.tuna.tsinghua.edu.cn/simple
}

install_extention() {
	for ext in "${extensions[@]}"; do
		echo "installing extension: $ext"
		gnome-extensions-cli install "$ext"
	done
}

case "$1" in
	--install)
		install_pip_deps
		install_extention
		;;
	*)
		echo "Usage: $0 [--install]"
		exit 1
		;;
esac
