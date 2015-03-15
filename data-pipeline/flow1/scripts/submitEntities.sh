#!/bin/bash


falcon entity -submit -type cluster -file /app/hadoop-demos/data-pipeline/flow1/falcon/cluster/primaryCluster.xml
falcon entity -submit -type feed -file /app/hadoop-demos/data-pipeline/flow1/falcon/feeds/inputFeed.xml
falcon entity -submit -type process -file /app/hadoop-demos/data-pipeline/flow1/falcon/process/processData.xml

