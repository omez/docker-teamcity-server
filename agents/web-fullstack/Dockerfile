FROM jetbrains/teamcity-agent as base
MAINTAINER Alexander Sergeychik <alexander.sergeychik@gmail.com>

ENV     PHP_VERSION                 7.1
ENV     COMPOSER_ALLOW_SUPERUSER    1


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget unzip git curl software-properties-common

# Ansible installation
RUN apt-add-repository ppa:ansible/ansible && apt-get update && apt-get install -y ansible

# NodeJS installation
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# Install useful NodeJS packages
RUN npm install -g gulp grunt-cli yarn gulp typings

# Install PHP cli
RUN LC_ALL=C.UTF-8 apt-add-repository ppa:ondrej/php && apt-get update

## Install PHP
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php${PHP_VERSION}-cli \
    php${PHP_VERSION}-bcmath php${PHP_VERSION}-bz2 php${PHP_VERSION}-curl php${PHP_VERSION}-dba \
    php${PHP_VERSION}-dev php${PHP_VERSION}-enchant php${PHP_VERSION}-gd \
    php${PHP_VERSION}-geoip php${PHP_VERSION}-gmp php${PHP_VERSION}-igbinary php${PHP_VERSION}-imagick \
    php${PHP_VERSION}-imap php${PHP_VERSION}-interbase php${PHP_VERSION}-intl php${PHP_VERSION}-json \
    php${PHP_VERSION}-ldap php${PHP_VERSION}-mbstring php${PHP_VERSION}-mcrypt php${PHP_VERSION}-memcached \
    php${PHP_VERSION}-mongodb php${PHP_VERSION}-msgpack php${PHP_VERSION}-mysql php${PHP_VERSION}-odbc \
    php${PHP_VERSION}-opcache php${PHP_VERSION}-pgsql php${PHP_VERSION}-phpdbg php${PHP_VERSION}-pspell \
    php${PHP_VERSION}-readline php${PHP_VERSION}-recode php${PHP_VERSION}-redis php${PHP_VERSION}-snmp \
    php${PHP_VERSION}-soap php${PHP_VERSION}-sqlite3 php${PHP_VERSION}-ssh2 php${PHP_VERSION}-sybase \
    php${PHP_VERSION}-tidy php${PHP_VERSION}-xdebug php${PHP_VERSION}-xml php${PHP_VERSION}-xmlrpc \
    php${PHP_VERSION}-xsl php${PHP_VERSION}-zip php${PHP_VERSION}-pdo


# Install additional utilities
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y imagemagick optipng


# Install Jelastic tools
RUN curl -s ftp://ftp.jelastic.com/pub/cli/jelastic-cli-installer.sh | bash
VOLUME /root/.config/jelastic

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x kubectl && mv ./kubectl /usr/local/bin/kubectl
VOLUME /root/.kube

## Clean caches
RUN rm -rf /var/lib/apt/lists/*