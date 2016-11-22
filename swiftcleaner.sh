#!/usr/bin/env bash
SWIFTADDR=$1
STORAGE=http://$SWIFTADDR:8080/v1/AUTH_admin/
ST_AUTH=http://$SWIFTADDR:8080/auth/v1.0
ST_KEY=admin
ST_USER=admin:admin


TOKEN=$(curl -i -H "X-Auth-User:$ST_USER" -H "X-Auth-Key:$ST_KEY" $ST_AUTH | grep "X-Storage-Token:" | sed 's/X-Storage-Token: //')

for CONTAINER in `curl -H "X-Auth-Token:$TOKEN" $STORAGE`; do
    for FILE in `curl -H "X-Auth-Token:$TOKEN" $STORAGE$CONTAINER`; do
        curl -X DELETE -H "X-Auth-Token:$TOKEN" $STORAGE$CONTAINER/$FILE
    done
    curl -X DELETE -H "X-Auth-Token:$TOKEN" $STORAGE$CONTAINER
done