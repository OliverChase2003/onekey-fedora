akmod_sign_kernel() {
	sudo dnf install -y \
		kmodtool \
		akmods \
		mokutil \
		openssl

	sudo kmodgenca -a
	sudo mokutil --import /etc/pki/akmods/certs/public_key.der

    echo
    echo "Reboot and complete MOK enrollment from the blue MOK Manager screen."
}

case "$1" in
	--sign)
		akmod_sign_kernel
		;;
	*)
		echo "Usage: $0 [--install|--sign]"
		exit 1
		;;
esac
