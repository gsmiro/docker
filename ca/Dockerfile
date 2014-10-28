FROM ubuntu:trusty
COPY dockerbuild /etc/dockerbuild
RUN chmod -R 700 /etc/dockerbuild
RUN if [ -f /etc/dockerbuild/sources.list ]; then cp /etc/dockerbuild/sources.list /etc/apt/sources.list;fi;
RUN sudo apt-get update
#bash vulnerabilities?!
RUN apt-get upgrade -y bash
RUN apt-get install -y openssl
RUN apt-get install -y openjdk-7-jdk 
RUN rm -R /etc/dockerbuild
ONBUILD COPY dockerbuild /etc/dockerbuild
ONBUILD RUN chown root:root /etc/dockerbuild
ONBUILD RUN chmod -R 700 /etc/dockerbuild
ONBUILD RUN if [ -f /etc/dockerbuild/sources.list ]; then cp /etc/dockerbuild/sources.list /etc/apt/sources.list;fi;
ONBUILD RUN cp /etc/dockerbuild/openssl.cnf /etc/ssl/openssl.cnf
ONBUILD ENV OPENSSL_CONF /etc/ssl/openssl.cnf
ONBUILD ENV CA_HOME /home/ca
ONBUILD RUN mkdir $CA_HOME $CA_HOME/certs $CA_HOME/crl $CA_HOME/newcerts $CA_HOME/private
ONBUILD RUN touch $CA_HOME/index.txt
ONBUILD RUN echo "01" > $CA_HOME/serial
ONBUILD RUN openssl req -config $OPENSSL_CONF -new -x509 -extensions v3_ca -keyout $CA_HOME/private/ca.key -out $CA_HOME/certs/ca.crt -days 3650 -passout file:/etc/dockerbuild/passwd
ONBUILD RUN rm /etc/dockerbuild/passwd
