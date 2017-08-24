
# Setup 

## Schema Registry Setup 


+1 truck_events_log

* Name = truck_events_log
* Description = Schema for truck geo events in log files
* Type = Avro schema provider
* Schema Group = truck-sensors-log
* Compatibility: BACKWARD
* Check the evolve checkbox

```
{
   "type" : "record",
   "namespace" : "hortonworks.hdp.refapp.trucking",
   "name" : "truckgeoevent",
   "fields" : [
      { "name" : "eventTime" , "type" : "string" },
      { "name" : "eventSource" , "type" : "string" },
      { "name" : "truckId" , "type" : "int" },
      { "name" : "driverId" , "type" : "int"},
      { "name" : "driverName" , "type" : "string"},
      { "name" : "routeId" , "type" : "int"},
      { "name" : "route" , "type" : "string"},
      { "name" : "eventType" , "type" : "string"},
      { "name" : "latitude" , "type" : "double"},
      { "name" : "longitude" , "type" : "double"},
      { "name" : "correlationId" , "type" : "long"}
   ]
}
```


+2 truck_speed_events_log

* Name = truck_speed_events_log
* Description = Schema for truck speed events in log files 
* Type = Avro schema provider
* Schema Group = truck-sensors-log
* Compatibility: BACKWARD
* Check the evolve checkbox
```
{
   "type" : "record",
   "namespace" : "hortonworks.hdp.refapp.trucking",
   "name" : "truckspeedevent",
   "fields" : [
      { "name" : "eventTime" , "type" : "string" },
      { "name" : "eventSource" , "type" : "string" },
      { "name" : "truckId" , "type" : "int" },
      { "name" : "driverId" , "type" : "int"},
      { "name" : "driverName" , "type" : "string"},
      { "name" : "routeId" , "type" : "int"},
      { "name" : "route" , "type" : "string"},
      { "name" : "speed" , "type" : "int"}
   ]
}
```


## Kafka Setup 

```
cd /usr/hdf/current/kafka-broker/bin/

./kafka-topics.sh \
--create \
--zookeeper localhost:2181 \
--replication-factor 1 \
--partition 2 \
--topic truck_events_avro

./kafka-topics.sh \
--create \
--zookeeper localhost:2181 \
--replication-factor 1 \
--partition 2 \
--topic truck_speed_events_avro


./kafka-topics.sh \
--create \
--zookeeper localhost:2181 \
--replication-factor 1 \
--partition 2 \
--topic truck_events_log

./kafka-topics.sh \
--create \
--zookeeper localhost:2181 \
--replication-factor 1 \
--partition 2 \
--topic truck_speed_events_log


```


+3 Schema Registry for the Kafka Queues - Geo Event 


* Name = truck_events_avro
* Description = Schema for the kafka topic named 'truck_events_avro'
* Type = Avro schema provider
* Schema Group = truck-sensors-kafka
* Compatibility: BACKWARD


```
{
   "type" : "record",
   "namespace" : "hortonworks.hdp.refapp.trucking",
   "name" : "truckgeoeventkafka",
   "fields" : [
      { "name" : "eventTime" , "type" : "string" },
      { "name" : "eventSource" , "type" : "string" },
      { "name" : "truckId" , "type" : "int" },
      { "name" : "driverId" , "type" : "int"},
      { "name" : "driverName" , "type" : "string"},
      { "name" : "routeId" , "type" : "int"},
      { "name" : "route" , "type" : "string"},
      { "name" : "eventType" , "type" : "string"},
      { "name" : "latitude" , "type" : "double"},
      { "name" : "longitude" , "type" : "double"},
      { "name" : "correlationId" , "type" : "long"},
      { "name" : "geoAddress", "type" : ["string", "null"], "default": "No Address Available"}
   ]
}
```



+4 Schema Registry for the Kafka Queues - Speed Event 

* Name = truck_speed_events_avro
* Description = Schema for the kafka topic named 'truck_speed_events_avro'
* Type = Avro schema provider
* Schema Group = truck-sensors-kafka
* Compatibility: BACKWARD
* Check the evolve checkbox

```
{
   "type" : "record",
   "namespace" : "hortonworks.hdp.refapp.trucking",
   "name" : "truckspeedevent",
   "fields" : [
      { "name" : "eventTime" , "type" : "string" },
      { "name" : "eventSource" , "type" : "string" },
      { "name" : "truckId" , "type" : "int" },
      { "name" : "driverId" , "type" : "int"},
      { "name" : "driverName" , "type" : "string"},
      { "name" : "routeId" , "type" : "int"},
      { "name" : "route" , "type" : "string"},
      { "name" : "speed" , "type" : "int"}
   ]
}
```



+5 Import NiFi Flows from here - 

https://github.com/georgevetticaden/hdp/tree/master/reference-apps/iot-trucking-app/trucking-data-simulator/src/main/resources/nifi-flows


+6 Data-Loader Setup

* Data-Loader.zip - download from  https://drive.google.com/file/d/0BwT83-9bZp3ecjN5d3VWWmRxQlk/view
* Get DataLoader.zip, put it in /root and unzip it
```
ls -ltra /root/Data-Loader/routes/midwest/
cd Data-Loader/
gunzip routes.tar.gz 
tar xvf routes.tar 
rm -rf routes.tar

```



+7 Run Data Loader 

```

export PATH=$PATH:/usr/jdk64/jdk1.8.0_112/bin
export JAVA_HOME=/usr/jdk64/jdk1.8.0_112

chmod -R 775 /root/Data-Loader/*

java -cp /root/Data-Loader/stream-simulator-jar-with-dependencies.jar  hortonworks.hdp.refapp.trucking.simulator.SimulationRegistrySerializerRunnerApp \
20000  \
hortonworks.hdp.refapp.trucking.simulator.impl.domain.transport.Truck \
hortonworks.hdp.refapp.trucking.simulator.impl.collectors.KafkaEventSerializedWithRegistryCollector \
1 \
/root/Data-Loader/routes/midwest/ \
10000 \
kafka-broker:6667 \
http://schema-registry-node:7788/api/v1 \
ALL_STREAMS \
NONSECURE

```
