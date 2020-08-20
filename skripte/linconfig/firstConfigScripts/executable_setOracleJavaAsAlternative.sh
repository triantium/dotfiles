#/bin/bash/
#run as Root
flavor="jdk"
version="121"
shortversion=$version
java_version="$flavor-$version"

sudo update-alternatives --install "/usr/bin/java" "java" "/opt/oracle_java/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/opt/oracle_java/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/opt/oracle_java/bin/javaws" 1
sudo update-alternatives --install "/usr/bin/jar" "jar" "/opt/oracle_java/bin/jar" 1


sudo update-alternatives --set "java" "/opt/oracle_java/bin/java"
sudo update-alternatives --set "javac" "/opt/oracle_java/bin/javac"
sudo update-alternatives --set "javaws" "/opt/oracle_java/bin/javaws"
sudo update-alternatives --set "jar" "/opt/oracle_java/bin/jar"

java -version
