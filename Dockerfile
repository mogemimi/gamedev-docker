FROM ubuntu:15.10
MAINTAINER <https://github.com/mogemimi>

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip wget && \
  apt-get install -y make cmake python2.7 && \
  apt-get install -y clang-3.7 libc++-dev && \
  apt-get install -y mesa-common-dev libglu1-mesa-dev freeglut3-dev && \
  apt-get install -y libopenal1 libopenal-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /root
CMD ["bash"]
