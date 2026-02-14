# syntax=docker/dockerfile:1
FROM ubuntu:24.04
LABEL maintainer="https://github.com/mogemimi"

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

# Install prerequisites
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget gnupg

# Install LLVM and Clang 21
RUN \
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
  echo "deb http://apt.llvm.org/noble/ llvm-toolchain-noble-21 main" | tee /etc/apt/sources.list.d/llvm.list && \
  echo "deb-src http://apt.llvm.org/noble/ llvm-toolchain-noble-21 main" | tee -a /etc/apt/sources.list.d/llvm.list && \
  apt-get update && \
  apt-get install -y \
    libllvm21 \
    llvm-21 \
    llvm-21-dev \
    llvm-21-runtime \
    clang-21 \
    clang-tools-21 \
    libclang-21-dev \
    libclang1-21 \
    clang-format-21 \
    clangd-21 \
    libfuzzer-21-dev \
    lldb-21 \
    lld-21 \
    libc++-21-dev \
    libc++abi-21-dev && \
  update-alternatives --install /usr/bin/clang clang /usr/bin/clang-21 10 && \
  update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-21 10 && \
  update-alternatives --install /usr/bin/ld ld /usr/bin/ld.lld-21 10 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Install build tools and libraries
RUN \
  apt-get update && \
  apt-get install -y \
    build-essential \
    software-properties-common \
    curl \
    git \
    unzip \
    make \
    ninja-build \
    cmake \
    golang-go \
    python3 \
    python-is-python3 \
    libssl-dev \
    mesa-common-dev \
    libglu1-mesa-dev \
    freeglut3-dev \
    libopenal1 \
    libopenal-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Install CMake 4.2.3
RUN \
  mkdir cmakebuild && cd cmakebuild && \
  wget https://github.com/Kitware/CMake/releases/download/v4.2.3/cmake-4.2.3.tar.gz && \
  tar -xf cmake-4.2.3.tar.gz && \
  cd cmake-4.2.3 && \
  export CC=clang && export CXX=clang++ && \
  ./bootstrap --parallel=10 --prefix=/usr/local && \
  make -j2 && \
  make install && \
  cd ../.. && \
  rm -R cmakebuild

WORKDIR /home
CMD ["bash"]
