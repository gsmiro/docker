#!/bin/bash
runuser -c "$PG_HOME/bin/pg_ctl -D $PG_DATA -l /var/log/psql-9.3.log start" -l postgres
runuser -c "$TOMCAT_HOME/bin/catalina.sh run" -l tomcat
