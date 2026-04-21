## install vm pkgs
sudo dnf install -y \
	virt-manager \
	libvirt \
	qemu-kvm

## enable libvirt and add usr groups
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt $USER

