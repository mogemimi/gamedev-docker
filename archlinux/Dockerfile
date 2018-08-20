FROM base/devel:latest
MAINTAINER <https://github.com/mogemimi>

RUN \
  pacman -Sy --noconfirm archlinux-keyring && pacman -Su --noconfirm && \
  pacman-key --init && pacman-key --populate archlinux && pacman-key --refresh-keys && \
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
    llvm \
    make \
    mesa \
    ninja \
    openal \
    tar \
    vim \
    wget \
    zip && \
  pacman -Scc

RUN \
  mkdir cmakebuild && cd cmakebuild && \
  wget https://cmake.org/files/v3.12/cmake-3.12.1.tar.gz && \
  tar -xf cmake-3.12.1.tar.gz && \
  cd cmake-3.12.1 && \
  ./bootstrap --parallel=10 --prefix=/usr/local && \
  make -j10 && \
  make install && \
  cd ../.. && \
  rm -R cmakebuild

WORKDIR /home
CMD ["bash"]
