# jenkins-with-docker

## Before you ask

Yes, it works !
You can run Docker commands inside a Jenkins Docker container.

![image](https://user-images.githubusercontent.com/7635127/58577459-e25dbd00-821c-11e9-819b-069a3896ff21.png)

## Run as container

Create a directory on host to persist important data from Jekins.
e.g.:
mkdir /home/ubunt/jenkins

Then run a script like this on terminal:

```java
JENKINS_HOME=/home/ubuntu/jenkins

sudo docker run -d \
--name jenkins \
--restart always \
-p 8080:8080 \
-p 50000:50000 \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
-v $JENKINS_HOME:/var/jenkins_home \
-v $(which docker):/usr/bin/docker \
felipederodrigues/jenkins:latest
```

## Run as service

```java
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
```
