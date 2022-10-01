FROM ubuntu:22.04
LABEL maintainer "https://github.com/mogemimi"

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

# Install prerequisites
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget gnupg

# Install LLVM and Clang 15
RUN \
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
  echo "deb http://apt.llvm.org/hirsute/ llvm-toolchain-jammy-15 main" | tee /etc/apt/sources.list.d/llvm.list && \
  echo "deb-src http://apt.llvm.org/hirsute/ llvm-toolchain-jammy-15 main" | tee -a /etc/apt/sources.list.d/llvm.list && \
  apt-get update && \
  apt-get install -y \
    libllvm15 \
    llvm-15 \
    llvm-15-dev \
    llvm-15-runtime \
    clang-15 \
    clang-tools-15 \
    libclang-15-dev \
    libclang1-15 \
    clang-format-15 \
    clangd-15 \
    libfuzzer-15-dev \
    lldb-15 \
    lld-15 \
    libc++-15-dev \
    libc++abi-15-dev && \
  update-alternatives --install /usr/bin/clang clang /usr/bin/clang-15 10 && \
  update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-15 10 && \
  update-alternatives --install /usr/bin/ld ld /usr/bin/ld.lld-15 10 && \
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

# Install CMake 3.24.2
RUN \
  mkdir cmakebuild && cd cmakebuild && \
  wget https://github.com/Kitware/CMake/releases/download/v3.24.2/cmake-3.24.2.tar.gz && \
  tar -xf cmake-3.24.2.tar.gz && \
  cd cmake-3.24.2 && \
  ./bootstrap --parallel=10 --prefix=/usr/local && \
  make -j2 && \
  make install && \
  cd ../.. && \
  rm -R cmakebuild

WORKDIR /root
CMD ["bash"]
