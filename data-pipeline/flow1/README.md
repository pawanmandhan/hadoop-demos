# Flow

## Introduction

The goal of this data pipeline flow is to ingest data files, that are copied to the landing zone on a gateway server, and then process them at a regular interval. When the workflow begins, the files are ingested, stored, transformed and the transformed data is sqooped out of cluster into a MySQL database. 

In this flow, there are following processes and steps 

* Gateway Server
	* has the flume agent running with a Spooling Directory configuration, to transfer the data files to HDFS
	
* Master Server 
	* has the Falcon job running to do the following	
		* Clear the temp tables
		* Make a copy of the incoming data for backup purpose. 
		* Insert the raw data in a temp table
		* Covert the XML data into JSON and insert into another table 
		* Apply aggregation / transformation process to the JSON table 
		* Also insert the data from process (temp table) into the history table.
		* export the data out of Hive to a Mysql table
		
## Architecture

![Data Pipeline Flow 1 - Architecture](https://raw.githubusercontent.com/sainib/hadoop-demos/master/data-pipeline/flow1/architecture.png)		

## Setting up the project		

### Getting Project components

* Project Components used are (relative to this project within the github code) 
	* ./pig
	* ./udf
	* ./hql
	* ./falcon
	* ./input_data
	* ./flume/flume.conf
	

### Steps to setup up Project components

* Ambari Setting
```
// Save and restart all components after changing configs

// Hive, set
webhcat.proxyuser.oozie.groups = *
webhcat.proxyuser.oozie.hosts = *

// hdfs - core site
hadoop.proxyuser.oozie.groups = *
hadoop.proxyuser.oozie.hosts = *

hadoop.proxyuser.falcon.groups = *
hadoop.proxyuser.falcon.hosts = *

// Oozie
oozie.service.AuthorizationService.security.enabled = false

```

* Setup UDF. Follow the README.MD within the udf directory

* Setup the Hive Database using ../../hql/DDL/
```
Note: The user who will be submitting Falcon jobs needs to have write permissions to these tables. So, run this command, to create Hive tables, either with the user who will be submitting Falcon jobs or another user within the same group, ensuring that Hive tables have write permission for the group.

Recommend testing with ambari-qa. You would first run su - ambari-qa

hive -e ./hql/DDL/create-tables.hql
```

* Add JSON Serde Jar to Hive, using instructions in  ../../hql/DDL/

* Setup Flume
 - On gateway server 
 - mkdir /root/data_pipeline_demo/input

* Setup HDFS Directories (hql, workflow, jars, scripts)
 - From the Hadoop Gateway / Edge / Client or Master server 
 
 - su - hdfs 

 #hql File Directories 
hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/hql
hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/hql
hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/hql

 #pig File Directories 
hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/pig
hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/pig
hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/pig
 
 #conf File Directories 
hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/conf
hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/conf
hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/conf
hdfs dfs -put /etc/hive/conf/hive-site.xml /user/ambari-qa/data_pipeline_demo/conf
 
 #Data File Directories 
hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/data/input
hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/data/input
hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/data/input
 
hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/data/process
hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/data/process
hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/data/process

hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/data/backup
hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/data/backup
hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/data/backup
#Falcon working directories 
hdfs dfs -mkdir -p /apps/falcon/primaryCluster/staging
hdfs dfs -chmod 777 /apps/falcon/primaryCluster/staging
hdfs dfs -chown falcon:hadoop /apps/falcon/primaryCluster/staging

hdfs dfs -mkdir -p /apps/falcon/primaryCluster/working
hdfs dfs -chmod 755 /apps/falcon/primaryCluster/working
hdfs dfs -chown falcon:hadoop /apps/falcon/primaryCluster/working

 #falcon workflow File Directories 
hdfs dfs -mkdir -p /user/ambari-qa/data_pipeline_demo/falcon/workflow
hdfs dfs -chmod 777 /user/ambari-qa/data_pipeline_demo/falcon/workflow
hdfs dfs -chown ambari-qa:hadoop /user/ambari-qa/data_pipeline_demo/falcon/workflow


* Setup Falcon

* Setup Sqoop
```
Upload RDBMS JDBC Connector jar to /usr/share/java/
cd /usr/lib/hadoop/
ln -s /usr/share/java/<jar-name>.jar
cd /usr/hdp/2.2.0.0-2041/sqoop/lib
ln -s /usr/share/java/<jar-name>.jar
```

```
Caution : 

* Select the right user ids - avoid using master users for the services for setting up your process. like - hdfs, hue, falcon, etc. The correct approach is to establish a process id (unix id on the cluster that does not belong to a person but is used for running jobs) and assign proper permissions to that user id so that you can interact with different services using those service ids. Also, typically this process id shares group with the IT / Dev/ Support group so that work done by process is visible to the appropriate parties. 

* Ensure file / directory permissions - See the note at the end of the document but in short, make sure the user used for running the process has all the required rights on the directories involved to finish the job. 

```

### Submitting/Scheduling the job



### Supplying the input data 


### Refresh app code
```
hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/hql/*
hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/pig/*
hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/conf/*
hdfs dfs -rm -r /user/ambari-qa/data_pipeline_demo/falcon/workflow/*

hdfs dfs -put ./hql/* /user/ambari-qa/data_pipeline_demo/hql/
hdfs dfs -put ./pig/* /user/ambari-qa/data_pipeline_demo/pig/
hdfs dfs -put /etc/hive/conf/hive-site.xml /user/ambari-qa/data_pipeline_demo/conf
hdfs dfs -put ./falcon/workflow/* /user/ambari-qa/data_pipeline_demo/falcon/workflow/*


hdfs dfs -ls /user/ambari-qa/data_pipeline_demo/hql/

```


### Tracking the execution of Falcon Jobs

* Via Falcon UI 

* Via Oozie UI 

* Via YARN / JOB History UI


## Word of Caution 

Top three things that could go wrong, when setting up a Falcon job are - 

* Permission - to submit Falcon entities, defined in Hadoop Config within Ambari console
* Permission - to read input data as the user who submitted the job
* Permission - to write the output data to the specified output directory as the user who submitted the job. 

Solution is simply to ensure all the required directories exist and that the user who submitted the Falcon entities have the right permissions on those directories. 


