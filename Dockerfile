# A bleeding edge Ubuntu 14.04 image for compiling C++11 OpenGL projects.
FROM        ubuntu:14.04
MAINTAINER  andystanton

# set default locale
RUN         locale-gen en_US.UTF-8
ENV         LANG en_US.UTF-8 
ENV         LANGUAGE en_US:en 
ENV         LC_ALL en_US.UTF-8

# update and install dependencies
RUN         apt-get update \
                && apt-get install -y software-properties-common \
                && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
                && apt-get update \
                && apt-get install -y \
                    make \
                    gcc-4.9 \
                    g++-4.9 \
                    gcc-4.9-base \
                    git \
                    curl \
                    ruby \
                    xorg-dev \
                    libglu1-mesa-dev \
                && gem install rake \
                && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100 \
                && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 100

# build cmake
RUN         curl -O http://www.cmake.org/files/v3.0/cmake-3.0.2.tar.gz \
                && tar -xvf cmake-3.0.2.tar.gz
WORKDIR     cmake-3.0.2
RUN         ./bootstrap \
                && make \
                && make install
