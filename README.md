# gamedev-docker

A collection of docker containers which are mainly used by CI in [Pomdog Game Engine](https://github.com/mogemimi/pomdog).

## Build images locally

```sh
# build and run archlinux image
docker build -t yourname/gamedev-archlinux path/to/gamedev-docker/archlinux
docker run -it yourname/gamedev-archlinux

# build and run emscripten image
docker build -t yourname/gamedev-emscripten path/to/gamedev-docker/emscripten
docker run -it yourname/gamedev-emscripten

# build and run ubuntu image
docker build -t yourname/gamedev-ubuntu path/to/gamedev-docker/ubuntu
docker run -it yourname/gamedev-ubuntu
```
