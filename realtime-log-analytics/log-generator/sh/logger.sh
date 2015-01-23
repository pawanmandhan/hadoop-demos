#!/bin/sh

set +vx

#2014-03-30 21:54:19 190.99.146.63 GET /failover.www.compuware.com.akadns.net/etc/designs/compuware/compuware-apm/clientlibs/images/menubackground.png 200 12022 58 "http://www.compuware.com/en_us/application-performance-management/Benchmarks/view-benchmarks.html" "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36" "-" 


# shuf -n 1 $FILE


#log count
lc=$1
#time limit
sl=$2
#while true
#for i in {1..$ul}
i=1
while [ $i -le ${lc} ]
do
echo `date +'%d/%m/%Y %H:%M:%S:%3N'` 
i=$(( $i + 1 ))
done

sleep $sl
