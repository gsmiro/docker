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
ONBUILD ENV DOCKERBUILD /etc/dockerbuild
ONBUILD RUN chown root:root $DOCKERBUILD
ONBUILD RUN chmod -R 777 $DOCKERBUILD
ONBUILD RUN if [ -f $DOCKERBUILD/sources.list ]; then cp $DOCKERBUILD/sources.list /etc/apt/sources.list;fi;
ONBUILD RUN cp $DOCKERBUILD/openssl.cnf /etc/ssl/openssl.cnf
ONBUILD ENV OPENSSL_CONF /etc/ssl/openssl.cnf
ONBUILD ENV CA_HOME /home/ca
ONBUILD RUN mkdir $CA_HOME $CA_HOME/ca $CA_HOME/certs $CA_HOME/crl $CA_HOME/newcerts $CA_HOME/private
ONBUILD RUN touch $CA_HOME/index.txt
ONBUILD RUN echo "01" > $CA_HOME/serial
ONBUILD RUN openssl req -config $OPENSSL_CONF -new -x509 -extensions v3_ca -keyout $CA_HOME/private/cakey.pem -out $CA_HOME/ca/cacert.pem -days 3650 -passout file:$DOCKERBUILD/passwd
ONBUILD RUN rm $DOCKERBUILD/passwd
