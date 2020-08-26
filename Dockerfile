FROM ubuntu:18.04
RUN apt-get update && \
      apt-get -y install sudo && \
      apt-get -y install snap
COPY . ubuntu-setup
