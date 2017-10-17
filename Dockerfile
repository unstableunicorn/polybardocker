FROM ubuntu:xenial

LABEL maintainer="Elric Hindy"
LABEL maintainer_email="elric.hindy@seeingmachines.com"
LABEL build_date="2017 Oct"

# install requirements
RUN apt update && apt upgrade -y \
 && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends software-properties-common \
 && add-apt-repository -y -u ppa:aguignard/ppa  \
 && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
 cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev \
 libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev \
 pkg-config python-xcbgen xcb-proto libxcb-xrm-dev libasound2-dev \
 libmpdclient-dev libiw-dev libcurl4-openssl-dev build-essential

RUN /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb /tmp/keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f \
  && dpkg -i /tmp/keyring.deb \
  && echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list \
  && apt update && apt install -y i3

VOLUME ["/build", "/source"]

ENTRYPOINT ["/bin/bash"]
