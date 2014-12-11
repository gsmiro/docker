FROM gsmiro/base
COPY dockerbuild /etc/dockerbuild
RUN if [ -f /etc/dockerbuild/sources.list ]; then cp /etc/dockerbuild/sources.list /etc/apt/sources.list;fi;
RUN apt-get install -y openssl
