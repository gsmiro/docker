FROM debian:jessie
RUN apt-get update
RUN apt-get install -y adduser locales 
RUN apt-get install -dy bucardo
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8
ENV LC_CTYPE pt_BR.UTF-8
ENV LC_MESSAGES pt_BR.UTF-8
ENV LC_COLLATE pt_BR.UTF-8
RUN mv /etc/locale.gen /etc/locale.gen.old
RUN sed -e "s/.*\($LANG\)\(.*\)/\\1 \\2/g" /etc/locale.gen.old > /etc/locale.gen
RUN locale-gen
RUN dpkg-reconfigure -f noninteractive locales
#RUN apt-get install -y bucardo
#RUN ln -s /usr/lib/postgresql/9.4/bin/postgres /usr/bin
#USER postgres

# Add VOLUMEs to allow backup of config, logs and databases
#VOLUME  ["~/share","/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

ONBUILD COPY pgconf/ /etc/dockerbuild/pgconf

# Set the default command to run when starting the container
CMD ["postgres", "-D", "/var/lib/postgresql/9.4/main", "-c", "config_file=/etc/postgresql/9.4/main/postgresql.conf"]
