#!/bin/bash
sudo apt install /sdcard/xinhao/wps/wps-office*.deb -y
#或sudo apt install cabextract libglu1-mesa libmspack0 libopengl0 ttf-mscorefonts-installer -y
sudo dpkg -i /sdcard/xinhao/wps/wps-office*.deb

#解决无法打开pdf问题(libtiff5，其依赖于libwebp6)
wget https://raw.githubusercontent.com/gootlie/debian-on-termux/main/libwebp6_0.6.1-2.1 deb11u1_arm64.deb
sudo dpkg -i ./libwebp6*.deb
rm ./libwebp6*.deb
wget https://raw.githubusercontent.com/gootlie/debian-on-termux/main/libtiff5_4.1.0 git191117-2~deb10u8_arm64.deb
sudo dpkg -i ./libtiff5*.deb
rm ./libtiff5*.deb

#字体库缺失
wget https://raw.githubusercontent.com/gootlie/debian-on-termux/main/WindowsFonts.sh && chmod +x ./WindowsFonts.sh && ./WindowsFonts.sh