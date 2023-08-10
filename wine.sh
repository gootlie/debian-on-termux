#!/bin/bash
#tools
sudo apt install git build-essential cmake wget
sudo dpkg --add-architecture armhf
sudo apt update && sudo apt upgrade -y
sudo apt install gpg -y
sudo apt install libgl1:armhf libgl1 -y
sudo apt install libasound2:armhf libc6:armhf libglib2.0-0:armhf libgphoto2-6:armhf libgphoto2-port12:armhf libgstreamer-plugins-base1.0-0:armhf libgstreamer1.0-0:armhf libpcap0.8:armhf libpulse0:armhf libsane1:armhf libudev1:armhf libusb-1.0-0:armhf libx11-6:armhf libxext6:armhf ocl-icd-libopencl1:armhf libasound2-plugins:armhf libncurses6:armhf libcap2-bin:armhf libcups2:armhf libdbus-1-3:armhf libfontconfig1:armhf libfreetype6:armhf libglu1-mesa:armhf libgnutls30:armhf libgssapi-krb5-2:armhf libkrb5-3:armhf libodbc1:armhf libosmesa6:armhf libsdl2-2.0-0:armhf libv4l-0:armhf libxcomposite1:armhf libxcursor1:armhf libxfixes3:armhf libxi6:armhf libxinerama1:armhf libxrandr2:armhf libxrender1:armhf libxxf86vm1:armhf -y
sudo apt install libasound2 libc6 libglib2.0-0 libgphoto2-6 libgphoto2-port12 libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 libpcap0.8 libpulse0 libsane1 libudev1 libunwind8 libusb-1.0-0 libx11-6 libxext6 ocl-icd-libopencl1 libasound2-plugins libncurses6 libcap2-bin libcups2 libdbus-1-3 libfontconfig1 libfreetype6 libglu1-mesa libgnutls30 libgssapi-krb5-2 libkrb5-3 libodbc1 libosmesa6 libsdl2-2.0-0 libv4l-0 libxcomposite1 libxcursor1 libxfixes3 libxi6 libxinerama1 libxrandr2 libxrender1 libxxf86vm1 -y
sudo apt clean && sudo apt autoremove

#box86
cd ~/
sudo apt install libc6:armhf
sudo apt install gcc-arm-linux-gnueabihf
git clone https://github.com/ptitSeb/box86
cd box86
mkdir build; cd build; cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
make -j$(nproc)
sudo make install

#box64
cd ~/
git clone https://github.com/ptitSeb/box64.git
cd box64 && mkdir build && cd build
cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
make -j$(nproc)
sudo make install

#wine
cd ~/
mkdir wine && cd wine
wget https://github.com/Kron4ek/Wine-Builds/releases/download/8.11/wine-8.11-amd64.tar.xz
tar -xvf wine-8.11-amd64.tar.xz
mv ~/wine/wine-8.11-amd64/* ~/wine
rm -rf wine-8.11-amd64.tar.xz wine-8.11-amd64
sudo ln -s ~/wine/bin/wine64 /usr/local/bin/wine64
sudo ln -s ~/wine/bin/wine /usr/local/bin/wine
cd ~/