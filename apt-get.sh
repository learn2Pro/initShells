#!/bin/bash
echo "============init apt-get list======="
mv /etc/apt/sources.list /etc/apt/sources.list.backup
cat /dev/null > /etc/apt/sources.list
echo "deb http://cn.archive.ubuntu.com/ubuntu/ precise main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://cn.archive.ubuntu.com/ubuntu/ precise-security main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://cn.archive.ubuntu.com/ubuntu/ precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://cn.archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "##测试版源" >> /etc/apt/sources.list
echo "deb http://cn.archive.ubuntu.com/ubuntu/ precise-proposed main restricted universe multiverse" >> /etc/apt/sources.list
echo "# 源码" >> /etc/apt/sources.list
echo "deb-src http://cn.archive.ubuntu.com/ubuntu/ precise main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src http://cn.archive.ubuntu.com/ubuntu/ precise-security main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src http://cn.archive.ubuntu.com/ubuntu/ precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src http://cn.archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "##测试版源" >> /etc/apt/sources.list
echo "deb-src http://cn.archive.ubuntu.com/ubuntu/ precise-proposed main restricted universe multiverse" >> /etc/apt/sources.list
echo "# Canonical 合作伙伴和附加" >> /etc/apt/sources.list
echo "deb http://archive.canonical.com/ubuntu/ precise partner" >> /etc/apt/sources.list
echo "deb http://extras.ubuntu.com/ubuntu/ precise main" >> /etc/apt/sources.list

# apt-get update
# apt-get upgrade

echo "============init done======="