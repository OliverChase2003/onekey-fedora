download_dir="$HOME/downloads"
document_dir="$HOME/documents"
software_dir="$HOME/softwares"

rm ${software_dir}/QWhiteSurGtkDecorations/build/ -r

## cd to dir
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
