#!/bin/bash

su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/hql/*"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/pig/*"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/conf/*"
su - ambari-qa -c "hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/falcon/workflow/*"


