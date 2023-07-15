#!/bin/bash
#vnc
read -t 10 -p "是否安装tigervnc(Whether to install tigervnc)? [Y/n]" yes_or_no
case ${yes_or_no} in
  y | Y | "")
    sudo apt install tigervnc-standalone-server tigervnc-tools -y
    echo "设置VNC密码(set the VNC password)"
    vncpasswd
    echo "geometry=1920x1200" >> ~/.vnc/config
    echo "localhost=no" >> ~/.vnc/config
    
    #xfce4
    read -t 10 -p "是否为xfce4配置vnc服务(Whether to set vnc server for xfce4)? [Y/n]" yes_or_no
    case ${yes_or_no} in
      y | Y | "")
        echo -e "dbus-launch --exit-with-session startxfce4 &\nsleep6 && plank" >> ~/.vnc/xfce4 && chmod +x ~/.vnc/xfce4
        echo "vncserver -xstartup ~/.vnc/xfce4 :\${1:-1}" >> /usr/local/bin/vncx && chmod +x /usr/local/bin/vncx
        echo "输入vncx 端口数(例:vncwm 2,缺省为1)启动xfce4(vnc)"
        echo "echo \"输入vncx 端口数(例:vncwm 2,缺省为1)启动xfce4(vnc)\"" >> ~/.bashrc;;
      *)
        echo "放弃Abort";;
    esac
    
    #awesome+picom
    read -t 10 -p "是否为awesome配置vnc服务(Whether to set vnc server for awesome)? [Y/n]" yes_or_no
    case ${yes_or_no} in
      y | Y | "")
        echo -e "awesome &\npicom" >> ~/.vnc/wm && chmod +x ~/.vnc/wm
        echo "vncserver -xstartup ~/.vnc/wm :\${1:-1}" >> /usr/local/bin/vncwm && chmod +x /usr/local/bin/vncwm
        echo "输入vncwm 端口数(例:vncwm 2,缺省为1)启动Awesome+picom(vnc)"
        echo "echo \"输入vncwm 端口数(例:vncwm 2,缺省为1)启动Awesome+picom(vnc)\"" >> ~/.bashrc;;
      *)
        echo "放弃Abort";;
    esac;;
  *)
    echo "放弃Abort";;
esac