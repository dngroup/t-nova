#!/usr/bin/env bash

i=0
random=$(( ( RANDOM % 10000 )  + 1 ))

echo "Send resquet @ $1 users by minutes through $2"
echo "random value: $random"
while true
do
   echo "Send request $i "
   echo "curl http://clips.vorwaerts-gmbh.de/VfE_html5.mp4?${random}_$i"
   curl -I "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4?${random}_$i" -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-US,en;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/53.0.2785.143 Chrome/53.0.2785.143 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Proxy-Connection: keep-alive' --compressed --proxy "$2"
   sleep $((60/$1))
   i=$(($i+1))

done
