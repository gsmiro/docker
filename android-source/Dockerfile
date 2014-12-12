FROM ubuntu:trusty
COPY sources.list /etc/apt/sources.list
RUN gpg --keyserver keyserver.ubuntu.com --recv 3E5C1192
RUN gpg -o extras.pgp --export --armor 3E5C1192  
RUN apt-key add extras.pgp
RUN apt-get update
RUN apt-get install -y openjdk-7-jdk \
  git gnupg flex bison gperf build-essential \
  zip curl libc6-dev libncurses5-dev x11proto-core-dev \
  libx11-dev libreadline6-dev libgl1-mesa-glx \
  libgl1-mesa-dev g++-multilib mingw32 tofrodos \
  python-markdown libxml2-utils xsltproc zlib1g-dev
