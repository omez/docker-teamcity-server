FROM jetbrains/teamcity-agent
MAINTAINER Alexander Sergeychik <alexander.sergeychik@gmail.com>


ENV     PHP_VERSION                 7.1
ENV     COMPOSER_ALLOW_SUPERUSER    1


RUN apt-get update && apt-get install -y wget unzip git curl software-properties-common

# Ansible installation
RUN apt-add-repository ppa:ansible/ansible && apt-get update && apt-get install -y ansible

# NodeJS installation
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# Install useful NodeJS packages
RUN npm install -g gulp grunt-cli yarn gulp typings

# Install PHP cli
RUN LC_ALL=C.UTF-8 apt-add-repository ppa:ondrej/php && apt-get update

RUN apt-get install -y php${PHP_VERSION}-cli \
        php${PHP_VERSION}-gd \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-pdo \
        php${PHP_VERSION}-opcache \
        php${PHP_VERSION}-calendar \
        php${PHP_VERSION}-intl \
        php${PHP_VERSION}-mcrypt \
        php${PHP_VERSION}-xml \
        php${PHP_VERSION}-mbstring


# Install additional utilities
RUN apt-get install -y imagemagick optipng

RUN rm -rf /var/lib/apt/lists/*