FROM debian:jessie
RUN apt-get update
RUN apt-get install -y wget python-minimal python-dev postgresql python-psycopg2 gcc
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install genshi trac psycopg2 
