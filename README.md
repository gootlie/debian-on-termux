# debian-on-termux 
1. 自用termux安装脚本，归档以便再次部署。本脚本实现了在termux中安装debian系统，用termux-x11显示图形界面，安装精简的xfce4桌面环境，并可扩展配置中文、音频、fcitx5输入法、vnc服务等，提供了awesome+picom的平铺式窗口管理器的方案。
2. 本脚本基本实现了自动安装，除系统的交互外均为无操作10秒自动继续进行。
## 基本安装
1. 安装termux和termux-x11，[termux](https://github.com/termux/termux-app)可使用[ZeroTermux](https://github.com/hanxinhao000/ZeroTermux)，相比原版增加了许多实用的功能。[termux-x11](https://github.com/termux/termux-x11)需要安装apk并在termux内安装deb，本脚本会自动安装在termux中安装deb，请自行[下载apk](https://raw.githubusercontent.com/gootlie/debian-on-termux/main/app-arm64-v8a-debug.apk)安装，若不想使用本仓库提供的安装包，也可在官方[last successful build](https://github.com/termux/termux-x11/actions/workflows/debug_build.yml)下载安装。
2. 在termux中执行

   `pkg install wget -y && wget https://raw.githubusercontent.com/gootlie/debian-on-termux/main/0termux.sh && chmod +x ./0termux.sh && ./0termux.sh`  

   若下载速度慢可执行`termux-change-repo`换为国内源。
3. 安装Debian后执行`proot-distro login debian --user root --shared-tmp`进入proot容器的Debian系统，此时登录用户为root。`--shared-tmp`参数共享`\tmp`目录，否则不能使用termux-x11输出图形。
4. 在proot容器内执行

   `apt update && apt upgrade -y && apt install wget -y && wget https://raw.githubusercontent.com/gootlie/debian-on-termux/main/1user.sh && chmod +x ./1user.sh && ./1user.sh` 

   若下载速度慢可自行换源，在/etc/sources.list中添加镜像源。

   推荐创建一般用户，创建以后在termux内可以执行`proot-distro login debian --user 你的用户名 --shared-tmp`以你创建的用户登录Debian。
## 扩展安装
1. vnc

   若要使用vnc显示图形(本脚本已默认允许外部访问，可以远程对系统进行控制)，在proot容器内执行`wget https://raw.githubusercontent.com/gootlie/debian-on-termux/main/vnc.sh && chmod +x ./vnc.sh && ./vnc.sh`。本脚本可为xfce4和awesome配置vnc，并可自定输出端口。
2. awesome+picom(还可以自行配置xfce4+picom的方案) 

   若要使用awesome+picom的方案，在proot容器内执行

   `wget https://raw.githubusercontent.com/gootlie/debian-on-termux/main/DE.sh && chmod +x ./DE.sh && ./DE.sh` 
3. WindowsFonts字体库 

   若要安装WindowsFonts字体库，请自行寻找相关字体资源或从Windos电脑的C:\Windows\Fonts目录复制字体文件，将字体文件放在手机/平板文件的/xinhao/WindowsFonts文件夹下(没有则自行创建，或在本仓库中下载的WindosFonts.sh脚本中修改文件路径)，然后执行

   `wget https://raw.githubusercontent.com/gootlie/debian-on-termux/main/WindowsFonts.sh && chmod +x ./WindowsFonts.sh && ./WindowsFonts.sh`

   为节省空间，本脚本采用对字体文件创建软链接的方式实现。安装Windows字体库可解决WPS字体缺失问题。
4. box+wine

   若想运行exe文件，在proot容器内执行

   `wget https://raw.githubusercontent.com/gootlie/debian-on-termux/main/wine.sh && chmod +x ./wine.sh && ./wine.sh`   

   此脚本来源于[Termux Proot安裝Box64與Box86，Android手機執行Windows exe](https://ivonblog.com/posts/termux-proot-box86-box64/)，运行部分应用如微信、网易云时尚有报错未能解决。
## 配置详解
