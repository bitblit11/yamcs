FROM ubuntu:16.04

MAINTAINER Windhover Labs

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
 && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 \
 && apt-get update \
 && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
 && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
 && apt-get install -y --force-yes oracle-java8-installer oracle-java8-set-default \
 && rm -rf /var/cache/oracle-jdk8-installer \
 && apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# Prerequisites
#RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
#RUN apt-get -y update
#RUN apt-get -y install openjdk-8-jdk maven nodejs-legacy npm apt-utils alien
#RUN npm -g install bower gulp
#RUN apt-get install -y --no-install-recommends software-properties-common

# Install Oracle JDK 8
#RUN apt-get install -y default-jre 
#RUN apt-get install -y default-jdk
#RUN add-apt-repository -y ppa:webup8team/java
#RUN apt-get -y update
#RUN debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
#RUN debconf shared/accepted-oracle-license-v1-1 seen true   | debconf-set-selections
#RUN apt-get install -y oracle-java8-installer
#RUN echo "export JAVA_HOME='/usr/lib/jvm/java-8-oracle'" >> ~/.bashrc

