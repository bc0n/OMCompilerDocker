
#FROM openjdk:10
#FROM gcc:4.9
#FROM java
FROM ubuntu:18.04

#enable color terminal
ENV TERM xterm-256color

RUN apt update
#RUN apt install -y build-essential openjdk-11-jdk autoconf cmake clang git gettext gdb gfortran
RUN apt install -y apt-utils
RUN apt install -y build-essential
RUN apt install -y autoconf
RUN apt install -y cmake
RUN apt install -y clang
RUN apt install -y git
RUN apt install -y gettext
RUN apt install -y gdb
RUN apt install -y pkg-config
RUN apt install -y flex
RUN apt install -y bison

#OMCompiler requirements
#RUN apt install -y libexpat1-dev libtool lp-solve liblapack-dev
RUN apt install -y default-jre
RUN apt install -y gfortran
RUN apt install -y libexpat1-dev
RUN apt install -y libtool
RUN apt install -y lp-solve
RUN apt install -y liblapack-dev
#RUN apt install -y hwloc

COPY OMCompiler /omcompiler
WORKDIR /omcompiler


#build OMCompiler --- if build fails, issue these manually and inspect the messages
#RUN make clean
RUN autoconf
RUN ./configure --prefix=/usr/local --disable-modelica3D
RUN make
RUN make install

#test build

