FROM hotio/base@sha256:a2b09ee9b2eeca23791f20cc92c49e29a5d4710714c9f286bcce2932711dab52

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7878

# install packages
RUN apt update && \
    apt install -y --no-install-recommends --no-install-suggests \
        libmediainfo0v5 libicu66 && \
# clean up
    apt autoremove -y && \
    apt clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ARG VERSION
ARG PACKAGE_VERSION=${VERSION}
RUN mkdir "${APP_DIR}/bin" && \
    curl -fsSL "https://github.com/danimart1991/Radarr/releases/download/${VERSION}/Radarr.${VERSION}.linux-core-arm.tar.gz" | tar xzf - -C "${APP_DIR}/bin" --strip-components=1 && \
    rm -rf "${APP_DIR}/bin/Radarr.Update" && \
    echo "PackageVersion=${PACKAGE_VERSION}\nPackageAuthor=[danimart1991](https://github.com/danimart1991)\nUpdateMethod=Docker\nBranch=nightly" > "${APP_DIR}/package_info" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
