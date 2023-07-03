#!/bin/bash
#run as Root

#check 32or64bit

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
	architecture="x64"
else
	architecture="i586"
fi
flavor="jdk"
version="9"
shortversion="112"
java_version="$flavor-$version"
build="181"
echo "install $java_version"
echo "http://download.oracle.com/otn-pub/java/jdk/9+181/jdk-9_linux-x64_bin.tar.gz"
filename="${java_version}_linux-${architecture}_bin.tar.gz'"
echo "attempt do download: $filename"
url="http://download.oracle.com/otn-pub/java/$flavor/$version+181/$filename" \
#url="http://download.oracle.com/otn-pub/java/jdk/9+181/jdk-9_linux-x64_bin.tar.gz"
# set workdirectory
cd /opt
mkdir -p /opt/Oracle_Java/
cd /opt/Oracle_Java/
ls
# get jdk java from Oracle
# ubuntuoowww
echo "Start Download"
#wget --no-cookies \
#--no-check-certificate \
#--header "Cookie: oraclelicense=accept-securebackup-cookie" \
#$url\
#-O $filename
echo "Finished Download of $java_version"
# then
echo "Unpacking"
tar -xzvf $filename
echo "Removing"
#rm -i $filename

sudo update-alternatives --install "/usr/bin/java" "java" "/opt/Oracle_Java/jdk-9/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/opt/Oracle_Java/jdk-9/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/opt/Oracle_Java/jdk-9/bin/javaws" 1
sudo update-alternatives --install "/usr/bin/jar" "jar" "/opt/Oracle_Java/jdk-9/bin/jar" 1
sudo update-alternatives --install "/usr/bin/jshell" "jshell" "/opt/Oracle_Java/jdk-9/bin/jshell" 1
