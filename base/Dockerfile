FROM centos:7
COPY dockerbuild /etc/dockerbuild
RUN chmod -R 755 /etc/dockerbuild
ENV DOCKERBUILD /etc/dockerbuild
RUN yum install -y git wget openjdk-7-jdk 
RUN yum install -y sudo tar
RUN yum reinstall -y glibc-common
