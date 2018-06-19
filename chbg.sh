#!/bin/bash
#这是一个更换桌面壁纸的脚本,把脚本放到计划任务中运行即可
ls /root/图片/*.{jpg,png} > /root/picture
a=`cat /root/picture | wc -l`
num=$[RANDOM%$a+1]
pic=`sed -n ''"$num"'p' /root/picture`
\cp $pic /usr/share/backgrounds/tedu-wallpaper-01.png
