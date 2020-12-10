FROM debian:10.6

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      make \
      libssl-dev \
      libghc-zlib-dev \
      libcurl4-gnutls-dev \
      libexpat1-dev \
      gettext \
      unzip \
      curl \
      ca-certificates \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./git.mk /tmp/git.mk
RUN make -C /tmp -f git.mk build install clean

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      python \
      unzip \
      man \
      man-db \
      gcc-doc \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
