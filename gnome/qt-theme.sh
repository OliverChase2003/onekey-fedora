download_dir="$HOME/downloads"
document_dir="$HOME/documents"
software_dir="$HOME/softwares"

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
## compile QT6 version and install
cmake -DUSE_QT6=true -DHAS_QT6_SUPPORT=true ..
make
sudo cp src/libqwhitesurgtkdecorations.so \
	/usr/lib64/qt6/plugins/wayland-decoration-client/
