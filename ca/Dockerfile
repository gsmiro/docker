FROM ubuntu:trusty
ONBUILD COPY sources.list /etc/apt/sources.list
RUN sudo apt-get update
#bash vulnerabilities?!
RUN apt-get upgrade -y bash
RUN apt-get install -y openssl
RUN apt-get install -y openjdk-7-jdk 
COPY openssl.cnf /etc/ssl/openssl.cnf
RUN chown root /etc/ssl/openssl.cnf
RUN chmod 400 /etc/ssl/openssl.cnf
ENV OPENSSL_CONF /etc/ssl/openssl.cnf
ENV CA_HOME /home/ca
RUN mkdir $CA_HOME $CA_HOME/certs $CA_HOME/crl $CA_HOME/newcerts $CA_HOME/private
RUN touch $CA_HOME/index.txt
RUN echo "01" > $CA_HOME/serial
ONBUILD COPY passwd .
ONBUILD RUN openssl req -config $OPENSSL_CONF -new -x509 -extensions v3_ca -keyout $CA_HOME/private/ca.key -out $CA_HOME/certs/ca.crt -days 3650 -passout file:passwd
ONBUILD RUN rm passwd
