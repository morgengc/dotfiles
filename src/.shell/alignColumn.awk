#####################################################
# �������ļ������ж��뷽ʽ����
# �÷���gawk -f alignColumn.awk urfile
# ���ߣ�Chao.Gao@cisdi.com.cn
# ���ڣ�2013.5.16
#####################################################

BEGIN {
	FS = "[ \t,;]+";
	# max[i]:    ��i�е��������У������ĳ���
	# fpl[i]:    ��i�е�����. ��ÿ����FS���ŷָ����Ķ�����
	# data[i,j]: ��i�еĵ�j����
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
	for (l=1; l<=FNR; l++) { # ����END��ʱ���Ѿ������ļ����һ��. ��˴�ʱ��FNR�����ļ�������
		for (i=1; i<=fpl[l]; i++) {
			fmt = "%-" max[i] "s";
			if (i > 1) {
				printf " "; # ��Ϊÿ��(����һ��)ǰĬ�����õ�һ���ո�
			}
			printf(fmt, data[l, i]);
		}
		printf "\n";
	}
}

