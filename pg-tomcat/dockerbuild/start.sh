#!/bin/bash


sudo -u postgres $PGBIN/bin/pg_ctl start -D $PGCLUSTER --log /var/log/metaway/postgresql.log
sudo -u $TOMCAT_USER $CATALINA_HOME/bin/catalina.sh run
