FROM debian:jessie
ONBUILD COPY pgconf/ /etc/dockerbuild/pgconf
RUN apt-get update
RUN apt-get install -dy postgresql-plperl-9.3 bucardo=5.1.0-1
ENV LANG_SET pt_BR.UTF-8
ONBUILD RUN apt-get install -y locales
ONBUILD RUN echo "LANG=$LANG_SET" >> /etc/default/locale
ONBUILD RUN echo "LC_MESSAGES=$LANG_SET" >> /etc/default/locale
ONBUILD RUN echo "LC_COLLATE=$LANG_SET" >> /etc/default/locale
ONBUILD RUN echo "LC_CTYPE=$LANG_SET" >> /etc/default/locale
ONBUILD RUN echo "LANGUAGE=$LANG_SET" >> /etc/default/locale
ONBUILD RUN echo $LANG_SET|awk -F \. "{print \$0, \$2}" >> /etc/locale.gen
ONBUILD RUN dpkg-reconfigure -f noninteractive locales
ONBUILD RUN apt-get install -y postgresql-plperl-9.3 bucardo=5.1.0-1
ONBUILD RUN ln -s /usr/lib/postgresql/9.3/bin/postgres /usr/bin
ONBUILD RUN cp -rf /etc/dockerbuild/pgconf/.* /etc/postgresql/9.3/main/
ONBUILD USER postgres
# Add VOLUMEs to allow backup of config, logs and databases
ONBUILD VOLUME  ["~/share","/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Set the default command to run when starting the container
CMD ["postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]
