#!/bin/bash
#x11
cd
pkg update
termux-setup-storage

read -t 10 -p "是否安装termux-x11(Whether to install termux-x11)? [Y/n]" yes_or_no
case ${yes_or_no} in
  y | Y | "")
    pkg install x11-repo -y
    pkg install termux-x11-nightly -y
    read -t 10 -p "是否设置x11服务自动启动(Whether to to set x11 server start automatically)? [Y/n]" yes_or_no
      case ${yes_or_no} in
        y | Y | "")
          echo "export DISPLAY=:0 && termux-x11 :0 &" >> ~/.profile;;
        *)
          echo "放弃Abort";;
        esac;;
  *)
    echo "放弃Abort";;
esac

#pulseaudio
read -t 10 -p "是否安装pulseaudio(Whether to install pulseaudio)? [Y/n]" yes_or_no
case ${yes_or_no} in
  y | Y | "")
    pkg install pulseaudio -y
    read -t 10 -p "是否设置pulseaudio自动启动(Whether to to set pulseaudio start automatically)? [Y/n]" yes_or_no
    case ${yes_or_no} in
      y | Y | "")
        echo "pulseaudio --start --load=\"module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1\" --exit-idle-time=-1" >> ~/.profile
        echo "pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" >> ~/.profile;;
      *)
        echo "放弃Abort";;
    esac;;
  *)
    echo "放弃Abort";;
esac

#virgl
read -t 10 -p "是否安装virgl(Whether to install virgl)? [Y/n]" yes_or_no
case ${yes_or_no} in
  y | Y | "")
    pkg install virglrenderer-android -y
    read -t 10 -p "是否设置virgl自动启动(Whether to to set x11 server start automatically)? [Y/n]" yes_or_no
    case ${yes_or_no} in
      y | Y | "")
        echo "virgl_test_server_android &" >> ~/.profile
        echo "在要启用virgl硬件加速的应用前加GALLIUM_DRIVER=virpipe MESA_GL_VERSION_OVERRIDE=?.?(例如GALLIUM_DRIVER=virpipe MESA_GL_VERSION_OVERRIDE=?.? minetest硬件加速启动minetest)"
        echo "echo \"在要启用virgl硬件加速的应用前加GALLIUM_DRIVER=virpipe MESA_GL_VERSION_OVERRIDE=?.?(例如GALLIUM_DRIVER=virpipe MESA_GL_VERSION_OVERRIDE=?.? minetest硬件加速启动minetest)\"" >> ~/.profile;;
      *)
        echo "放弃Abort";;
    esac;;
  *)
    echo "放弃Abort";;
esac

pkg install proot-distro -y
read -t 10 -p "是否安装Debian(Whether to install debian)? [Y/n]" yes_or_no
case ${yes_or_no} in
  y | Y | "")
    proot-distro install debian
    echo "输入proot-distro login debian --user root --shared-tmp以root用户共享tmp登入debian"
    echo "echo \"输入proot-distro login debian --user root --shared-tmp以root用户共享tmp登入debian\"" >> ~/.profile
    echo "在debian中执行apt update && apt upgrade -y && apt install wget -y && wget https://raw.githubusercontent.com/gootlie/debian-on-termux/main/1user.sh && chmod +x ./1user.sh && ./1user.sh继续配置";;
  *)
    echo "放弃Abort";;
esac