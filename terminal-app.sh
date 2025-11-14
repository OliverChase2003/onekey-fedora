## enable yazi copr
sudo dnf copr enable lihaohong/yazi -y

## install terminal apps
sudo dnf install -y \
	tmux \
	nvim \
	yazi \
	fzf \
	btop \
	stow

## install toolchain apps
sudo dnf install -y \
	gcc \
	g++ \
	make \
	cmake \
	python3 \
	python3-pip \
	java-21-openjdk
