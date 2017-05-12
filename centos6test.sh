#CENTOS SCRIPT
yum update
cd /usr/bin
#wget http://repo.sufanet.com/centos6/badvpn-udpgw
#chmod 755 badvpn-udpgw
yum install nano
#nano /etc/rc.local
cd /usr/bin
wget http://belajar-linux.hol.es/Centos/menu && chmod +x menu
wget http://belajar-linux.hol.es/Centos/badvpn-udpgw && chmod +x badvpn-udpgw
wget http://belajar-linux.hol.es/Centos/banned-user && chmod +x banned-user
wget http://belajar-linux.hol.es/Centos/basename && chmod +x basename
wget http://belajar-linux.hol.es/Centos/benchmark && chmod +x benchmark
wget http://belajar-linux.hol.es/Centos/bmon && chmod +x bmon
wget http://belajar-linux.hol.es/Centos/delete-user-expire && chmod +x delete-user-expire
wget http://belajar-linux.hol.es/Centos/disable-user-expire && chmod +x disable-user-expire
wget http://belajar-linux.hol.es/Centos/dropmon && chmod +x dropmon
wget http://belajar-linux.hol.es/Centos/re-drop && chmod +x re-drop
wget http://belajar-linux.hol.es/Centos/test-speed && chmod +x test-speed
wget http://belajar-linux.hol.es/Centos/user-add && chmod +x user-add
wget http://belajar-linux.hol.es/Centos/user-add-pptp && chmod +x user-add-pptp
wget http://belajar-linux.hol.es/Centos/user-del && chmod +x user-del
wget http://belajar-linux.hol.es/Centos/user-expire-list && chmod +x user-expire-list
wget http://belajar-linux.hol.es/Centos/user-gen && chmod +x user-gen
wget http://belajar-linux.hol.es/Centos/user-limit && chmod +x user-limit
wget http://belajar-linux.hol.es/Centos/user-list && chmod +x user-list
wget http://belajar-linux.hol.es/Centos/user-login && chmod +x user-login
wget http://belajar-linux.hol.es/Centos/user-pass && chmod +x user-pass
wget http://belajar-linux.hol.es/Centos/user-renew && chmod +x user-renew
wget http://belajar-linux.hol.es/Centos/users && chmod +x users
wget http://belajar-linux.hol.es/Centos/user-active-list && chmod +x user-active-list
wget wget http://pencabulmisteri.esy.es/centos/test.py && chmod +x test.py
cd
#install dropbear
rpm -Uvh http://ftp-stud.hs-esslingen.de/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum install dropbear
nano /etc/init.d/dropbear
service dropbear start
chkconfig dropbear on
echo "/bin/false" >> /etc/shells
service dropbear restart
#install webmin
wget http://prdownloads.sourceforge.net/webadmin/webmin-1.710-1.noarch.rpm
yum -y install perl perl-Net-SSLeay openssl perl-IO-Tty
rpm -U webmin-1.710-1.noarch.rpm
nano /etc/webmin/miniserv.conf
service webmin restart
#limit IP
iptables -A INPUT -p tcp --syn --dport 443 -m connlimit --connlimit-above 2 -j REJECT
service iptables save
service iptables restart
chkconfig iptables on
iptables -n -L
#screfatcher
wget https://github.com/KittyKatt/screenFetch/raw/master/screenfetch-dev
mv screenfetch-dev /usr/bin/screenfetch
chmod +x /usr/bin/screenfetch
echo "clear" >> .bash_profile
echo "screenfetch" >> .bash_profile
#squid proxy
yum -y update
yum -y install squid
mv /etc/squid/squid.conf /etc/squid.conf.bak
nano /etc/squid/squid.conf
chkconfig squid on
service squid start
netstat -grep | squid
echo -e "\e[1;33;44m[ belajar-linux.com ]\e[0m"  | tee -a log-install.txt
echo "VPS AUTO REBOOT TIAP 12 JAM, SILAHKAN REBOOT VPS ANDA !"  | tee -a log-install.txt

rm centos6.sh
