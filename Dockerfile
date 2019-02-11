FROM jetbrains/teamcity-agent:latest

MAINTAINER Orlando Adeyemi - Assignar Pty Ltd "orlando@assignar.com"

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install base dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y -q --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        git \
        libssl-dev \
        python \
        rsync \
        software-properties-common \
        devscripts \
        autoconf \
        ssl-cert \
    && apt-get clean

#Install Node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# Use latest npm
RUN npm i npm@latest -g

# confirm installation
RUN node -v
RUN npm -v

#Install YARN
RUN npm install yarn -g

RUN sudo apt-get install libstdc++-6-dev -y
