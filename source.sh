## === rpm source === ##
## rpmfusion
sudo dnf install \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## change to tsinghua source
sudo sed -e 's|^metalink=|#metalink=|g' \
	-e 's|^#baseurl=http://download.example/pub/fedora/linux|baseurl=https://mirrors.tuna.tsinghua.edu.cn/fedora|g' \
	-i.bak \
	/etc/yum.repos.d/fedora.repo \
	/etc/yum.repos.d/fedora-updates.repo

sudo sed -e 's!^metalink=!#metalink=!g' \
	-e 's!^mirrorlist=!#mirrorlist=!g' \
	-e 's!^#baseurl=!baseurl=!g' \
	-e 's!https\?://download1\.rpmfusion\.org/!https://mirrors.tuna.tsinghua.edu.cn/rpmfusion/!g' \
	-i.bak /etc/yum.repos.d/rpmfusion*.repo
