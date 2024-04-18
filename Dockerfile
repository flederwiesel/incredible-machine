# syntax=docker/dockerfile:1

FROM ubuntu:jammy AS yocto-base

LABEL maintainer="flederwiesel@fra-flugplan.de"

# hadolint ignore=DL3008
RUN <<_RUN
	apt-get update
	DEBIAN_FRONTEND=noninteractive apt-get upgrade --yes
	DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
		build-essential \
		chrpath \
		cpio \
		debianutils \
		diffstat \
		file \
		gawk \
		gcc \
		git \
		iputils-ping \
		libacl1 \
		libegl1-mesa \
		liblz4-tool \
		libsdl1.2-dev \
		locales \
		mesa-common-dev \
		python3 \
		python3-git \
		python3-jinja2 \
		python3-pexpect \
		python3-pip \
		python3-subunit \
		socat \
		texinfo \
		unzip \
		wget \
		xz-utils \
		zstd

	rm -rf /var/lib/apt/lists/*
_RUN

RUN locale-gen en_US.UTF-8 de_DE.UTF-8

ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE.UTF-8
ENV LC_MESSAGES en_US.UTF-8

FROM yocto-base

# hadolint ignore=DL3008
RUN <<_RUN
	apt-get update
	DEBIAN_FRONTEND=noninteractive apt-get upgrade --yes
	DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
		colordiff \
		curl \
		nano \
		net-tools \
		nfs-common \
		rsync

	rm -rf /var/lib/apt/lists/*
_RUN
