FROM ubuntu:18.04
LABEL maintainer="hiroaki aizawa"

RUN apt-get update && apt-get install -y \
    build-essential \
    scons \
    libpng-dev \
    libjpeg-dev \
    libilmbase-dev \
    libxerces-c-dev \
    libboost-all-dev \
    libopenexr-dev \
    libglewmx-dev \
    libxxf86vm-dev \
    libpcrecpp0v5 \
    libeigen3-dev \
    libfftw3-dev \
    libglu1-mesa-dev \
    freeglut3-dev \
    mesa-common-dev \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/shi-jian/mitsuba-shapenet.git
WORKDIR /mitsuba-shapenet
RUN cp build/config-linux-gcc.py config.py \
    && scons
RUN echo 'source /mitsuba-shapenet/setpath.sh' >> ~/.bashrc

WORKDIR /workspace
