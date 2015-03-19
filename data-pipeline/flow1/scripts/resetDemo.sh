#!/bin/bash

un=`whoami`
if [ $un == 'root' ]; then
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/data/process/*"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/data/backup/*"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/data/input/*"
echo "Cleaned up data directory"

su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/data/input/*"


else

echo "Unable to switch user to ambari-qa. Run as root."

fi


