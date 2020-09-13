# syntax=docker/dockerfile:1.0.0-experimental

FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

# C++
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    cmake \
    clang \
    libssl-dev

# neovim
RUN apt-get update -y \
    && apt-get install -y \
    software-properties-common \
    && apt-add-repository -y \
    ppa:neovim-ppa/stable \
    && apt-get update -y \
    && apt-get install -y \
    neovim \
    python-dev \
    python-pip \
    python3-dev \
    python3-pip
RUN pip install neovim
RUN pip3 install neovim 

# oh-my-zsh
ENV HOME /root
RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install \
    git \
    wget \
    zsh
SHELL ["/bin/zsh", "-c"]
RUN wget http://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
CMD ["zsh"]
