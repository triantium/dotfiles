#!/bin/bash

cd ~/Downloads/
wget "http://dev.mysql.com/get/mysql-apt-config_0.7.3-1_all.deb"
#TODO get Name
sudo dpkg -i ~/Downloads/mysql-apt-config_0.7.3-1_all.deb

sudo apt-get install mysql-server
