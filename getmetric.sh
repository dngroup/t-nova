#!/usr/bin/env bash

curl -G 'http://10.10.1.62:8086/query?pretty=true' --data-urlencode "db=statsdb" --data-urlencode "q=SELECT value FROM transcoding_score WHERE host='$(curl -s http://169.254.169.254/openstack/latest/meta_data.json | sed -e 's/.*"uuid": "//; s/".*//')' AND time > now() - 20m ORDER BY time DESC LIMIT 5"
