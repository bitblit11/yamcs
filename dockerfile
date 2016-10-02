FROM ubuntu:16.04

# Install Oracle JDK 8
RUN apt-get install -y default-jre default-jdk
RUN add-apt-repository -y ppa:webup8team/java
RUN apt-get -y update
RUN debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN debconf shared/accepted-oracle-license-v1-1 seen true   | debconf-set-selections
RUN apt-get install -y oracle-java8-installer
RUN echo "export JAVA_HOME='/usr/lib/jvm/java-8-oracle'" >> ~/.bashrc

# Prerequisites
RUN yum -y update
RUN yum -y install maven nodejs-legacy npm
RUN npm -g install bower gulp


