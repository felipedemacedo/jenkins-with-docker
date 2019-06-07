FROM jenkins/jenkins:lts-jdk11

USER root

ENV TZ=America/Recife
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
      && apt-get upgrade -y \
      && apt-get install -y sudo libltdl-dev zip \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
