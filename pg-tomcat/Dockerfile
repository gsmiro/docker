FROM gsmiro/ca
RUN gpg --keyserver keyserver.ubuntu.com --recv 3E5C1192
RUN gpg -o extras.pgp --export --armor 3E5C1192  
RUN apt-key add extras.pgp
RUN apt-get update 
RUN apt-get install -y language-pack-pt
RUN apt-get -y upgrade bash

RUN echo "America/Sao_Paulo" > /etc/timezone    
RUN dpkg-reconfigure -f noninteractive tzdata

ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8
ENV LC_ADDRESS pt_BR.UTF-8
ENV LC_ALL pt_BR.UTF-8
ENV LC_COLLATE pt_BR.UTF-8
ENV LC_CTYPE pt_BR.UTF-8
ENV LC_IDENTIFICATION pt_BR.UTF-8
ENV LC_MEASUREMENT pt_BR.UTF-8
ENV LC_MESSAGES pt_BR.UTF-8
ENV LC_MONETARY pt_BR.UTF-8
ENV LC_NAME pt_BR.UTF-8
ENV LC_NUMERIC pt_BR.UTF-8
ENV LC_PAPER pt_BR.UTF-8
ENV LC_RESPONSE pt_BR.UTF-8
ENV LC_TELEPHONE pt_BR.UTF-8
ENV LC_TIME pt_BR.UTF-8

RUN apt-get install -y git
RUN apt-get install -y tomcat7
RUN apt-get install -y postgresql-9.3=9.3.5-0ubuntu0.14.04.1 

ENV PGVER 9.3
ENV PGBIN /usr/lib/postgresql/$PGVER
ENV PGHOME /var/lib/postgresql
ENV PGCLUSTER $PGHOME/$PGVER/cluster

RUN mkdir $PGCLUSTER
RUN mkdir /var/log/postgres
RUN chown -R postgres:postgres $PGHOME /var/log/postgres

USER postgres
RUN $PGBIN/bin/initdb -D $PGCLUSTER --locale=pt_BR.utf-8 -A md5 --pwfile=$DOCKERBUILD/pgconfig/passwd
RUN cp $DOCKERBUILD/pgconfig/* $PGCLUSTER

USER root

ENV TOMCAT_USER tomcat7
ENV CATALINA_HOME /usr/share/tomcat7
ENV CATALINA_BASE /var/lib/tomcat7
ENV CATALINA_TMPDIR /usr/share/tomcat7/temp
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV JRE_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV CATALINA_PID /var/run/tomcat7.pid 

RUN touch $CATALINA_PID $CATALINA_BASE/logs/catalina.out
RUN chown $TOMCAT_USER:$TOMCAT_USER $CATALINA_PID $CATALINA_BASE/logs/catalina.out

RUN echo "#!/bin/bash" > $CATALINA_HOME/bin/setenv.sh
RUN set | sed -n -e /^CATALINA.*/p -e /^JRE_.*/p -e /^JAVA_.*/p -e /^LOGGING.*/p -e /^JPDA.*/p | sed "s/\(.*\)/export \1/" >> $CATALINA_HOME/bin/setenv.sh
RUN chmod 770 $CATALINA_HOME/bin/setenv.sh
RUN chown $TOMCAT_USER:$TOMCAT_USER $CATALINA_HOME/bin/setenv.sh 

WORKDIR /usr/share/tomcat7
RUN openssl req -config $OPENSSL_CONF -newkey rsa -keyout $CA_HOME/private/server.key -passout file:$DOCKERBUILD/tomcat/keypasswd -out $CA_HOME/certs/server.csr
#Signing
RUN openssl x509 -req -days 3650 -CA $CA_HOME/ca/cacert.pem -CAkey $CA_HOME/private/cakey.pem -CAserial $CA_HOME/serial -sha1 -extensions v3_req -passin file:$DOCKERBUILD/tomcat/keypasswd -in $CA_HOME/certs/server.csr 
 
#echo "Import ca to keystore"
 
#Create the server chain in keystore
#import the CA to the keystore
RUN keytool -import -alias ca -file $CA_HOME/ca/cacert.pem -keystore keystore.jks -storepass $(cat $DOCKERBUILD/tomcat/storepasswd)
#import the signed certificate
RUN keytool -import -alias server -file $CA_HOME/certs/server.crt -keystore keystore.jks -storepass $(cat $DOCKERBUILD/tomcat/storepass)

RUN mkdir /home/$TOMCAT_USER
RUN chown $TOMCAT_USER:$TOMCAT_USER /home/$TOMCAT_USER
RUN cp $DOCKERBUILD/start.sh /home/$TOMCAT_USER/
RUN chmod 770 /home/$TOMCAT_USER/start.sh
RUN chown $TOMCAT_USER:$TOMCAT_USER /home/$TOMCAT_USER/start.sh

EXPOSE 5432
EXPOSE 8080

USER tomcat7
CMD ["./home/$TOMCAT_USER/start.sh","start"]  
