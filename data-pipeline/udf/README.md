#Creating custom UDF for converting XML into JSON.

The java code for converting XML into JSON is included in this code repo. Follow the steps below to add this custom UDF to Hive Server on your cluster

* Get the code from github
```
git clone <git repo url>
```

* Compile the UDF code 
```
cd ./hadoop-demos/data-pipeline/udf
bash build.sh
```

* Copy the jar file to a directory on HDFS. (Assuming the selected directory is /user/ambari-qa/
```
cd target
hdfs dfs -put MyXml2JsonUdf.jar /user/ambari-qa
```

* Create a User Defined Function from the Java code in the jar file. 
```
CREATE FUNCTION convertX2J AS 'XML2JSONConvertor' USING JAR 'hdfs:///user/ambari-qa/MyXml2JsonUdf.jar';
```

* Test the UDF
```
create table xmlTest ( col1 string ) ; 

insert into table xmlTest values ('<?xml version="1.0" ?><test attrib="moretest">Turn this to JSON</test>');

select convertX2J(col1) from xmlTest;

```