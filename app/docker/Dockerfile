
FROM ubuntu:20.04

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get -y update && apt-get -y install apt-utils
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y kmod make gcc wget
RUN apt-get install -y rpm2cpio cpio
RUN apt-get install -y fuse
RUN apt-get install -y file
