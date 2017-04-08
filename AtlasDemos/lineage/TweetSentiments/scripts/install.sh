#!/bin/sh

mkdir -p /home/admin
chmod 775 /home/admin
chown admin /home/admin

hdfs dfs -ls /user/admin

mkdir -p /home/admin/demos/data

wget https://github.com/vvagias/HiveTwitterSentiment/blob/master/tweets.csv?raw=true

mv tweet* tweets.csv

wget http://www2.imm.dtu.dk/pubdb/views/edoc_download.php/6010/zip/imm6010.zip

unzip i*zip

rm i*zip

cp A*/A*111* . 

rm -rf AFINN


hdfs dfs -mkdir -p /user/admin/data/tweets

hdfs dfs -mkdir -p /user/admin/data/sentiments


hdfs dfs -put tweet* /user/admin/data/tweets
hdfs dfs -put A* /user/admin/data/sentiments

hive -f ../hql/ddl.hql


