#!/bin/bash

su - hdfs -c "ls" 1>/dev/null 2>/dev/null

suRetCode=$?

if [ $suRetCode == 0 ]; then 

#hql File Directories
echo "Create hql  File  directory - Start"
su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/hql"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/hql"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/hql"
echo "Create hql  File  directory - Done"

#pig File Directories 
echo "Create pig File  directory - Start"
su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/pig"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/pig"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/pig"
echo "Create pig File  directory - Done"
 
#conf File Directories 
echo "Create conf File  directory - Start"
su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/conf"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/conf"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/conf"
su - hdfs -c "hdfs dfs -put /etc/hive/conf/hive-site.xml /user/ambari-qa/data_pipeline_demo/conf"
echo "Create conf File  directory - Done"
 
#jars File Directories 
echo "Create jars File  directory - Start"
su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/jars"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/jars"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/jars"
echo "Create jars File  directory - Done"
  
#Data File Directories 
echo "Create Data File  directory - Start"
su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/data/input"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/data/input"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/data/input"
 
su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/data/process"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/data/process"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/data/process"

su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/data/backup"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/data/backup"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/data/backup"
echo "Create Data File  directory - Done"

#Falcon working directories 
echo "Create Falcon working directory - Start"
su - hdfs -c "hdfs dfs -mkdir -p /apps/falcon/primaryCluster/staging"
su - hdfs -c "hdfs dfs -chmod 777 /apps/falcon/primaryCluster/staging"
su - hdfs -c "hdfs dfs -chown falcon:hadoop /apps/falcon/primaryCluster/staging"

su - hdfs -c "hdfs dfs -mkdir -p /apps/falcon/primaryCluster/working"
su - hdfs -c "hdfs dfs -chmod 755 /apps/falcon/primaryCluster/working"
su - hdfs -c "hdfs dfs -chown falcon:hadoop /apps/falcon/primaryCluster/working"
echo "Create Falcon working directory - Done"

#falcon workflow File Directories 
echo "Create Falcon workflow directory - Start"
su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/falcon/workflow"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/falcon/workflow"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/falcon/workflow"
echo "Create Falcon workflow directory - Done"

else

echo "Error : Unable to switch to user hdfs. Run as root"

fi
