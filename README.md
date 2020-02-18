# [Nodebook - Docker in Docker](https://ms-jpq.github.io/nodebook-docker/)

Managed to put [Nodebook](https://github.com/netgusto/nodebook) inside a Docker image.

All credits go to the [original author - netgusto](https://github.com/netgusto/).

## To Use

```shell
docker run -it --rm \
   --privileged \
   -p 8080:80 \
   -v "$PWD"/docker:/var/lib/docker \
   -v "$PWD"/notebooks:/notebooks \
   msjpq/nodebook
```

## Misc

`--privileged` is required to Docker in Docker to work

`"$PWD"/docker:/var/lib/docker` allows for caching
