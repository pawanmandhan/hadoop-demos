#!/bin/bash

un=`whoami`
if [ $un == 'root' ]; then

echo "Cleaning up data directory"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/data/process/*"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/data/backup/*"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/data/input/*"
echo "Cleaned up data directory"

echo "Cleaning up hive table"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/hivedb/raw_xml/*"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/hivedb/raw_json/*"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/hivedb/sv_aggregate/*"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/hivedb/sv_json_data/*"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/hivedb/sv_json_data_master/*"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/hivedb/xml_data_archive/*"


echo "Cleaning up mysql table"



else

echo "Unable to switch user to ambari-qa. Run as root."

fi


