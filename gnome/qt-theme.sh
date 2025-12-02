download_dir="$HOME/downloads"
document_dir="$HOME/documents"
software_dir="$HOME/softwares"

## packages
sudo dnf install -y \
	wayland-devel

sudo dnf install -y \
	qt5-qtbase-devel \
	qt5-qtsvg-devel \
	qt5-qtwayland-devel \
	qt5-qtbase-devel \
	qt5-qtbase-static \
	qt5-qtbase-private-devel \
	qt5ct \
	
sudo dnf install -y \
	qt6-qtbase-devel \
	qt6-qtsvg-devel \
	qt6-qtwayland-devel \
	qt6-qtbase-devel \
	qt6-qtbase-static \
	qt6-qtbase-private-devel \
	qt6ct \

## themes url
whitesurqt_url="https://github.com/FengZhongShaoNian/QWhiteSurGtkDecorations.git"

## clone QT decoration
git clone ${whitesurqt_url} \
	${software_dir}/QWhiteSurGtkDecorations/
cd ${software_dir}/QWhiteSurGtkDecorations/
mkdir build && cd build

## compile QT5 version and install
cmake -DHAS_QT6_SUPPORT=true ..
make
sudo cp src/libqwhitesurgtkdecorations.so \
	/usr/lib64/qt5/plugins/wayland-decoration-client/
cd .. && rm build -rf

## compile QT6 version and install
mkdir build && cd build
cmake -DUSE_QT6=true -DHAS_QT6_SUPPORT=true ..
make
sudo cp src/libqwhitesurgtkdecorations.so \
	/usr/lib64/qt6/plugins/wayland-decoration-client/
