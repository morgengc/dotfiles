#####################################################
# 将输入文件按照列对齐方式重排
# 用法：gawk -f alignColumn.awk urfile
# 作者：Chao.Gao@cisdi.com.cn
# 日期：2013.5.16
#####################################################

BEGIN {
	FS = "[ \t,;]+";
	# max[i]:    第i行的所有域中，最大域的长度
	# fpl[i]:    第i行的域数. 域：每行由FS符号分隔开的都是域
	# data[i,j]: 第i行的第j个域
}
{
	fpl[FNR] = NF;
	for (i=1; i<=NF; i++) {
		data[FNR, i] = $i;
		if (length($i) > max[i]) {
			max[i] = length($i);
		}
	}
}
END { 
	for (l=1; l<=FNR; l++) { # 处理END块时，已经读到文件最后一行. 因此此时的FNR就是文件的行数
		for (i=1; i<=fpl[l]; i++) {
			fmt = "%-" max[i] "s";
			if (i > 1) {
				printf " "; # 此为每列(除第一列)前默认设置的一个空格
			}
			printf(fmt, data[l, i]);
		}
		printf "\n";
	}
}

