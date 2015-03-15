#!/bin/bash

su - hdfs -c "ls"

suRetCode=$?

if [[ $suRetCode == 0 ]]; then 

 #hql File Directories
su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/hql"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/hql"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/hql"

 #pig File Directories 
su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/pig"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/pig"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/pig"
 
 #conf File Directories 
su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/conf"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/conf"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/conf"
su - hdfs -c "hdfs dfs -put /etc/hive/conf/hive-site.xml /user/ambari-qa/data_pipeline_demo/conf"
 
 #Data File Directories 
su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/data/input"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/data/input"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/data/input"
 
su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/data/process"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/data/process"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/data/process"

su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/data/backup"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/data/backup"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/data/backup"
#Falcon working directories 
su - hdfs -c "hdfs dfs -mkdir -p /apps/falcon/primaryCluster/staging"
su - hdfs -c "hdfs dfs -chmod 777 /apps/falcon/primaryCluster/staging"
su - hdfs -c "hdfs dfs -chown falcon:hadoop /apps/falcon/primaryCluster/staging"

su - hdfs -c "hdfs dfs -mkdir -p /apps/falcon/primaryCluster/working"
su - hdfs -c "hdfs dfs -chmod 755 /apps/falcon/primaryCluster/working"
su - hdfs -c "hdfs dfs -chown falcon:hadoop /apps/falcon/primaryCluster/working"

 #falcon workflow File Directories 
su - hdfs -c "hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/falcon/workflow"
su - hdfs -c "hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/falcon/workflow"
su - hdfs -c "hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/falcon/workflow"
