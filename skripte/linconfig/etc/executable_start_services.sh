#!/bin/bash

#sudo /etc/init.d/jenkins start

sudo /opt/payara41/glassfish/bin/asadmin start-domain payaradomain

#call startPage to init Database
curl http://localhost:8080/firemessage/login.xhtml

curl --data "user=test.müller&token=***REMOVED***&debug=true&message=start_Bot" http://localhost:8080/firemessage/api/alarm/post
