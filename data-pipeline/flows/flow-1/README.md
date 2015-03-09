#Flow 1 

##Introduction

The goal of this pipeline flow is to ingest data files, that are copied to the landing zone on a gateway server, and process them at a regular interval. When the workflow begins, the files are ingested, stored, transformed and the transformed data is sqooped out of cluster into a MySQL database. 

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

##Setting up the project		

###Getting Project components

* Project Components used are (relative to this project within the github code) 
	* ../../udf
	* ../../falcon/flow-1
	* ../../input_data
	* ../../flume/flume.conf.flow1
	

###Steps to setup up Project components

* Setup UDF. Follow the README.MD within the udf directory

* Setup Flume

* Setup HDFS Directories

```
Caution : 

* Selecting the right user ids

* Ensuring file / directory permissions

```

* Setup Hive

* Setup Falcon

* Setup Sqoop



## Word of Caution 

Top three things that could go wrong, when setting up a Falcon job are - 

* Permission - to submit Falcon entities, defined in Hadoop Config within Ambari console
* Permission - to read input data as the user who submitted the job
* Permission - to write the output data to the specified output directory as the user who submitted the job. 

Solution is simply to ensure all the required directories exist and that the user who submitted the Falcon entities have the right permissions on those directories. 