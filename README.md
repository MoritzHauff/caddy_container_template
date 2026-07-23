# :lock: Caddy container template

Single docker-compose.yaml file for a [caddy container](https://hub.docker.com/_/caddy?tag=latest).

## Basic usage

In the [official caddy container](https://hub.docker.com/_/caddy?tag=latest) documentation you can find this basic usage example:

```sh
$ echo "hello world" > index.html
$ docker run -d -p 80:80 \
    -v $PWD/index.html:/usr/share/caddy/index.html \
    -v caddy_data:/data \
    caddy
...
$ curl http://localhost/
hello world
```

Adapted to take advantage of this repository you only need to run:

```sh
docker run -d -p 80:80 \
    -v $PWD/public/hello-world.html:/usr/share/caddy/index.html \
    -v caddy_data:/data \
    caddy
```

```sh
curl http://localhost/
```

