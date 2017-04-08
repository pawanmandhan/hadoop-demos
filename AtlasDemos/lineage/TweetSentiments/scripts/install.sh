#!/bin/sh
set -vx
demo_user="admin"

#1 - Add admin user on host 

useradd ${demo_user}
mkdir -p /home/${demo_user}
chmod 775 /home/${demo_user}
chown ${demo_user} /home/${demo_user}

#2 - Add HDFS directory for admin 

su - hdfs -c "hdfs -mkdir -p /user/${demo_user}"
su - hdfs -c "hdfs -chmod 775 /user/${demo_user}"
su - hdfs -c "hdfs -chown ${demo_user} /user/${demo_user}"

su - ${demo_user} -c "hdfs dfs -ls /user/admin"

su - ${demo_user} -c "hdfs dfs -ls /user/admin"

mkdir -p /home/${demo_user}/demos/data
cd /home/${demo_user}/demos/data

wget https://github.com/vvagias/HiveTwitterSentiment/blob/master/tweets.csv?raw=true

mv tweet* tweets.csv

wget http://www2.imm.dtu.dk/pubdb/views/edoc_download.php/6010/zip/imm6010.zip

unzip i*zip

rm i*zip

cp A*/A*111* . 

rm -rf AFINN

chmod 775 -R /home/${demo_user}
chown -R ${demo_user} /home/${demo_user}

su - ${demo_user} -c "hdfs dfs -mkdir -p /user/${demo_user}/data/tweets"
su - ${demo_user} -c "hdfs dfs -mkdir -p /user/${demo_user}/data/sentiments"

su - ${demo_user} -c "hdfs dfs -put /home/${demo_user}/demos/data/tweet* /user/admin/data/tweets"
su - ${demo_user} -c "hdfs dfs -put /home/${demo_user}/demos/data/A* /user/admin/data/sentiments"

