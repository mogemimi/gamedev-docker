FROM ubuntu:17.10
MAINTAINER <https://github.com/mogemimi>

RUN \
  apt update && \
  apt upgrade -y && \
  apt install -y \
    build-essential \
    software-properties-common \
    byobu \
    curl \
    git \
    htop \
    man \
    unzip \
    wget \
    make \
    cmake \
    python2.7 \
    clang-3.8 \
    libc++-dev \
    libc++abi-dev \
    mesa-common-dev \
    libglu1-mesa-dev \
    freeglut3-dev \
    libopenal1 \
    libopenal-dev && \
  apt clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /root
CMD ["bash"]
