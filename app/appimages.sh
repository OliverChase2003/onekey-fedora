source ../var/var.sh

appimagetool_url="https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage"

install_deps() {
	sudo dnf install -y \
		fuse \
		fuse-devel \
		fuse3
}

install_appimagelauncher() {
	curl -sL https://api.github.com/repos/TheAssassin/AppImageLauncher/releases/latest \
		| jq -r '.assets[] | select(.name | test("x86_64.*\\.rpm$")) | .browser_download_url' \
		| xargs curl -LO --output-dir "$download_dir"

	sudo dnf install -y "$download_dir"/appimagelauncher*x86_64.rpm
}

install_appimagetool() {
	curl -sL https://api.github.com/repos/AppImage/appimagetool/releases/latest \
		| jq -r '.assets[] | select(.name == "appimagetool-x86_64.AppImage") | .browser_download_url' \
		| xargs curl -LO --output-dir "$software_dir/appimages"

	chmod +x "$software_dir/appimages/appimagetool*.AppImage"
}

install_linuxdeploy() {
	curl -sL https://api.github.com/repos/linuxdeploy/linuxdeploy/releases/latest \
		| jq -r '.assets[] | select(.name | test("x86_64.*\\.AppImage$")) | .browser_download_url' \
		| xargs curl -LO --output-dir "$software_dir/appimages"

	chmod +x $software_dir/appimages/linuxdeploy*.AppImage
}

case $1 in
	--install)
		install_deps
		install_appimagelauncher
		install_appimagetool
		install_linuxdeploy
		;;
	*)
		echo "Usage: $0 [--install]"
		exit 1
		;;
esac
