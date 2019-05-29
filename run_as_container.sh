#!/bin/sh

JENKINS_HOME=/home/ubuntu/jenkins

sudo docker service create \
--replicas=1 \
--name jenkins \
-p 8080:8080 \
-p 50000:50000 \
--mount type=bind,source=/var/run/docker.sock,destination=/var/run/docker.sock,readonly \
--mount type=bind,source=$(which docker),destination=/usr/bin/docker \
--mount type=bind,source=$JENKINS_HOME,destination=/var/jenkins_home \
felipederodrigues/jenkins:latest

