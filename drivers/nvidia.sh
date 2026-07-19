akmod_nvidia_install() {
	sudo dnf install -y \
		kernel-headers \
		kernel-devel \
		akmod-nvidia \
		nvidia-smi

	sudo akmods --force
	sudo dracut --force
}

case "$1" in
	--install)
		akmod_nvidia_install
		;;
	*)
		echo "Usage: $0 [--install]"
		exit 1
		;;
esac
