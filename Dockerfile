FROM ubuntu:latest
USER root
RUN apt update -y && apt upgrade -y
RUN apt-get install git libssl-dev libpam0g-dev zlib1g-dev dh-autoreconf -y
RUN git clone https://github.com/shellinabox/shellinabox.git && cd shellinabox  
RUN autoreconf -i
RUN ./configure && make
RUN ./shellinaboxd

