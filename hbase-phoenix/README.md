Hbase - Phoenix


CREATE TABLE hbase_table_1(value map<string,int>, row_key int) 
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES (
"hbase.columns.mapping" = "cf:,:key"
);


create table pokes 
(
bar string,
foo int)
;

insert into pokes values ('one',1);
insert into pokes values (‘secondone',1);
insert into pokes values (‘two’,2);
insert into pokes values (‘anothertwo’,2);
insert into pokes values (‘three’,3);


INSERT OVERWRITE TABLE hbase_table_1 SELECT map(bar, foo), foo FROM pokes ;

//hbase
scan 'hbase_table_1';
//hbase


CREATE table "hbase_table_1" ( pk VARCHAR PRIMARY KEY, "cf".val VARCHAR , "foo" integer );



 
create table nba(accpro string, estval int, priority int, channel string) STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' 
WITH SERDEPROPERTIES
("hbase.columns.mapping" = ":key, 
attr:estval, attr:priority, 
attr:channel") TBLPROPERTIES("hbase.table.name" = "nba");

CREATE TABLE "nba" ( pk VARCHAR PRIMARY KEY, "attr"."estval" as "estval" INTEGER, "attr"."priority" INTEGER, "attr"."channel" VARCHAR)

hive
insert into table nba values ("hive", 1, 2, "m");

phoenix
upsert into "nba" values ('phoenix', 3, 4, 'm+c');


----------


create table nba(accpro string, estval string, priority string, channel string) STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' 
WITH SERDEPROPERTIES
("hbase.columns.mapping" = ":key, 
attr:estval, attr:priority, 
attr:channel") TBLPROPERTIES("hbase.table.name" = "nba");

CREATE TABLE "nba" ( pk VARCHAR PRIMARY KEY, "attr"."estval" VARCHAR, "attr"."priority" VARCHAR, "attr"."channel" VARCHAR)

hive
insert into table nba values ("hive", "1", "2", "m");

phoenix
upsert into "nba" values ('phoenix', '3', '4', 'm+c');


----------



create table MYTBL(
col1 string, 
col2 int, 
col3 int, 
col4 string ) 
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' 
WITH SERDEPROPERTIES
("hbase.columns.mapping" = ":key, 
attr:col2, 
attr:col3, 
attr:col4") 
TBLPROPERTIES("hbase.table.name" = "MYTBL");

CREATE TABLE "MYTBL" ( 
pk VARCHAR PRIMARY KEY, 
"attr"."col2" INTEGER, 
"attr"."col3" INTEGER, 
"attr"."col4" VARCHAR )

hive
insert into table MYTBL values ("hive", 1, 2, "m");

phoenix
upsert into "MYTBL" values ('phoenix', 3, 4, 'm+c');









