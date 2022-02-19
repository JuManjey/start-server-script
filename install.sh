echo "Updating..."
apt-get update && apt-get upgrade && apt-get dist-upgrade && apt autoclean && apt autoremove -y
echo "OK"
echo "Install X2GO"
apt-get install xubuntu-desktop x2goserver x2goserver-xsession x2goclient -y
echo "OK"
echo "Install Webmin..."
echo "deb http://download.webmin.com/download/repository sarge contrib" | sudo tee -a /etc/apt/sources.list
wget -q -O- http://www.webmin.com/jcameron-key.asc | sudo apt-key add
sudo apt update -y
sudo apt install webmin -y
sudo ufw allow 10000












