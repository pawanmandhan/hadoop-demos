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

