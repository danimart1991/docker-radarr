[<img src="images/logo.png" alt="logo">](https://github.com/Radarr/Radarr)

[![GitHub Source](https://img.shields.io/badge/github-source-ffb64c?style=flat-square&logo=github&logoColor=white&labelColor=757575)](https://github.com/danimart1991/docker-radarr)
[![GitHub Registry](https://img.shields.io/badge/github-registry-ffb64c?style=flat-square&logo=github&logoColor=white&labelColor=757575)](https://github.com/users/danimart1991/packages/container/package/radarr)
[![Docker Pulls](https://img.shields.io/docker/pulls/danimart1991/radarr?color=ffb64c&style=flat-square&label=pulls&logo=docker&logoColor=white&labelColor=757575)](https://hub.docker.com/r/danimart1991/radarr)
[![Upstream](https://img.shields.io/badge/upstream-project-ffb64c?style=flat-square&labelColor=757575)](https://github.com/danimart1991/radarr)
[![Website](https://img.shields.io/badge/website-danielmartingonzalez.com-ffb64c?style=flat-square&labelColor=757575)](https://www.danielmartingonzalez.com)

## Starting the container

Just the basics to get the container running:

```shell hl_lines="4 5 6 7 8 9"
docker run --rm \
    --name radarr \
    -p 7878:7878 \
    -e PUID=1000 \
    -e PGID=1000 \
    -e UMASK=002 \
    -e TZ="Etc/UTC" \
    -e ARGS="" \
    -e DEBUG="no" \
    -v /<host_folder_config>:/config \
    hotio/radarr
```

In most cases you'll need to add an additional volume (`-v`) or more, depending on your own personal preference, to get access to additional files.

## Tags

| Tag                | Upstream                | Version | Build |
| -------------------|-------------------------|---------|-------|
| `nightly`          | nightly                 | ![version](https://img.shields.io/github/v/release/danimart1991/Radarr?color=f5f5f5&include_prereleases&label=%20&style=flat-square) | ![build](https://img.shields.io/github/workflow/status/danimart1991/docker-radarr/build/nightly?style=flat-square&label=) |

You can also find tags that reference a commit or version number.

## Configuration location

Your radarr configuration inside the container is stored in `/config/app`, to migrate from another container, you'd probably have to move your files from `/config` to `/config/app`.

## Executing your own scripts

If you have a need to do additional stuff when the container starts or stops, you can mount your script with `-v /docker/host/my-script.sh:/etc/cont-init.d/99-my-script` to execute your script on container start or `-v /docker/host/my-script.sh:/etc/cont-finish.d/99-my-script` to execute it when the container stops. An example script can be seen below.

```shell
#!/usr/bin/with-contenv bash

echo "Hello, this is me, your script."
```

## Troubleshooting a problem

By default all output is redirected to `/dev/null`, so you won't see anything from the application when using `docker logs`. Most applications write everything to a log file too. If you do want to see this output with `docker logs`, you can use `-e DEBUG="yes"` to enable this.
