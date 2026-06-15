## qt theme
source ../var/var.sh
whitesurqt_url="https://github.com/FengZhongShaoNian/QWhiteSurGtkDecorations.git"
theme="QWhiteSurGtkDecorations"

install_deps() {
	sudo dnf install -y \
		wayland-devel

	sudo dnf install -y \
		qt5-qtbase-devel \
		qt5-qtsvg-devel \
		qt5-qtwayland-devel \
		qt5-qtbase-devel \
		qt5-qtbase-static \
		qt5-qtbase-private-devel \
		qt5ct

	sudo dnf install -y \
		qt6-qtbase-devel \
		qt6-qtsvg-devel \
		qt6-qtwayland-devel \
		qt6-qtbase-devel \
		qt6-qtbase-static \
		qt6-qtbase-private-devel \
		qt6ct
}

build_and_install() {
	cd "$software_dir/$theme" || exit 1

	## modify decoration size and look
	sed -i.bak \
		-e 's|^static constexpr int ceButtonSpacing = 6;|static constexpr int ceButtonSpacing = 8;|' \
		-e 's|^static constexpr int ceButtonMarginRight = 15;|static constexpr int ceButtonMarginRight = 11;|' \
		-e 's|^static constexpr int ceTitlebarHeight = 38;|static constexpr int ceTitlebarHeight = 32;|' \
		./src/qwhitesurgtkdecorations.cpp

	## compile QT5 version and install
	mkdir build && cd build
	cmake -DHAS_QT6_SUPPORT=true .. && make
	sudo cp src/libqwhitesurgtkdecorations.so \
		/usr/lib64/qt5/plugins/wayland-decoration-client/
	cd .. && rm build -rf

	## compile QT6 version and install
	mkdir build && cd build
	cmake -DUSE_QT6=true -DHAS_QT6_SUPPORT=true .. && make
	sudo cp src/libqwhitesurgtkdecorations.so \
		/usr/lib64/qt6/plugins/wayland-decoration-client/
	cd .. && rm build -rf
}

install_theme() {
	if [ -d "$software_dir/$theme" ]; then
		echo "Error: $software_dir/$theme already exists" >&2
		exit 1
	fi

	git clone "$whitesurqt_url" "$software_dir/$theme"
	build_and_install
}

update_theme() {
	if [ ! -d "$software_dir/$theme" ]; then
		echo "Error: $software_dir/$theme not found" >&2
		exit 1
	fi

	cd "$software_dir/$theme" || exit 1
	git pull
	build_and_install
}

case "${1:-install}" in
	--install | install)
		install_deps
		install_theme
		;;
	--update)
		update_theme
		;;
	*)
		echo "Usage: $0 [--install|--update]"
		exit 1
		;;
esac
