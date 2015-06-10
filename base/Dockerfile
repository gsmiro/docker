FROM centos:7
COPY dockerbuild /etc/dockerbuild
RUN chmod -R 777 /etc/dockerbuild
ENV DOCKERBUILD /etc/dockerbuild
RUN yum install -y git wget java-1.7.0-openjdk-devel sudo tar
RUN yum reinstall -q -y glibc-common
RUN mkdir /usr/lib/locale/pt_BR.utf8@ABNT
RUN localedef --quiet -c -i $DOCKERBUILD/pt_BR\@abnt.src -f UTF-8 /usr/lib/locale/pt_BR\.utf8@ABNT
ENV JAVA_HOME /etc/alternatives/java_sdk
