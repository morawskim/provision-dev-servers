FROM php:7.3-apache
# Install system packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get -y install \
            supervisor \
            curl \
            tar \
            libicu-dev \
        --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN docker-php-ext-install pdo pdo_mysql mysqli intl pcntl

RUN curl -o /tmp/ttrss.tar.gz -L https://git.tt-rss.org/git/tt-rss/archive/master.tar.gz && tar xf /tmp/ttrss.tar.gz -C /var/www/html --strip-components=1 && rm /tmp/ttrss.tar.gz && chown -R www-data:www-data /var/www/html

