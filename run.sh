#!/bin/bash
download_url=https://dl.ubnt.com/firmwares/unifi-video/3.6.3/unifi-video_3.6.3~Debian7_amd64.deb
file_name=unifi-video_3.6.3~Debian7_amd64.deb
ip=$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

sudo /usr/bin/apt-get -V update -f -y --fix-missing
sudo /usr/bin/apt-get -V upgrade -f -y
wget $download_url
sudo /usr/bin/apt-get -f -y install
sudo dpkg -i $file_name
rm $file_name

echo "Install complete - installation file deleted."
echo "The new interface can be accessed at https://"$ip":7443" 
