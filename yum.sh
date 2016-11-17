#!/bin/bash
echo "============init yum list======="
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
v=`cat /etc/redhat-release`  
echo $v  
echo ${v:15:1}
cmd="wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-${v:15:1}.repo"
eval $cmd
# wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
yum clean all
yum makecache


echo "============init done======="
