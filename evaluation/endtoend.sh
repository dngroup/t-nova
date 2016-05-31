while true; do export amount=`curl http://10.10.1.169:5000/api/content | xml_pp | grep HIGH_H264 | wc -l`; echo $(date +%s),$((amount-old)),$amount;  export old=$amount; sleep 1; done
