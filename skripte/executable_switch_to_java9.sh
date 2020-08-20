#!/bin/bash

version=jdk-9

sudo update-alternatives --set "java" "/opt/Oracle_Java/$version/bin/java"
sudo update-alternatives --set "javac" "/opt/Oracle_Java/$version/bin/javac"
sudo update-alternatives --set "javaws" "/opt/Oracle_Java/$version/bin/javaws"
sudo update-alternatives --set "jar" "/opt/Oracle_Java/$version/bin/jar"

cd /opt/Oracle_Java

sudo rm standardjdk

sudo ln -s ./$version standardjdk
