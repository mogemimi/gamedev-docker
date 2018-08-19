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

WORKDIR /home
CMD ["bash"]
