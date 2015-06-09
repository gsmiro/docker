FROM gsmiro/base
RUN sed -i -e "/\[base\]/p" -e "/\[updates\]/p" -e "s/\[base\]/exclude=postgresql*/" -e "s/\[updates\]/exclude=postgresql*/" /etc/yum.repos.d/CentOS-Base.repo 
RUN yum localinstall -y http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-centos93-9.3-1.noarch.rpm
RUN yum install -y postgresql93-server
RUN wget http://ftp.unicamp.br/pub/apache/tomcat/tomcat-7/v7.0.62/bin/apache-tomcat-7.0.62.tar.gz 
RUN tar -xzf apache-tomcat-7.0.62.tar.gz
COPY dockerbuild /etc/dockerbuild
RUN chmod -R 777 /etc/dockerbuild
RUN touch /var/log/psql-9.3.log
RUN chmod 777 /var/log/psql-9.3.log
USER postgres
RUN echo export LANG=pt_BR.utf8@ABNT >> ~/.bashrc
ENV LANG=pt_BR.utf8
ENV PG_HOME=/usr/pgsql-9.3
ENV PG_DATA=/var/lib/pgsql/9.3/data
RUN $PG_HOME/bin/initdb -D /var/lib/pgsql/9.3/data/ -U postgres --auth=peer --encoding=UTF8 --locale=pt_BR.utf8@ABNT
USER root
RUN cp /etc/dockerbuild/postgresql/conf/* $PG_DATA && chown -R postgres:postgres $PG_DATA
USER postgres
RUN $PG_HOME/bin/pg_ctl -D $PG_DATA -l /var/log/psql-9.3.log start && sleep 5 && psql -f /etc/dockerbuild/postgresql/initdb.sql
EXPOSE 5432
CMD $PG_HOME/bin/postgres -D $PG_DATA
