## c/cpp
sudo dnf group install -y \
	c-development

## java
sudo dnf install -y \
	java-*-openjdk

## python
sudo dnf install -y \
	python3 \
	Python3-devel \
    python3-pip \

## go
sudo dnf install -y \
	golang

## rust
sudo dnf install -y \
	rustup
rustup-init -y

## node
sudo dnf install -y \
	nodejs \
	npm

