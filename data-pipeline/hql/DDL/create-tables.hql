#upload /usr/hdp/2.2.0.0-2041/hive-hcatalog/share/hcatalog/hive-hcatalog-core.jar to /user/ambari-qa/data_pipeline_demo/jars/
#also execute in hive : add jar /user/ambari-qa/data_pipeline_demo/jars/hive-hcatalog-core.jar

create database demodb;

use database demodb;

create table raw_xml ( 
row string
);


create table raw_json ( 
row string
)
STORED AS ORC
;

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
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe' STORED AS ORC
;


create table sv_aggregate(
studyid string,
visit string,
year int,
month int,
visit_count int
) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE LOCATION '/user/ambari-qa/data_pipeline_demo/sv_aggregate';


