#!/bin/sh

set -vx

cp ../hql/ddl.hql /tmp 
chmod 777 /tmp/ddl.hql
su - admin -c "hive -f /tmp/ddl.hql"
rm /tmp/ddl.hql

