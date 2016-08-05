#!/bin/sh
# This script updates the UUID file and collectd and then restarts collectd
# Current requirements are curl and sed

uuid_file='/etc/collectd/instance_uuid'

touch $uuid_file
uuid="$(curl -s http://169.254.169.254/openstack/latest/meta_data.json | sed -e 's/.*"uuid": "//; s/".*//')"
echo $uuid > $uuid_file
sed -i "s/^Hostname.*/Hostname \"$uuid\"/" /etc/collectd/collectd.conf
/etc/init.d/collectd restart
exit 0
