#!/bin/bash

rm target/simple-view-0.1.0.jar
/opt/local/share/java/maven3/bin/mvn package
scp target/simple-view-0.1.0.jar root@sandbox.hortonworks.com:~
