dkms_sign_kernel() {
    sudo dnf install -y \
        dkms \
        mokutil \
		openssl \

	sudo mokutil --import /var/lib/dkms/mok.pub
	sudo mokutil --list-new

    echo
    echo "Reboot and complete MOK enrollment from the blue MOK Manager screen."
}

case "$1" in
	--sign)
		dkms_sign_kernel
		;;
	*)
		echo "Usage: $0 [--sign]"
		exit 1
		;;
esac
