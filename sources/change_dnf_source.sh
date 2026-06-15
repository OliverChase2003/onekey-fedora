#!/bin/bash

install_rpmfusion() {
	if [ ! -f /etc/yum.repos.d/rpmfusion-free.repo ]; then
		sudo dnf install -y \
			"https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
			"https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
	fi
}

switch_ustc() {
	install_rpmfusion

	sudo sed -i.bak \
		-e 's|^metalink=|#metalink=|g' \
		-e 's|^#baseurl=http://download.example/pub/fedora/linux|baseurl=https://mirrors.ustc.edu.cn/fedora|g' \
		-e 's|^baseurl=https://mirrors\.tuna\.tsinghua\.edu\.cn/fedora|baseurl=https://mirrors.ustc.edu.cn/fedora|g' \
		/etc/yum.repos.d/fedora.repo \
		/etc/yum.repos.d/fedora-updates.repo

	sudo sed -i.bak \
		-e 's|^metalink=|#metalink=|g' \
		-e 's|^#baseurl=http://download1.rpmfusion.org|baseurl=https://mirrors.ustc.edu.cn/rpmfusion|g' \
		-e 's|^baseurl=https://mirrors\.tuna\.tsinghua\.edu\.cn/rpmfusion|baseurl=https://mirrors.ustc.edu.cn/rpmfusion|g' \
		/etc/yum.repos.d/rpmfusion*.repo
}

switch_tsinghua() {
	install_rpmfusion

	sudo sed -i.bak \
		-e 's|^metalink=|#metalink=|g' \
		-e 's|^#baseurl=http://download.example/pub/fedora/linux|baseurl=https://mirrors.tuna.tsinghua.edu.cn/fedora|g' \
		-e 's|^baseurl=https://mirrors\.ustc\.edu\.cn/fedora|baseurl=https://mirrors.tuna.tsinghua.edu.cn/fedora|g' \
		/etc/yum.repos.d/fedora.repo \
		/etc/yum.repos.d/fedora-updates.repo

	sudo sed -i.bak \
		-e 's|^metalink=|#metalink=|g' \
		-e 's|^#baseurl=http://download1.rpmfusion.org|baseurl=https://mirrors.tuna.tsinghua.edu.cn/rpmfusion|g' \
		-e 's|^baseurl=https://mirrors\.ustc\.edu\.cn/rpmfusion|baseurl=https://mirrors.tuna.tsinghua.edu.cn/rpmfusion|g' \
		/etc/yum.repos.d/rpmfusion*.repo
}

reset_sources() {
	sudo sed -i \
		-e 's|^#metalink=|metalink=|g' \
		-e 's|^baseurl=https://mirrors\.|#baseurl=https://mirrors.|g' \
		/etc/yum.repos.d/fedora.repo \
		/etc/yum.repos.d/fedora-updates.repo

	for f in /etc/yum.repos.d/rpmfusion*.repo; do
		[ -f "$f" ] && sudo sed -i \
			-e 's|^#metalink=|metalink=|g' \
			-e 's|^baseurl=https://mirrors\.|#baseurl=https://mirrors.|g' \
			"$f"
	done
}

case "${1:-}" in
	ustc)
		switch_ustc
		;;
	tsinghua)
		switch_tsinghua
		;;
	reset)
		reset_sources
		;;
	*)
		echo "Usage: $0 [ustc|tsinghua|reset]"
		exit 1
		;;
esac
