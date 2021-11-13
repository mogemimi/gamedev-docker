FROM ubuntu:21.04
LABEL maintainer "https://github.com/mogemimi"

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

# Install prerequisites
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget gnupg

# Install LLVM and Clang 13
RUN \
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
  echo "deb http://apt.llvm.org/hirsute/ llvm-toolchain-hirsute-13 main" | tee /etc/apt/sources.list.d/llvm.list && \
  echo "deb-src http://apt.llvm.org/hirsute/ llvm-toolchain-hirsute-13 main" | tee -a /etc/apt/sources.list.d/llvm.list && \
  apt-get update && \
  apt-get install -y \
    libllvm13 \
    llvm-13 \
    llvm-13-dev \
    llvm-13-runtime \
    clang-13 \
    clang-tools-13 \
    libclang-13-dev \
    libclang1-13 \
    clang-format-13 \
    clangd-13 \
    libfuzzer-13-dev \
    lldb-13 \
    lld-13 \
    libc++-13-dev \
    libc++abi-13-dev && \
  update-alternatives --install /usr/bin/clang clang /usr/bin/clang-13 10 && \
  update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-13 10 && \
  update-alternatives --install /usr/bin/ld ld /usr/bin/ld.lld-13 10 && \
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

# Install CMake 3.21.4
RUN \
  mkdir cmakebuild && cd cmakebuild && \
  wget https://github.com/Kitware/CMake/releases/download/v3.21.4/cmake-3.21.4.tar.gz && \
  tar -xf cmake-3.21.4.tar.gz && \
  cd cmake-3.21.4 && \
  ./bootstrap --parallel=10 --prefix=/usr/local && \
  make -j2 && \
  make install && \
  cd ../.. && \
  rm -R cmakebuild

WORKDIR /root
CMD ["bash"]
