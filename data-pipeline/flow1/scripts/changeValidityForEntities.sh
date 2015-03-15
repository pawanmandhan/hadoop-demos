#!/bin/bash

service ntpd start
chkconfig ntpd on

echo "Changing Feed File"
cd ../falcon/feeds
rm -rf inputFeed.xml.ORIGINAL
cp inputFeed.xml inputFeed.xml.ORIGINAL

vl=`grep -n "validity" inputFeed.xml.ORIGINAL | awk -F':' '{ print $1 }'`
vlb=$(( $vl - 1 ))
vla=$(( $vl + 1 ))

ve=$(date -d "+10 days" +"%Y-%m-%dT%H:%MZ")
vs=$(date -d "+5 minutes" +"%Y-%m-%dT%H:%MZ")

head -n $vlb inputFeed.xml.ORIGINAL  >> inputFeed.xml.new
echo "<validity start=\"${vs}\" end=\"${ve}\" />" >> inputFeed.xml.new
tail -n $vla  inputFeed.xml >> inputFeed.xml.new

rm inputFeed.xml
mv inputFeed.xml.new inputFeed.xml

echo "Feed File changed"

echo "Changing Process File"
cp processData.xml processData.xml.ORIGINAL

vl=`grep -n "validity" processData.xml.ORIGINAL | awk -F':' '{ print $1 }'`
vlb=$(( $vl - 1 ))
vla=$(( $vl + 1 ))

ve=$(date -d "+10 days" +"%Y-%m-%dT%H:%MZ")
vs=$(date -d "+5 minutes" +"%Y-%m-%dT%H:%MZ")

head -n $vlb processData.xml.ORIGINAL  >> processData.xml.new
echo "<validity start=\"${vs}\" end=\"${ve}\" />" >> processData.xml.new
tail -n $vla  processData.xml >> processData.xml.new

rm processData.xml
mv processData.xml.new processData.xml
