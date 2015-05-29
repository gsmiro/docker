FROM centos:7
RUN useradd redmine -g wheel
RUN yum makecache
RUN yum install -y ruby ruby-devel make gcc git git-svn zlib-devel curl-devel openssl-devel apr-devel apr-util-devel
WORKDIR /home/redmine
COPY database.sh ./
RUN chown redmine:wheel database.sh
RUN chmod ug+x database.sh
RUN mkdir .ssh
RUN ssh-keyscan github.com >> .ssh/authorized_keys
RUN chown -R redmine:wheel .ssh
RUN chmod 700 .ssh
RUN chmod 600 .ssh/*
USER redmine
RUN ssh-keygen -t rsa -q -f .ssh/id_rsa
RUN git clone https://github.com/redmine/redmine.git
RUN gem install bundler --no-rdoc --no-ri --no-update-source
WORKDIR /home/redmine/redmine
ENV DB_ADAPTER postgresql
ENV DB_NAME redmine
ENV DB_HOST localhost
ENV DB_USERNAME redmine
ENV DB_ENCODING utf-8
USER root
RUN yum install -y tar
RUN yum install -y patch
RUN yum install -y postgresql-devel mysql-devel
USER redmine
RUN ../database.sh > config/database.yml
#RUN /home/redmine/.gem/ruby/gems/bundler-1.10.1/bin/bundle  install --without development test
CMD /bin/bash

