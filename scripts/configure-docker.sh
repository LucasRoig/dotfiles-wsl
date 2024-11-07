echo Installing docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
rm get-docker.sh
echo YOU NEED TO CHOOSE iptables-legacy
sudo update-alternatives --config iptables