FROM ubuntu:21.04
LABEL maintainer "https://github.com/mogemimi"

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

# Install prerequisites
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget gnupg

# Install build tools and libraries
RUN \
  apt-get update && \
  apt-get install -y \
    build-essential \
    software-properties-common \
    curl \
    git \
    htop \
    unzip \
    make \
    ninja-build \
    cmake \
    golang-go \
    libssl-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Install emscripten SDK
RUN \
  git clone https://github.com/emscripten-core/emsdk.git && \
  cd emsdk && \
  ./emsdk install latest && \
  ./emsdk activate latest && \
  . ./emsdk_env.sh

# Install CMake 3.20.5
RUN \
  mkdir cmakebuild && cd cmakebuild && \
  wget https://github.com/Kitware/CMake/releases/download/v3.20.5/cmake-3.20.5.tar.gz && \
  tar -xf cmake-3.20.5.tar.gz && \
  cd cmake-3.20.5 && \
  ./bootstrap --parallel=10 --prefix=/usr/local && \
  make -j2 && \
  make install && \
  cd ../.. && \
  rm -R cmakebuild

WORKDIR /root
CMD ["bash"]
