# polybardocker
A docker container for building polybar with i3wm support

# Instructions
NOTE: This has not been tested yet, only that it can build polybar!
Build the docker container as normal

    docker build -t polybar-build-env .

The docker container has a source directory and a build directory
Run by mounting the cloned polybar repository and a build directory(any build directory will do) but for completness:

    mkdir ~/build

i.e. if docker image is as above (polybar-build-env) and the cloned polybar repo is in ~/gitrepos/polybar and you have a build dir also in home:

    docker run -it --name polybar-build-env -v ~/gitrepos/polybar:/source -v ~/build:/build polybar-build-env
    mkdir /build/polybar
    cd /build/polybar
    cmake /source
    make

After it has built you can go to your ~/build/polybar and run make install and it should install polybar


# without docker (for the reddit thread)
## i3 already installed (or without i3 support)

The following was required for docker:

    sudo apt install -y software-properties-common 

Main commands:

    sudo add-apt-repository -y -u ppa:aguignard/ppa 
    sudo apt update && sudo apt install -y --no-install-recommends \
     cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev \
     libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev \
     pkg-config python-xcbgen xcb-proto libxcb-xrm-dev libasound2-dev \
     libmpdclient-dev libiw-dev libcurl4-openssl-dev build-essential

## Update to latest i3 (or if i3 not installed yet)
If you don't have i3 and would like it or want the latest with polybar support do:

    /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb /tmp/keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
    sudo dpkg -i /tmp/keyring.deb
    sudo echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list \
    sudo apt update && sudo apt install -y i3

drink beer

