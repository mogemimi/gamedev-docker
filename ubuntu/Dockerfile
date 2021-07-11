FROM ubuntu:21.04
LABEL maintainer "https://github.com/mogemimi"

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

# Install prerequisites
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget gnupg

# Install LLVM and Clang 11
RUN \
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
  echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-11 main" | tee /etc/apt/sources.list.d/llvm.list && \
  echo "deb-src http://apt.llvm.org/focal/ llvm-toolchain-focal-11 main" | tee -a /etc/apt/sources.list.d/llvm.list && \
  apt-get update && \
  apt-get install -y \
    libllvm11 \
    llvm-11 \
    llvm-11-dev \
    llvm-11-runtime \
    clang-11 \
    clang-tools-11 \
    libclang-11-dev \
    libclang1-11 \
    clang-format-11 \
    clangd-11 \
    libfuzzer-11-dev \
    lldb-11 \
    lld-11 \
    libc++-11-dev \
    libc++abi-11-dev && \
  update-alternatives --install /usr/bin/clang clang /usr/bin/clang-11 10 && \
  update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-11 10 && \
  update-alternatives --install /usr/bin/ld ld /usr/bin/ld.lld-11 10 && \
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

# Install CMake 3.18.3
RUN \
  mkdir cmakebuild && cd cmakebuild && \
  wget https://github.com/Kitware/CMake/releases/download/v3.18.3/cmake-3.18.3.tar.gz && \
  tar -xf cmake-3.18.3.tar.gz && \
  cd cmake-3.18.3 && \
  ./bootstrap --parallel=10 --prefix=/usr/local && \
  make -j10 && \
  make install && \
  cd ../.. && \
  rm -R cmakebuild

WORKDIR /root
CMD ["bash"]
