# FROM alpine:3.10
FROM ubuntu:latest

RUN ls
RUN pwd

RUN apt-get update && apt-get install -y
RUN apt install -y wget

RUN  apt-get install -y libarchive13
RUN  apt-get install -y libcurl4 

RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb
RUN dpkg -i libssl1.1_1.1.0g-2ubuntu4_amd64.deb

RUN  apt-get install -y python3

RUN  apt-get install -y pip
RUN pip install pandas
RUN pip install pyfiglet

RUN wget http://131.123.42.38/lmcrs/v1.0.0/srcml_1.0.0-1_ubuntu20.04.deb

RUN dpkg -i srcml_1.0.0-1_ubuntu20.04.deb


COPY entrypoint.sh /entrypoint.sh

COPY CatchIdentifiers.py /CatchIdentifiers.py

COPY results.py /results.py
WORKDIR /

ENTRYPOINT ["/entrypoint.sh"]