#!/bin/bash
#下载ruby源,通过gem下载fpm工具
sudo yum -y install ruby-devel gcc make rpm-build rubygems ruby
gem sources --add http://mirrors.aliyun.com/rubygems/

gem sources --remove https://rubygems.org/
gem sources -l


curl -sSL https://github.com/rvm/rvm/tarball/stable -o rvm-stable.tar.gz
tar -xzvf rvm-stable.tar.gz
cd rvm*
./install --auto-dotfiles
source /home/gpadmin/.rvm/scripts/rvm
rvm list known
rvm install 2.6.3

gem install fpm -v 1.4.0

# 制作rpm包
# mkdir -p tmp/usr/local/cloudberrydb
# cp -a /usr/local/cloudberrydb/.* tmp/usr/local/cloudberrydb

#根据发布的版本修改版本号
# fpm -s dir -t rpm -n cloudberrydb -v 1.0.2 -p ./ -C tmp
