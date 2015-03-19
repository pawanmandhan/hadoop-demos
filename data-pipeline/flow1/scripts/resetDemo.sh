#!/bin/bash

un=`whoami`
if [ $un == 'root' ]; then

echo "Cleaning up data directory"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/data/process/*"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/data/backup/*"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/data/input/*"
echo "Cleaned up data directory"

echo "Cleaning up hive table"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/data/input/*"


echo "Cleaning up mysql table"



else

echo "Unable to switch user to ambari-qa. Run as root."

fi


