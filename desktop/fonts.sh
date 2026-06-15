source ../var/var.sh

nerdfont="LiberationMono"
nerdfonturl="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$nerdfont.zip"
font_dir="$HOME/.local/share/fonts"

install_dnf_fonts() {
	sudo dnf install -y \
		google-noto-sans-cjk-fonts \
		google-noto-sans-cjk-vf-fonts \
		google-noto-sans-mono-cjk-vf-fonts \
		google-noto-emoji-fonts \
		google-noto-color-emoji-fonts

	sudo dnf install -y \
		adobe-source-han-sans-cn-fonts \
		adobe-source-han-serif-cn-fonts \
		adobe-source-serif-pro-fonts \
		adobe-source-sans-pro-fonts
}

install_nerdfont() {
	mkdir -p "$font_dir"
	curl -Lo "$download_dir/$nerdfont.zip" "$nerdfonturl"
	unzip -o "$download_dir/$nerdfont.zip" -d "$font_dir"
}

case "${1:-install}" in
	--install | install)
		install_dnf_fonts
		install_nerdfont
		;;
	*)
		echo "Usage: $0 [--install]"
		exit 1
		;;
esac
