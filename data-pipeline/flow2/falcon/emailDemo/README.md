# Instructions to setup this falcon job 

## Prerequisite 

 * Make sure all the directories listed as locations in the cluster files exists on HDFS
 * All the directories should be owned by falcon:hdfs
 * The *staging directory should have the permissions 777
 * The *working diectory should have the permission 755 


## Submitting the falcon entities 

```
  falcon entity -type cluster -submit -file oregonCluster.xml
  falcon entity -type cluster -submit -file virginiaCluster.xml 
  falcon entity -type feed -submit -file rawEmailFeed.xml
  falcon entity -type feed -submit -file cleansedEmailFeed.xml
```
