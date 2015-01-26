#!/bin/sh

ambari-server stop
sleep 3
rm -rf /var/lib/ambari-server/resources/views/work/SIMPLE*
rm -rf /var/lib/ambari-server/resources/views/simple-view-0.1.0.jar

mv ~/simple-view-0.1.0.jar /var/lib/ambari-server/resources/views/


ambari-server start
