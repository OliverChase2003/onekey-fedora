## only run this script if secure boot not supportted
## otherwise you should run nvidia-sign.sh first
sudo dnf install -y \
	gcc \
	kernel-headers \
	kernel-devel \
	akmod-nvidia \
	nvidia-smi

sudo akmods --force
sudo dracut --force

