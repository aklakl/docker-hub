#!/bin/bash
#get ip address
#HostIP=$(ip route show | awk '/default/ {print $9}')
HostIP=$(ip route get $(ip route show 0.0.0.0/0 | grep -oP 'via \K\S+') | grep -oP 'src \K\S+')
docker pull dragoscampean/testrepo:jmetrumaster
docker run -dit --name master --network host -e HostIP=$HostIP -e Xms=256m -e Xmx=512m -e MaxMetaspaceSize=512m -v /opt/Sharedvolume:/opt/Sharedvolume dragoscampean/testrepo:jmetrumaster /bin/bash