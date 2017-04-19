#!/bin/bash

download_url=https://dl.ubnt.com/firmwares/unifi-video/3.6.3/unifi-video_3.6.3~Debian7_amd64.deb

#Update and upgrade
sudo /usr/bin/apt-get -V update -f -y
sudo /usr/bin/apt-get -V dist-upgrade -f -y

#download unifi video package
wget $download_url

sudo /usr/bin/apt-get -f install

dpkg -i unifi-video_3.6.3~Debian7_amd64.deb
