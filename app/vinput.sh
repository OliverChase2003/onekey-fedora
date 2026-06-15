source ../var/var.sh

just_talk_url="https://github.com/whoamihappyhacking/just-talk-go"
software="just-talk-go"

install_deps() {
	sudo dnf install -y \
		libXinerama-devel \
		wayland-devel \
		alsa-utils \
		wl-clipboard
}

clone_and_build() {
	if [ -d "$software_dir/$software" ]; then
		echo "Error: $software_dir/$software already exists" >&2
		exit 1
	fi

	git clone $just_talk_url "$software_dir/$software"

	cd "$software_dir/$software" || exit 1
	CGO_ENABLED=1 go build -o build/just-talk ./cmd/just-talk
	make install
}

update_and_rebuild() {
	if [ ! -d "$software_dir/$software" ]; then
		echo "Error: $software_dir/$software not found" >&2
		exit 1
	fi

	cd "$software_dir/$software" || exit 1
	git pull
	CGO_ENABLED=1 go build -o build/just-talk ./cmd/just-talk
	make install
}

case "${1:-install}" in
	--install | install)
		install_deps
		clone_and_build
		;;
	--update)
		update_and_rebuild
		;;
	--deps)
		install_deps
		;;
	*)
		echo "Usage: $0 [--install|--update|--deps]"
		exit 1
		;;
esac
