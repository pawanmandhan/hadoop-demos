



cd /usr/hdf/current/kafka-broker/bin/		
/usr/hdf/current/kafka-broker/bin/kafka-topics.sh --list --zookeeper birens-hdf0.field.hortonworks.com
./kafka-topics.sh --create --zookeeper birens-hdf0.field.hortonworks.com --replication-factor 1 --partition 3 --topic raw-truck_events_avro

nohup java -cp /root/trucking/Data-Loader/stream-simulator-jar-with-dependencies.jar  hortonworks.hdp.refapp.trucking.simulator.SimulationRegistrySerializerRunnerApp 
20000 
hortonworks.hdp.refapp.trucking.simulator.impl.domain.transport.Truck
hortonworks.hdp.refapp.trucking.simulator.impl.collectors.KafkaEventSerializedWithRegistryCollector
1
/root/trucking/Data-Loader/routes/midwest/
10000
sandbox-hdf.hortonworks.com:6667
http://sandbox-hdf.hortonworks.com:17788/api/v1
ALL_STREAMS
NONSECURE
&
