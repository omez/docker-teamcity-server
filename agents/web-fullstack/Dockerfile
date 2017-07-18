FROM jetbrains/teamcity-agent
MAINTAINER Alexander Sergeychik <alexander.sergeychik@gmail.com>


ENV     PHP_VERSION     7.0


RUN apt-get update && \
	apt-get install -y wget unzip git software-properties-common \
	&& rm -rf /var/lib/apt/lists/*

# Ansible installation
RUN apt-add-repository ppa:ansible/ansible && apt-get update && apt-get install -y ansible

# NodeJS installation
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# Install useful NodeJS packages
RUN npm install -g gulp grunt-cli yarn gulp typings

# Install PHP cli
RUN apt-get install -y php${PHP_VERSION}-cli \
        php${PHP_VERSION}-gd \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-pdo \
        php${PHP_VERSION}-opcache \
        php${PHP_VERSION}-calendar \
        php${PHP_VERSION}-intl \
        php${PHP_VERSION}-mcrypt


# Install additional utilities
RUN apt-get install -y imagemagick optipng

RUN rm -rf /var/lib/apt/lists/*