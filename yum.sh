#!/bin/bash
echo "============init yum list======="
systemctl stop firewalld.service &&
systemctl disable firewalld.service &&
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
cmd="wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo"
eval $cmd &&
yum clean all &&
yum makecache &&

cd /usr/local &&
pstr="$PATH"
#####git install#########
yum -y install readline-devel pcre-devel curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker &&
########openresty install#######
wget https://openresty.org/download/openresty-1.11.2.1.tar.gz &&
tar -zxvf openresty-1.11.2.1.tar.gz &&
cd openresty-1.11.2.1 &&
./configure &&
make &&
make install &&
echo "### openresty ###">>/etc/bashrc &&
echo "export PATH=/usr/local/openresty/bin:/usr/local/openresty/nginx/sbin:$pstr">>/etc/bashrc &&
source /etc/bashrc &&
cd /usr/local &&
########java -1.8 #################
yum -y install java-1.8.0-openjdk-devel.x86_64 &&
echo "# java">>/etc/bashrc &&
echo "export JAVA_HOME=/usr/lib/jvm/jre:$PATH">>/etc/bashrc &&
echo "export CLASSPATH=.:$JAVA_HOME/lib:$CLASSPATH">>/etc/bashrc &&
#########settings ################
echo "# max thread">>/etc/bashrc &&
echo "ulimit -u 2048">>/etc/bashrc &&
echo "# ld path">>/etc/bashrc &&
echo "export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/opt">>/etc/bashrc &&
echo "# pkg path">>/etc/bashrc &&
echo "export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/pkgconfig:$PKG_CONFIG_PATH">>/etc/bashrc &&
########hadoop#####################
wget http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.6.5/hadoop-2.6.5.tar.gz &&
tar -zxvf hadoop-2.6.5.tar.gz &&
echo "export PATH=/usr/local/hadoop-2.6.5/bin:$pstr">>/etc/bashrc &&
source /etc/bashrc &&
######## kafka ###################
wget http://mirrors.tuna.tsinghua.edu.cn/apache/kafka/0.10.1.1/kafka_2.10-0.10.1.1.tgz &&
tar -zxf kafka_2.10-0.10.1.1.tgz &&
mv kafka_2.10-0.10.1.1/ kafka-2.11/ &&
echo "# kafka">>/etc/bashrc &&
echo "export KAFKA_HOME=/usr/local/kafka-2.11">>/etc/bashrc &&
echo "export PATH=/usr/local/kafka-2.11/bin:$PATH">>/etc/bashrc &&
source /etc/bashrc &&
######## zookeeper #####################
wget https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz &&
tar -zxvf zookeeper-3.4.6.tar.gz &&
echo "# zookeeper">>/etc/bashrc &&
echo "export PATH=/usr/local/zookeeper-3.4.6/bin:$PATH">>/etc/bashrc &&
source /etc/bashrc &&
####### python pip ###############
yum -y install python-devel python &&
wget https://bootstrap.pypa.io/get-pip.py &&
python get-pip.py &&
yum -y install SDL* &&
pip install OpenCV-Python &&
echo "============init done======="
