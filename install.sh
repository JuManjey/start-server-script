echo "Updating..."
apt-get update && apt-get upgrade && apt-get dist-upgrade && apt autoclean && apt autoremove -y
echo "OK"
echo "Install python python2 python3 wget curl git htop tmux screen python3-pip memcached libmemcached-tools php-memcached deluge firefox"
apt-get install python python3 wget curl git htop tmux screen python3-pip memcached libmemcached-tools php-memcached deluge firefox command-not-found tldr vim nano git curl wget htop bash-completion xz-utils zip unzip ufw locales net-tools mc jq make gcc gpg build-essential ncdu sysstat -y
pip install pymemcache python-memcached software-properties-common  -y
tldr update
echo "OK"
echo "Install Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "OK"
echo "Install X2GO"
apt-get install xubuntu-desktop x2goserver x2goserver-xsession x2goclient -y
echo "OK"
echo "Install VirtualBox"
sudo apt-get install linux-headers-5.4.0-100-generic
sudo apt-get install virtualbox virtualbox-ext-pack virtualbox-guest-additions-iso virtualbox-qt -y
modprobe vboxdrv
modprobe vboxnetadp
echo "OK"
echo "Install Webmin..."
echo "deb http://download.webmin.com/download/repository sarge contrib" | sudo tee -a /etc/apt/sources.list
wget -q -O- http://www.webmin.com/jcameron-key.asc | sudo apt-key add
sudo apt update -y
sudo apt install webmin -y
sudo ufw allow 10000
echo "Install Docker"
sudo apt install wget -y
wget -O get-docker.sh https://get.docker.com
sudo sh get-docker.sh
sudo apt install -y docker-compose
rm -f get-docker.sh
sudo usermod -aG docker $USER
echo "OK"
echo "Install Portainer..."
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    cr.portainer.io/portainer/portainer-ce:2.11.0
echo "OK"
echo "Install Go"
cd $HOME
wget -O go1.17.1.linux-amd64.tar.gz https://golang.org/dl/go1.17.1.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.1.linux-amd64.tar.gz && rm go1.17.1.linux-amd64.tar.gz
echo 'export GOROOT=/usr/local/go' >> $HOME/.bash_profile
echo 'export GOPATH=$HOME/go' >> $HOME/.bash_profile
echo 'export GO111MODULE=on' >> $HOME/.bash_profile
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> $HOME/.bash_profile && . $HOME/.bash_profile
go version
echo "OK"
apt-get install -f
apt-get update && apt-get upgrade && apt-get dist-upgrade && apt autoclean && apt autoremove -y





