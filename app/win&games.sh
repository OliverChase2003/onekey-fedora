sudo dnf install -y \
	steam \
	bottles

## uudeck
sudo mkdir -p /home/deck/
sudo chown /home/deck/
sudo firewall-cmd --permanent --add-port=16363/tcp

curl -s uudeck.com | sudo bash

