#!/bin/bash

jenkins_status=sudo /etc/init.d/jenkins status
if [ ${jenkins} ne 'Jenkins Continuous Integration Server is not running' ]; then
	sudo /etc/init.d/jenkins stop
fi

sudo mkdir -p /etc/default/backup
sudo cp /etc/default/jenkins /etc/default/backup/jenkins_backup
sed -i s/HTTP_PORT=8080/HTTP_PORT=7070/g /etc/default/jenkins
echo "Port was changed to 7070" >> /var/log/jenkins/jenkins.log
sudo /etc/init.d/jenkins restart
#cat /var/log/jenkins/jenkins.log
echo "Port was changed to 7070"
