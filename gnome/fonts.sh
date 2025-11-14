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
