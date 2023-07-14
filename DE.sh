sudo apt install --no-install-recommends awesome picom -y
cat >> /usr/local/bin/startwm <<- EOF
export DISPLAY=:0
awesome &
picom &
fcitx5 &
EOF

chmod +x /usr/local/bin/startwm
echo "输入startwm启动Awesome+picom"
echo "echo \"输入startwm启动Awesome+picom\"" >> ~/.bashrc

#picom配置
mkdir ~/.config/picom
cp /sdcard/Download/picom.conf ~/.config/picom/
#awesome配置
cp /etc/xdg/awesome/rc.lua /etc/xdg/awesome/rc.lua.backup #备份
cp /sdcard/Download/rc.lua /etc/xdg/awesome/