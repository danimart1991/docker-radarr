# ![Logo](./images/logo.png) Docker - Radarr

[![GitHub Source](https://img.shields.io/badge/github-source-ffb64c?style=flat-square&logo=github&logoColor=white&labelColor=757575)](https://github.com/danimart1991/docker-radarr)
[![GitHub Registry](https://img.shields.io/badge/github-registry-ffb64c?style=flat-square&logo=github&logoColor=white&labelColor=757575)](https://github.com/users/danimart1991/packages/container/package/radarr)
[![Docker Pulls](https://img.shields.io/docker/pulls/danimart1991/radarr?color=ffb64c&style=flat-square&label=pulls&logo=docker&logoColor=white&labelColor=757575)](https://hub.docker.com/r/danimart1991/radarr)
[![Upstream](https://img.shields.io/badge/upstream-project-ffb64c?style=flat-square&labelColor=757575)](https://github.com/danimart1991/radarr)
[![Website](https://img.shields.io/badge/website-danielmartingonzalez.com-ffb64c?style=flat-square&labelColor=757575)](https://www.danielmartingonzalez.com)

## Starting the container

In most cases you'll need to add additional volumes, depending on your own personal preference, to get access to your files.

### cli

```shell
$ docker run --rm \
    --name sonarr \
    -p 7878:7878 \
    -e PUID=1000 \
    -e PGID=1000 \
    -e UMASK=002 \
    -e TZ="Etc/UTC" \
    -v /<host_folder_config>:/config \
    danimart1991/radarr
```

### compose

```yaml
version: "3.7"

services:
  radarr:
    container_name: radarr
    image: danimart1991/radarr
    ports:
      - 7878:7878
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Etc/UTC
    volumes:
      - /<host_folder_config>:/config
```

## Tags

| Tag                | Upstream | Version | Build |
| -------------------|----------|---------|-------|
| `nightly (latest)` | develop  | ![version](https://img.shields.io/github/v/release/danimart1991/Radarr?color=f5f5f5&include_prereleases&label=%20&style=flat-square) | ![build](https://img.shields.io/github/workflow/status/danimart1991/docker-radarr/build/nightly?style=flat-square&label=) |
