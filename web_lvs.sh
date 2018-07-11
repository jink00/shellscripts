#!/bin/bash
#this is web lvs auto increment reduce
vip=201.1.1.4:80
while :
do
	for ip in 192.168.4.{2,3}
	do
		curl $ip &>/dev/null
		web_stat=$?
		ipvsadm -Ln | grep $ip &>/dev/null
		web_in_lvs=$?
		if [ $web_stat -ne 0 -a $web_in_lvs -eq 0 ];then
			ipvsadm -d -t $vip -r $ip
			echo "$ip已删除"
		elif [ $web_stat -eq 0 -a $web_in_lvs -ne 0 ];then
			ipvsadm -a -t $vip -r $ip
			echo "$ip已添加"
		fi
	done
	sleep 1
done
