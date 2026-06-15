nvidia_install() {
	sudo dnf install -y \
		gcc \
		kernel-headers \
		kernel-devel \
		akmod-nvidia \
		nvidia-smi

	sudo akmods --force
	sudo dracut --force
}

nvidia_sign_kernel() {
	sudo dnf install -y \
		kmodtool \
		akmods \
		mokutil \
		openssl

	sudo kmodgenca -a
	sudo mokutil --import /etc/pki/akmods/certs/public_key.der
}

case "$1" in
	--install)
		nvidia_install
		;;
	--sign)
		nvidia_sign_kernel
		;;
	*)
		echo "Usage: $0 [--install|--sign]"
		exit 1
		;;
esac
