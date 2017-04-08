#!/bin/sh

echo "
alias kh="cd /usr/hdp/2.2.0.0-2041/kafka/bin/"
alias d="cd ~/demo/hadoop-demos/realtime-log-analytics/"

Run the following command - /root/demo/hadoop-demos/realtime-log-analytics/log-generator/generate_logs.py -f events.log
To start the the flume agent use ths command - flume-ng agent -c /etc/flume/conf -f /etc/flume/conf/flume.conf -n sandbox
Command to create a topic : bin/kafka-topics.sh --create --zookeeper sandbox.hortonworks.com:2181 --partitions 1 --replication-factor 1 --topic sinkforflume
Command to check the list of topics : bin/kafka-topics.sh --list --zookeeper localhost:2181 

#Start a producer and consumer on a topic
kafka-console-producer.sh --broker-list sandbox.hortonworks.com:6667 --topic sinkforflume
kafka-console-consumer.sh --zookeeper sandbox.hortonworks.com:2181 --topic sinkforflume


"
