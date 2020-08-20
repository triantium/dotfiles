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
version="8u102"
shortversion="102"
java_version="$flavor-$version"
build="b14"
echo "install $java_version"

# set workdirectory
cd /opt
mkdir -p /opt/Oracle_Java/
cd /opt/Oracle_Java/

# get jdk java from Oracle
# ubuntu
echo "Start Download"
wget --no-cookies \
--no-check-certificate \
--header "Cookie: oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/$flavor/$version-b14/$java_version-linux-$architecture.tar.gz" \
-O $java_version-linux-$architecture.tar.gz
echo "Finished Download of $java_version"
# then
echo "Unpacking"
tar -xzvf $java_version-linux-$architecture.tar.gz
echo "Removing"
rm $java_version-linux-$architecture.tar.gz

sudo update-alternatives --install "/usr/bin/java" "java" "/opt/Oracle_Java/jdk1.8.0_$shortversion/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/opt/Oracle_Java/jdk1.8.0_$shortversion/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/opt/Oracle_Java/jdk1.8.0_$shortversion/bin/javaws" 1
sudo update-alternatives --install "/usr/bin/jar" "jar" "/opt/Oracle_Java/jdk1.8.0_$shortversion/bin/jar" 1
