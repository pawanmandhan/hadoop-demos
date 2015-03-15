#!/bin/bash

su - ambari-qa -c "hdfs dfs -put ./hql/* /user/ambari-qa/data_pipeline_demo/hql/"
su - ambari-qa -c "hdfs dfs -put ./pig/* /user/ambari-qa/data_pipeline_demo/pig/"
su - ambari-qa -c "hdfs dfs -put ./falcon/workflow/* /user/ambari-qa/data_pipeline_demo/falcon/workflow/*"
su - ambari-qa -c "hdfs dfs -put /etc/hive/conf/hive-site.xml /user/ambari-qa/data_pipeline_demo/conf"
