#################################################
# 	备份各种配置文件，在释放dotfiles.zip之前使用
#
# 	gaochao.morgen@gmail.com
# 	2017/11/29
#################################################

#!/bin/sh

DOT_FILE_LIST=(".bashrc" ".bash_logout" ".bash_profile" ".dircolors" ".inputrc" ".shell" ".tmp" ".vim" ".vimrc")

# Make a backup directory
cd ~
HOME_DIR=`pwd`
BACKUP_DIR=".backup"
mkdir -p $BACKUP_DIR

echo "Backup dotfiles ..."

# List all files and directories. Ignore '.' and '..'
FILES=`/bin/ls -A $HOME_DIR`

# Copy dotfiles into backup directory
for dotfile in $FILES
do
	# if `dotfile` in DOT_FILE_LIST
	if echo "${DOT_FILE_LIST[@]}" | grep -w "$dotfile" &>/dev/null; then
		echo "Backup $dotfile into $BACKUP_DIR ..." 
		cp -rf $dotfile $BACKUP_DIR
	fi
done

echo "Done"

