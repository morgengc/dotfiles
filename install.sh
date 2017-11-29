#################################################
# 一键安装dotfiles
#
# gaochao.morgen@gmail.com
# 2017/11/29
#################################################

#!/bin/sh

/bin/bash ./backup_dotfiles.sh
/bin/bash ./create_zip.sh
unzip -o dotfiles.zip -d ~
