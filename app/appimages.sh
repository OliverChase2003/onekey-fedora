sudo dnf install -y \
	fuse \
	fuse-devel \
	fuse3

## install AppImageLauncher
curl -sL https://api.github.com/repos/TheAssassin/AppImageLauncher/releases/latest \
	| jq -r '.assets[] | select(.name | test("x86_64.*\\.rpm$")) | .browser_download_url' \
	| xargs curl -LO --output-dir /home/oliver/downloads

sudo dnf install -y \
	~/downloads/appimagelauncher*x86_64.rpm
