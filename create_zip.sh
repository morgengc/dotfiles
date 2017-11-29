#################################################
# 一键创建zip文件
#
# gaochao.morgen@gmail.com
# 2017/11/29
#################################################

#!/bin/sh

cd src 
zip -r dotfiles.zip . -i * 
mv dotfiles.zip .. 
cd ..

