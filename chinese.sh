#!/bin/bash
#中文
read -t 10 -p "是否将语言设置为简体中文(Whether to set the language to Chinese Simplified)? [Y/n]" yes_or_no
case ${yes_or_no} in
  y | Y | "")
    sudo apt install locales -y
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
    echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
    sudo locale-gen
    sudo apt install fonts-wqy-microhei -y
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