#!/bin/bash
runuser -c "$PG_HOME/bin/postgres -D $PG_DATA" -l postgres
