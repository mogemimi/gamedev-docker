FROM ubuntu:23.04
LABEL maintainer "https://github.com/mogemimi"

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

# Install prerequisites
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget gnupg

# Install LLVM and Clang 16
RUN \
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
  echo "deb http://apt.llvm.org/lunar/ llvm-toolchain-lunar-16 main" | tee /etc/apt/sources.list.d/llvm.list && \
  echo "deb-src http://apt.llvm.org/lunar/ llvm-toolchain-lunar-16 main" | tee -a /etc/apt/sources.list.d/llvm.list && \
  apt-get update && \
  apt-get install -y \
    libllvm16 \
    llvm-16 \
    llvm-16-dev \
    llvm-16-runtime \
    clang-16 \
    clang-tools-16 \
    libclang-16-dev \
    libclang1-16 \
    clang-format-16 \
    clangd-16 \
    libfuzzer-16-dev \
    lldb-16 \
    lld-16 \
    libc++-16-dev \
    libc++abi-16-dev && \
  update-alternatives --install /usr/bin/clang clang /usr/bin/clang-16 10 && \
  update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-16 10 && \
  update-alternatives --install /usr/bin/ld ld /usr/bin/ld.lld-16 10 && \
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

# Install CMake 3.26.3
RUN \
  mkdir cmakebuild && cd cmakebuild && \
  wget https://github.com/Kitware/CMake/releases/download/v3.26.3/cmake-3.26.3.tar.gz && \
  tar -xf cmake-3.26.3.tar.gz && \
  cd cmake-3.26.3 && \
  export CC=clang && export CXX=clang++ && \
  ./bootstrap --parallel=10 --prefix=/usr/local && \
  make -j2 && \
  make install && \
  cd ../.. && \
  rm -R cmakebuild

WORKDIR /root
CMD ["bash"]
