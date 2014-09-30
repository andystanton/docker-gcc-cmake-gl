FROM        ubuntu:14.04
MAINTAINER  andystanton
RUN         apt-get update \
                && apt-get install -y software-properties-common \
                && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
                && apt-get update \
                && apt-get install -y \
                    make \
                    gcc-4.9 g++-4.9 gcc-4.9-base \
                    gcc-4.8 g++-4.8 gcc-4.8-base \
                    gcc-4.7 g++-4.7 gcc-4.7-base \
                    gcc-4.6 g++-4.6 gcc-4.6-base \
                    git \
                    curl \
                    ruby \
                    xorg-dev \
                    libglu1-mesa-dev \
                && deb http://llvm.org/apt/unstable/ llvm-toolchain-3.5 main \
                && gem install rake \
                && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100 \
                && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 100
RUN         curl -O http://www.cmake.org/files/v3.0/cmake-3.0.2.tar.gz \
                && tar -xvf cmake-3.0.2.tar.gz
WORKDIR     cmake-3.0.2
RUN         ./bootstrap \
                && make \
                && make install
