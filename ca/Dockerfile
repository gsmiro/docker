FROM gsmiro/base
COPY dockerbuild /etc/dockerbuild
RUN yum makecache fast
RUN yum install -y mcrypt openssl
RUN cp $DOCKERBUILD/openssl.cnf /etc/ssl/openssl.cnf
ENV OPENSSL_CONF /etc/ssl/openssl.cnf
ENV CA_HOME /etc/ca
RUN mkdir $CA_HOME $CA_HOME/ca $CA_HOME/certs $CA_HOME/crl $CA_HOME/newcerts $CA_HOME/private
RUN touch $CA_HOME/index.txt
RUN echo "01" > $CA_HOME/serial
RUN openssl req -config $OPENSSL_CONF -new -x509 -extensions v3_ca -keyout $CA_HOME/private/cakey.pem -out $CA_HOME/ca/cacert.pem -days 3650 -passout file:$DOCKERBUILD/passwd
WORKDIR /etc/ca
#ENTRYPOINT ["openssl","ca","-batch"] 
VOLUME /etc/ca/
CMD openssl ca -verbose -batch -out $OUTFILE -extensions v3_req -passin file:${PASSIN} -key $(cat $DOCKERBUILD/passwd) -infiles $INFILES && ls -aR   
