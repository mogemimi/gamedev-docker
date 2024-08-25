FROM ubuntu:24.04
LABEL maintainer="https://github.com/mogemimi"

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

# Install prerequisites
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget gnupg

# Install LLVM and Clang 18
RUN \
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
  echo "deb http://apt.llvm.org/noble/ llvm-toolchain-noble-18 main" | tee /etc/apt/sources.list.d/llvm.list && \
  echo "deb-src http://apt.llvm.org/noble/ llvm-toolchain-noble-18 main" | tee -a /etc/apt/sources.list.d/llvm.list && \
  apt-get update && \
  apt-get install -y \
    libllvm18 \
    llvm-18 \
    llvm-18-dev \
    llvm-18-runtime \
    clang-18 \
    clang-tools-18 \
    libclang-18-dev \
    libclang1-18 \
    clang-format-18 \
    clangd-18 \
    libfuzzer-18-dev \
    lldb-18 \
    lld-18 \
    libc++-18-dev \
    libc++abi-18-dev && \
  update-alternatives --install /usr/bin/clang clang /usr/bin/clang-18 10 && \
  update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-18 10 && \
  update-alternatives --install /usr/bin/ld ld /usr/bin/ld.lld-18 10 && \
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
    htop \
    unzip \
    make \
    ninja-build \
    cmake \
    golang-go \
    libssl-dev \
    mesa-common-dev \
    libglu1-mesa-dev \
    freeglut3-dev \
    libopenal1 \
    libopenal-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Install CMake 3.30.2
RUN \
  mkdir cmakebuild && cd cmakebuild && \
  wget https://github.com/Kitware/CMake/releases/download/v3.30.2/cmake-3.30.2.tar.gz && \
  tar -xf cmake-3.30.2.tar.gz && \
  cd cmake-3.30.2 && \
  export CC=clang && export CXX=clang++ && \
  ./bootstrap --parallel=10 --prefix=/usr/local && \
  make -j2 && \
  make install && \
  cd ../.. && \
  rm -R cmakebuild

WORKDIR /root
CMD ["bash"]
