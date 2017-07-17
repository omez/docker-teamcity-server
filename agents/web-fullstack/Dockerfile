FROM jetbrains/teamcity-agent
MAINTAINER Alexander Sergeychik <alexander.sergeychik@gmail.com>

RUN apt-get update && \
	apt-get install -y wget unzip git software-properties-common \
	&& rm -rf /var/lib/apt/lists/*

# Ansible installation
RUN apt-add-repository ppa:ansible/ansible && apt-get update && apt-get install -y ansible

# NodeJS installation
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# Install useful NodeJS packages
RUN npm install -g gulp grunt-cli bower typings

# Install PHP cli
RUN apt-get install -y php7.0-cli

# Install additional utilities
RUN apt-get install -y imagemagick optipng

RUN rm -rf /var/lib/apt/lists/*