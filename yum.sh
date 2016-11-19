#!/bin/bash
echo "============init yum list======="
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
v=`cat /etc/redhat-release`  
echo $v  
echo ${v:15:1}
cmd="wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-${v:15:1}.repo"
eval $cmd
yum clean all
yum makecache

cd /usr/local
pstr="$PATH"
#####git install#########
yum -y install readline-devel pcre-devel curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker
wget https://github.com/git/git/archive/v2.3.0.zip
unzip v2.3.0.zip
cd git-2.3.0
make prefix=/usr/local/git all
make prefix=/usr/local/git install
echo "# git">>/etc/bashrc
echo "export PATH=/usr/local/git/bin:$pstr">>/etc/bashrc
source /etc/bashrc
########openresty install#######
wget https://openresty.org/download/openresty-1.11.2.1.tar.gz
tar -zxvf openresty-1.11.2.1.tar.gz
cd openresty-1.11.2.1
echo ./configure
make
make install
echo "# openresty">>/etc/bashrc
echo "export PATH=/usr/local/openresty/bin:$pstr">>/etc/bashrc
########java -1.8 #################
yum -y install java-1.8.0-openjdk-devel.i686
########hadoop#####################
wget http://apache.fayea.com/hadoop/common/hadoop-2.6.5/hadoop-2.6.5.tar.gz
tar -zxvf hadoop-2.6.5.tar.gz
echo "export PATH=/usr/local/hadoop-2.6.5/bin:$pstr">>/etc/bashrc
echo "============init done======="
