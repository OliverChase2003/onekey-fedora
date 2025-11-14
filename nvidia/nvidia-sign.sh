## run this script first if secure boot supportted then run nvidia-inst.sh
## if there's no secure boot on your computer, dont run this script

## install sign tools
sudo dnf install -y \
	kmodtool \
	akmods \
	mokutil \
	openssl

## sign to the kernel
sudo kmodgenca -a
sudo mokutil --import /etc/pki/akmods/certs/public_key.der

