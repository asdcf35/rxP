FROM ubuntu:latest
USER root
RUN apt update -y && apt upgrade -y
RUN apt-get install git libssl-dev libpam0g-dev zlib1g-dev dh-autoreconf 
RUN git clone https://github.com/shellinabox/shellinabox.git && cd shellinabox  
RUN autoreconf -i
RUN ./configure && make
RUN ./shellinaboxd
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz
RUN tar -xf ngrok-stable-linux-amd64.tgz
RUN ngrok authtoken 26tT6dM2fQuPcT3b71bZKTY1MuF_51EqM7kLyF7fN26FoZLxJ
RUN ngrok http 4200
