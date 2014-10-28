#!/bin/bash
sudo -u postgres $PGBIN/bin/pg_ctl $@ -D $PGCLUSTER --log /var/log/metaway/postgresql.log
sudo -u $TOMCAT_USER $CATALINA_HOME/bin/catalina.sh $@
#INFINITE LOOP TO BLOCK CONTAINER
while : 
do
	sleep 5
done
