## gtk theme
source ../var/var.sh

## themes url
whitesurgtk_url="https://github.com/vinceliuice/WhiteSur-gtk-theme.git"
theme="WhiteSur-gtk-theme"
theme_dir="$HOME/.local/share/themes/"

install_theme() {
	if [ -d "$software_dir/$theme" ]; then
		echo "Error: $software_dir/$theme already exists" >&2
		exit 1
	fi

	git clone "${whitesurgtk_url}" "$software_dir/$theme" --depth 1
	chmod +x "$software_dir/$theme/install.sh"
	chmod +x "$software_dir/$theme/tweaks.sh"

	sh "$software_dir/$theme/install.sh" \
		--dest $theme_dir \
		--opacity normal \
		--color light \
		--nautilus glassy \
		--libadwaita \
		--shell -i fedora -b default -p 60 -h bigger -normal \
		--round --darker
}

update_theme() {
	if [ ! -d "$software_dir/$theme" ]; then
		echo "Error: $software_dir/$theme not found" >&2
		exit 1
	fi

	cd "$software_dir/$theme" || exit 1
	git pull
	sh "$software_dir/$theme/install.sh" \
		--dest $theme_dir \
		--opacity normal \
		--color light \
		--nautilus glassy \
		--libadwaita \
		--shell -i fedora -b default -p 60 -h bigger -normal \
		--round --darker
}

install_4gdm() {
	sudo sh "$software_dir/$theme/tweaks.sh" \
		--gdm -i fedora -noblur ## gdm theme
}

install_4firefox() {
	sudo sh "$software_dir/$theme/tweaks.sh" \
		--firefox flat ## firefox theme
}

case "${1:-install}" in
	--install | install)
		install_theme
		;;
	--gdm)
		install_4gdm
		;;
	--firefox)
		install_4firefox
		;;
	--update)
		update_theme
		;;
	*)
		echo "Usage: $0 [--install|--update]"
		exit 1
		;;
esac
