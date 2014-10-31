#!/bin/bash

if [ -f $CATALINA_HOME/keystore ]
then
	echo "Keystore already created"
else
	openssl ca -config "$OPENSSL_CONF" -extensions v3_req -md sha1 -infiles server.csr

	keytool -import -alias ca -file $CA_HOME/ca/cacert.pem -keystore $CATALINA_HOME/.keystore -storepass $(cat $DOCKERBUILD/tomcat/storepasswd)
	keytool -import -alias server -file $CA_HOME/certs/$(cat $CA_HOME/serial).pem -keystore $CATALINA_HOME/.keystore -storepass $(cat $DOCKERBUILD/tomcat/storepass)
	
fi

sudo -u postgres $PGBIN/bin/pg_ctl $@ -D $PGCLUSTER --log /var/log/metaway/postgresql.log
sudo -u $TOMCAT_USER $CATALINA_HOME/bin/catalina.sh $@
#INFINITE LOOP TO BLOCK CONTAINER
while : 
do
	sleep 5
done
