FROM ubuntu:20.10
LABEL maintainer "https://github.com/mogemimi"

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

# Install prerequisites
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget gnupg

# Install LLVM and Clang 12
RUN \
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
  echo "deb http://apt.llvm.org/groovy/ llvm-toolchain-groovy-12 main" | tee /etc/apt/sources.list.d/llvm.list && \
  echo "deb-src http://apt.llvm.org/groovy/ llvm-toolchain-groovy-12 main" | tee -a /etc/apt/sources.list.d/llvm.list && \
  apt-get update && \
  apt-get install -y \
    libllvm12 \
    llvm-12 \
    llvm-12-dev \
    llvm-12-runtime \
    clang-12 \
    clang-tools-12 \
    libclang-12-dev \
    libclang1-12 \
    clang-format-12 \
    clangd-12 \
    libfuzzer-12-dev \
    lldb-12 \
    lld-12 \
    libc++-12-dev \
    libc++abi-12-dev && \
  update-alternatives --install /usr/bin/clang clang /usr/bin/clang-12 10 && \
  update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-12 10 && \
  update-alternatives --install /usr/bin/ld ld /usr/bin/ld.lld-12 10 && \
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

# Install CMake 3.20.5
RUN \
  mkdir cmakebuild && cd cmakebuild && \
  wget https://github.com/Kitware/CMake/releases/download/v3.20.5/cmake-3.20.5.tar.gz && \
  tar -xf cmake-3.20.5.tar.gz && \
  cd cmake-3.20.5 && \
  ./bootstrap --parallel=10 --prefix=/usr/local && \
  make -j10 && \
  make install && \
  cd ../.. && \
  rm -R cmakebuild

WORKDIR /root
CMD ["bash"]
