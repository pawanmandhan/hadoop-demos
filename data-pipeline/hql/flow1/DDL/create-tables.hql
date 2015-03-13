#upload /usr/hdp/2.2.0.0-2041/hive-hcatalog/share/hcatalog/hive-hcatalog-core.jar to /user/ambari-qa/jars/
#also execute in hive : add jar /user/ambari-qa/jars/hive-hcatalog-core.jar

create database demodb;

use database demodb;

CREATE external TABLE if not exists raw_xml
(
row string
) STORED AS TEXTFILE LOCATION '/user/ambari-qa/data_pipeline_demo/hivedb/raw_xml';


CREATE external TABLE if not exists raw_json
(
row string
) STORED AS TEXTFILE LOCATION '/user/ambari-qa/data_pipeline_demo/hivedb/raw_json';


create table sv_json_data ( 
studyid string,
domain string,
ussubjid string,
visitnum string,
visit string,
svstdtc date,
svendtc date,
groupSeq int,
groupOID string
)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe' STORED AS TEXTFILE LOCATION '/user/ambari-qa/data_pipeline_demo/hivedb/sv_json_data';



create table sv_aggregate(
studyid string,
visit string,
year int,
month int,
visit_count int
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE LOCATION '/user/ambari-qa/data_pipeline_demo/hivedb/sv_aggregate';


