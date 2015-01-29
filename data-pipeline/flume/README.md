
# Flume setup instructions

Use these instructions to setup  the flume part of the project using spooling directory flume configurations. See [Flume Spooling Dir Docs](https://flume.apache.org/FlumeUserGuide.html#spooling-directory-source)

## Copy the flume conf to the config directory 
* cd /etc/flume/conf
* mv flume.conf flume.conf.bak
* cd - 
* cp ./flume.conf.hdfs_sink /etc/flume/conf/flume.conf

## Start the flume process 

```
flume-ng agent -c /etc/flume/conf -f /etc/flume/conf/flume.conf -n sandbox
```


