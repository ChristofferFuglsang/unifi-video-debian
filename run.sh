#!/bin/bash
#This script is fire-and-forget - do not handle errors and expects everything to go well.
download_url=https://dl.ubnt.com/firmwares/unifi-video/3.6.3/unifi-video_3.6.3~Debian7_amd64.deb
file_name="${download_url##*/}"
ip=$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

sudo /usr/bin/apt-get update -y
sudo /usr/bin/apt-get upgrade -f -y
wget $download_url
sudo /usr/bin/apt-get -f -y install
sudo dpkg -i $file_name
rm $file_name

echo "Install complete - installation file deleted."
echo "The new interface can be accessed at https://"$ip":7443" 
