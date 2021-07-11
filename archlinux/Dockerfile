FROM archlinux:latest
LABEL maintainer "https://github.com/mogemimi"

# Install build tools and libraries
RUN \
  pacman -Sy --noconfirm archlinux-keyring && \
  pacman -Su --noconfirm && \
  pacman-key --init && \
  pacman-key --populate archlinux && \
  pacman -Syu --noconfirm && \
  pacman-db-upgrade && \
  pacman -S --noconfirm \
    base-devel \
    clang \
    clang-tools-extra \
    cmake \
    curl \
    gcc \
    git \
    glu \
    go \
    llvm \
    make \
    mesa \
    ninja \
    openal \
    openssl \
    tar \
    vim \
    wget \
    zip && \
  pacman -Scc

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

WORKDIR /home
CMD ["bash"]
