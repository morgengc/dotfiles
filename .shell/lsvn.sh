#################################################
# 显示当前目录下那些子目录由 SVN 维护，以颜色区分
#
# gaochao.morgen@gmail.com
# 2016/12/09
#################################################

#!/bin/sh

# 颜色定义
cNO="\033[00m"     #还原
cFR="\033[01;31m"  #红色前景
cFG="\033[01;32m"  #绿色前景
cFY="\033[01;33m"  #黄色前景
cFB="\033[01;34m"  #兰色前景
cFM="\033[01;35m"  #艳红前景
cFC="\033[01;36m"  #浅兰前景
cFL="\033[01;37m"  #亮白前景

if test -d "$1"
then
	CURDIR=$1
else
	CURDIR=.
fi

# 列出当前目录下的所有子目录
# 以不同颜色区分子目录下是否含有".svn"目录
FILES=`ls $CURDIR`
for i in $FILES
do
	if [ $i != '.' ]
	then
		SUBDIR=$CURDIR/$i
		if [ -d "$SUBDIR" ]
		then
			DOTSVN=`find $SUBDIR -maxdepth 1 -type d -name .svn`
			if [ -n "$DOTSVN" ]
			then
				echo -e "$cFM"`basename $SUBDIR`"$cNO"
				echo -e "\t$cFL"`cat $SUBDIR/.svn/entries | grep "://" | head -n 1`"$cNO"
			#else
			#	echo -e "$cFB"`basename $SUBDIR`"$cNO"
			fi
		fi
	fi
done

