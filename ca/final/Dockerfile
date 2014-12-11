FROM gsmiro/ca:deps
RUN cp $DOCKERBUILD/openssl.cnf /etc/ssl/openssl.cnf
ENV OPENSSL_CONF /etc/ssl/openssl.cnf
ENV CA_HOME /home/ca
RUN mkdir $CA_HOME $CA_HOME/ca $CA_HOME/certs $CA_HOME/crl $CA_HOME/newcerts $CA_HOME/private
RUN touch $CA_HOME/index.txt
RUN echo "01" > $CA_HOME/serial
RUN openssl req -config $OPENSSL_CONF -new -x509 -extensions v3_ca -keyout $CA_HOME/private/cakey.pem -out $CA_HOME/ca/cacert.pem -days 3650 -passout file:$DOCKERBUILD/passwd
