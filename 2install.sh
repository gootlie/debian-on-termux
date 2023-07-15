#!/bin/bash
#xfce4
read -t 10 -p "是否精简安装xfce4? [Y/n]" yes_or_no
case ${yes_or_no} in
  y | Y | "")
    sudo apt install xfdesktop4 xfwm4 xfce4-session xfce4-panel dbus dbus-x11 -y
    echo "export DISPLAY=:0" >> /usr/local/bin/startx
    echo "dbus-launch --exit-with-session startxfce4 &" >> /usr/local/bin/startx
    #plank
    read -t 10 -p "是否用Plank取代默认Dock(Whether to replace the default Dock with Plank) [Y/n]" yes_or_no
    case ${yes_or_no} in
      y | Y | "")
        sudo apt install plank -y
        echo "sleep 6 && plank &" >> /usr/local/bin/startx
        echo "请在xfce4-panel面板设置中移除面板2(Remove Panel 2 from xfce4-panel Settings)";;
      *)
        echo "放弃Abort";;
    esac
  
    chmod +x /usr/local/bin/startx
    echo "输入startx启动xfce4桌面"
    echo "echo \"输入startx启动xfce4桌面\"" >> ~/.bashrc;;
  *)
    echo "放弃Abort";;
esac

read -t 10 -p "是否安装附加组件(xfce4-appfinder,thunar,xfce4-terminal,xarchiver,gvfs)? [Y/n]" yes_or_no
case ${yes_or_no} in
  y | Y | "")
    sudo apt install xfce4-appfinder thunar xfce4-terminal xarchiver gvfs -y;;
  *)
    echo "放弃Abort";;
esac

#中文
read -t 10 -p "是否将语言设置为简体中文(Whether to set the language to Chinese Simplified)? [Y/n]" yes_or_no
case ${yes_or_no} in
  y | Y | "")
    sudo apt install locales -y
    echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
    sudo locale-gen
    echo "LANG=zh_CN.UTF-8" >> /etc/locale.conf
    sudo apt install fonts-wqy-microhei -y
    
    echo "正在将简体中文设为默认语言"
    echo "LANG=zh_CN.UTF-8" >> ~/.profile
    echo "LC_CTYPE=zh_CN.UTF-8" >> ~/.profile
    echo "LC_NUMERIC=zh_CN.UTF-8" >> ~/.profile
    echo "LC_TIME=zh_CN.UTF-8" >> ~/.profile
    echo "LC_COLLATE=zh_CN.UTF-8" >> ~/.profile
    echo "LC_MONETARY=zh_CN.UTF-8" >> ~/.profile
    echo "LC_MESSAGES=zh_CN.UTF-8" >> ~/.profile
    echo "LC_PAPER=zh_CN.UTF-8" >> ~/.profile
    echo "LC_NAME=zh_CN.UTF-8" >> ~/.profile
    echo "LC_ADDRESS=zh_CN.UTF-8" >> ~/.profile
    echo "LC_TELEPHONE=zh_CN.UTF-8" >> ~/.profile
    echo "LC_MEASUREMENT=zh_CN.UTF-8" >> ~/.profile
    echo "LC_IDENTIFICATION=zh_CN.UTF-8" >> ~/.profile
    echo "LC_ALL=" >> ~/.profile;;
  *)
    echo "放弃Abort";;
esac

#时区
read -t 10 -p "是否将时区设置为Shanghai(Whether to set the timezone to Shanghai)? [Y/n]" yes_or_no
case ${yes_or_no} in
  y | Y | "")
    sudo ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime;;
  *)
    echo "放弃Abort";;
esac

#pulseaudio音频
read -t 10 -p "是否安装pulseaudio音频服务(Whether to install pulseaudio)? [Y/n]" yes_or_no
case ${yes_or_no} in
  y | Y | "")
    sudo apt install pulseaudio -y;;
  *)
    echo "放弃Abort";;
esac

#fcitx5输入法
read -t 10 -p "是否安装fcitx5输入法(Whether to install fcitx5 Input Method)? [Y/n]" yes_or_no
case ${yes_or_no} in
  y | Y | "")
    sudo apt install --no-install-recommends fcitx5 fcitx5-pinyin fcitx5-config-qt -y
    
    echo "正在将fcitx5设为默认输入法"
    echo "XIM=fcitx5" >> /etc/environment
    echo "XIM_PROGRAM=fcitx5" >> /etc/environment
    echo "GTK_IM_MODULE=fcitx5" >> /etc/environment
    echo "QT_IM_MODULE=fcitx5" >> /etc/environment
    echo "XMODIFIERS=@im=fcitx5" >> /etc/environment
    echo "SDL_IM_MODULE=fcitx5" >> /etc/environment
    echo "GLFW_IM_MODULE=fcitx5" >> /etc/environment;;
  *)
    echo "放弃Abort";;
esac

echo "安装完成，请退出termux重新进入"