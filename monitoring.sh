#!/usr/bin/bash
        UNIX_NAME=$(uname -a)
		#OSやハードウェアの情報を表示　https://linuxjm.osdn.jp/html/GNU_coreutils/man1/uname.1.html
        CPU_physical=$(cat /proc/cpuinfo | grep physical.id | sort -u | wc -l)
		#CPUの情報を確認する https://www.motokis-brain.com/article/100
        vCPU=$(cat /proc/cpuinfo | grep processor | wc -l)
		#CPUの情報を確認する https://www.motokis-brain.com/article/100
        Memory_total=$(free -m | awk 'NR == 2 {print $2 "MB"}')         Memory_used=$(free -m | awk 'NR == 2 {print $3}')
		#システムの空きメモリと利用メモリの量を表示する。  https://linuxjm.osdn.jp/html/procps/man1/free.1.html
        Memory_usage=$(free -m | awk 'NR == 2{printf "%d/%dMB (%4.2f%%)" ,$3, $2, $3/$2 *100}')
		#システムの空きメモリと利用メモリの量を表示する。  https://linuxjm.osdn.jp/html/procps/man1/free.1.html
        Disk_Usage=$(df -h | grep root | awk '{printf "%d/%d[Mb/Gb] (%d%%)",$3, $2, $5}')
		#ファイルシステムのディスク容量の使用状況を表示する   https://linuxjm.osdn.jp/html/GNU_fileutils/man1/df.1.html
        CPU_load=$(top -bn1 | grep %Cpu | awk -F "ni," '{print $2}' | awk -F " " '{printf "%d%%", 100 - $1}')
        #linuxのタスクを表示する　https://linuxjm.osdn.jp/html/procps/man1/top.1.html
		LVM=$(lsblk | grep lvm | awk '{ if($1) { print "yes"; exit;} else { print "no" }}')
		#ブロックデバイスを一覧表示する https://linuxjm.osdn.jp/html/util-linux/man8/lsblk.8.html
        Last_boot=$(last reboot | awk 'NR == 1 { print $5 " " $6 " " $7 " " $8}')
		#最近ログインしたユーザを一覧表示する  https://linuxjm.osdn.jp/html/util-linux/man1/last.1.html
        TCP_wc=$(netstat | grep tcp | wc -l)
		#ネットワーク接続、経路テーブル、インターフェースの状態、マスカレード接続、 netlink メッセージ、マルチキャストのメンバーシップを表示する https://linuxjm.osdn.jp/html/net-tools/man8/netstat.8.html
        TCP_connections=$(netstat | grep tcp | awk '{print $6}')        User_log=$(who | awk '{print $1}' | sort -u |wc -l)
		#ネットワーク接続、経路テーブル、インターフェースの状態、マスカレード接続、 netlink メッセージ、マルチキャストのメンバーシップを表示する https://linuxjm.osdn.jp/html/net-tools/man8/netstat.8.html
        ip_v4=$(ip a | awk 'NR == 9 {print $2}' | sed -e "s/\/24//g")
		#ネットワークデバイスやルーティング、ポリシーなどの表示と変更を行う  https://atmarkit.itmedia.co.jp/ait/articles/1709/22/news019.html
        ip_v4_16=$(ip a | awk 'NR == 8 {print $2}')
		#ネットワークデバイスやルーティング、ポリシーなどの表示と変更を行う  https://atmarkit.itmedia.co.jp/ait/articles/1709/22/news019.html
        sudo_cmd=$(cat /var/log/sudo/sudo.log | wc -l)
		#sudo cmd log file

		#wall - すべてのユーザに対してメッセージを書き込む    https://linuxjm.osdn.jp/html/util-linux/man1/wall.1.html
        wall "
        #Architecture: $UNIX_NAME
        #CPU physical : $CPU_physical
        #vCPU : $vCPU
        #Memory Usage: $Memory_usage
        #Disk Usage: $Disk_Usage
        #CPU load: $CPU_load
        #Last boot: $Last_boot
        #LVM use: $LVM
        #Connections TCP : $TCP_wc $TCP_connections
        #User log: $User_log
        #Network: IP $ip_v4 ($ip_v4_16)
        #Sudo : $sudo_cmd cmd"
