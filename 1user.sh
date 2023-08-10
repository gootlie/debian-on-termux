#!/bin/bash
cd
#换源（清华源）
read -t 10 -p "是否换源为清华源(Weather to set mirrorlist to tsinghua)? [Y/n]" yes_or_no
case ${yes_or_no} in
y | Y | "")
echo "正在换源为清华源，原镜像文件备份为/etc/apt/sources.list.backup"
mv /etc/apt/sources.list /etc/apt/sources.list.backup
cat > /etc/apt/sources.list <<- EOF
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
# deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
# # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
deb https://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
# deb-src https://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
EOF
;;
*)
  echo "放弃Abort";;
esac

apt update && apt upgrade -y
apt install sudo -y

#设置用户
read -t 10 -p "是否添加一般用户(Whether to add a generic user)? [Y/n]" yes_or_no_user
case ${yes_or_no_user} in
  y | Y | "")
    echo "设置root密码(set the root password)"
    passwd
    groupadd storage
    groupadd wheel
    groupadd video
    groupadd audio
    
    read -p "输入你的用户名(Enter Your Username) > " your_username
    useradd -m -g users -G storage,wheel,video,audio -s /bin/bash ${your_username}
    
    echo "设置用户${your_username}的密码(set password of the user ${your_username})"
    passwd ${your_username}
    
    read -t 10 -p "若要继续使用脚本自动配置，请务必设置root权限！是否为用户${your_username}设置root权限(To continue using the script for automatic configuration, be sure to set root privileges!Whether to set root permissions for user ${your_username})? [Y/n]" yes_or_no
    case ${yes_or_no} in
      y | Y | "")
        usermod -a -G sudo ${your_username}
        echo "${your_username} ALL=(ALL:ALL) ALL" >> /etc/sudoers;;
      *)
        echo "放弃Abort";;
    esac
    #登入一般用户
    echo "输入su ${your_username}登入用户${your_username}";;
  *)
    echo "放弃Abort";;
esac

read -t 10 -p "是否继续配置桌面环境等(Weather to continue to set up)? [Y/n]" yes_or_no
case ${yes_or_no} in
  y | Y | "")
    echo "正在下载安装脚本(Downloading install script)"
    wget https://raw.githubusercontent.com/gootlie/debian-on-termux/main/2install.sh && chmod +x ./2install.sh
    case ${yes_or_no_user} in
    y | Y | "")
      mv ./2install.sh /home/${your_username}/ && chmod +x /home/${your_username}/2install.sh
      echo "正在为用户${your_username}进行配置"
      su - ${your_username} -s /home/${your_username}/2install.sh;;
    *)
      echo "正在为用户$USER进行配置"
      ./2install.sh;;
    esac;;
  *)
    echo "放弃Abort";;
esac