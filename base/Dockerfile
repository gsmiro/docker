FROM centos:7
COPY dockerbuild /etc/dockerbuild
RUN chmod -R 755 /etc/dockerbuild
ENV DOCKERBUILD /etc/dockerbuild
RUN yum install -y git wget openjdk-7-jdk 
RUN yum install -y sudo tar
RUN locale -a
RUN yum reinstall -q -y glibc-common
RUN locale -a
RUN localedef --help
RUN mkdir /usr/lib/locale/pt_BR.utf8@ABNT
RUN localedef --quiet -c -i $DOCKERBUILD/pt_BR\@abnt.src -f UTF-8 /usr/lib/locale/pt_BR\.utf8@ABNT
