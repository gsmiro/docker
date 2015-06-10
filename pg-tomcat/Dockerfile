FROM gsmiro/postgresql:9.3

RUN useradd tomcat
RUN ls -Rs /opt
ENV TOMCAT_HOME /opt/apache-tomcat-7.0.62
RUN mkdir $TOMCAT_HOME
RUN wget -P /tmp http://ftp.unicamp.br/pub/apache/tomcat/tomcat-7/v7.0.62/bin/apache-tomcat-7.0.62.tar.gz
RUN tar -C /opt -xzf /tmp/apache-tomcat-7.0.62.tar.gz
RUN chown -R tomcat:tomcat $TOMCAT_HOME
RUN rm -R $TOMCAT_HOME/webapps/*

COPY dockerbuild $DOCKERBUILD
RUN chmod -R 777 $DOCKERBUILD

USER tomcat
RUN cp $DOCKERBUILD/conf/* $TOMCAT_HOME/conf

USER root
VOLUME ["/opt/apache-tomcat-7.0.62/webapps"]
EXPOSE 5432
EXPOSE 8009
EXPOSE 8005
EXPOSE 80
EXPOSE 443
CMD ["/etc/dockerbuild/init.sh"]
