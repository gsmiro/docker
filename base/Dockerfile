FROM ubuntu:trusty
COPY dockerbuild /etc/dockerbuild
RUN chmod -R 700 /etc/dockerbuild
RUN if [ -f /etc/dockerbuild/sources.list ]; then cp /etc/dockerbuild/sources.list /etc/apt/sources.list;fi;
ENV DOCKERBUILD /etc/dockerbuild
RUN apt-get update
RUN apt-get upgrade -y bash
RUN apt-get install -y git openjdk-7-jdk 
