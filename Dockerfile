FROM ubuntu:14.04

MAINTAINER Andy Stanton

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:kubuntu-ppa/backports
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get update
RUN apt-get install -y make gcc-4.9 g++-4.9 git curl

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 80
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 80

RUN curl -O http://www.cmake.org/files/v3.0/cmake-3.0.2.tar.gz
RUN tar -xvf cmake-3.0.2.tar.gz
RUN cd cmake-3.0.2 && ./bootstrap
RUN cd cmake-3.0.2 && make
RUN cd cmake-3.0.2 && make install

RUN cmake --version

