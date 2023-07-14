#fonts字体
read -t 10 -p "是否安装Windows字体库(Whether to install Windows Fonts)? [Y/n]" yes_or_no
case ${yes_or_no} in
  y | Y | "")
    sudo ln -s /sdcard/xinhao/WindowsFonts /usr/share/fonts
    sudo fc-cache;;
  *)
    echo "放弃Abort";;
esac