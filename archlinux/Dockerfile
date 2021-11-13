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

WORKDIR /home
CMD ["bash"]
