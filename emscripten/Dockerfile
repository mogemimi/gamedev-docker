# syntax=docker/dockerfile:1
FROM ubuntu:24.04
LABEL maintainer="https://github.com/mogemimi"

ARG DEBIAN_FRONTEND=noninteractive
ARG LLVM_VERSION=21
ARG CMAKE_VERSION=4.2.3

SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

# Install prerequisites
RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    gnupg \
    wget && \
  rm -rf /var/lib/apt/lists/*

# Install LLVM and Clang
RUN \
  mkdir -p /etc/apt/keyrings && \
  wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key \
    | gpg --dearmor -o /etc/apt/keyrings/llvm.gpg && \
  echo "deb [signed-by=/etc/apt/keyrings/llvm.gpg] http://apt.llvm.org/noble/ llvm-toolchain-noble-${LLVM_VERSION} main" \
    > /etc/apt/sources.list.d/llvm.list && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    clang-${LLVM_VERSION} \
    clang-format-${LLVM_VERSION} \
    clang-tools-${LLVM_VERSION} \
    lld-${LLVM_VERSION} \
    libc++-${LLVM_VERSION}-dev \
    libc++abi-${LLVM_VERSION}-dev && \
  update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${LLVM_VERSION} 10 && \
  update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-${LLVM_VERSION} 10 && \
  update-alternatives --install /usr/bin/ld ld /usr/bin/ld.lld-${LLVM_VERSION} 10 && \
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
    golang-go \
    make \
    ninja-build \
    python3 \
    python-is-python3 \
    unzip \
    libssl-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Install Emscripten SDK
RUN \
  git clone --depth 1 https://github.com/emscripten-core/emsdk.git /emsdk && \
  cd /emsdk && \
  ./emsdk install latest && \
  ./emsdk activate latest

ENV PATH="/emsdk:/emsdk/upstream/emscripten:${PATH}"
ENV EMSDK="/emsdk"

# NOTE: Since /emsdk/upstream/emscripten/cache is owned by root and cannot be
#       written by non-root users, EM_CACHE must be set if non-root users use emcc.
# ENV EM_CACHE="/path/to/<WORKDIR>/.emscripten_cache"

# Install CMake (pre-built binary)
RUN \
  wget -q "https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz" && \
  tar -xf "cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz" -C /usr/local --strip-components=1 && \
  rm "cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz"

WORKDIR /home
CMD ["bash"]
