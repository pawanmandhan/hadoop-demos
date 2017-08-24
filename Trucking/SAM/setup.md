
# Setup 

## Schema Registry Setup 


+1 truck_events_log

• Name = truck_events_log
• Description = Schema for truck geo events in log files
• Type = Avro schema provider
• Schema Group = truck-sensors-log
• Compatibility: BACKWARD
• Check the evolve checkbox


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



+2 truck_speed_events_log

• Name = truck_speed_events_log
• Description = Schema for truck speed events in log files 
• Type = Avro schema provider
• Schema Group = truck-sensors-log
• Compatibility: BACKWARD
• Check the evolve checkbox



## Kafka Setup 


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



+3 Schema Registry for the Kafka Queues - Geo Event 


• Name = truck_events_avro
• Description = Schema for the kafka topic named 'truck_events_avro'
• Type = Avro schema provider
• Schema Group = truck-sensors-kafka
• Compatibility: BACKWARD



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




+4 Schema Registry for the Kafka Queues - Speed Event 

• Name = truck_speed_events_avro
• Description = Schema for the kafka topic named 'truck_speed_events_avro'
• Type = Avro schema provider
• Schema Group = truck-sensors-kafka
• Compatibility: BACKWARD
• Check the evolve checkbox


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




+5 Import NiFi Flows from here - 

https://github.com/georgevetticaden/hdp/tree/master/reference-apps/iot-trucking-app/trucking-data-simulator/src/main/resources/nifi-flows


+6 Get DataLoader.zip, put it in /root and unzip it

... TBD
