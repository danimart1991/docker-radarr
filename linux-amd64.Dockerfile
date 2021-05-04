FROM hotio/base@sha256:70a114ff6ebb2b2d0ab70a0ec91fe2d38d72adea1b60ede8477938a6bcac65fb

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

ARG BRANCH
ARG VERSION
ARG PACKAGE_VERSION=${VERSION}
RUN mkdir "${APP_DIR}/bin" && \
    curl -fsSL "https://github.com/danimart1991/Radarr/releases/download/${BRANCH}.${VERSION}/Radarr.${BRANCH}.${VERSION}.linux-core-x64.tar.gz" | tar xzf - -C "${APP_DIR}/bin" --strip-components=1 && \
    rm -rf "${APP_DIR}/bin/Radarr.Update" && \
    echo "PackageVersion=${PACKAGE_VERSION}\nPackageAuthor=[danimart1991](https://github.com/danimart1991)\nUpdateMethod=Docker\nBranch=${BRANCH}" > "${APP_DIR}/package_info" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /