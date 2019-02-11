FROM jetbrains/teamcity-agent:latest

MAINTAINER Orlando Adeyemi - Assignar Pty Ltd "orlando@assignar.com"
# Install nvm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
# Install
RUN export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm" \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# required for node-git
RUN sudo add-apt-repository ppa:ubuntu-toolchain-r/test \
    sudo apt-get update \
    sudo apt-get install libstdc++-4.9-de \

# Install several versions of node
RUN nvm install 8
RUN nvm install 6
RUN nvm install 10
RUN nvm use 8
# Set default
RUN nvm alias default 8
#Install YARN
RUN npm install yarn -g
