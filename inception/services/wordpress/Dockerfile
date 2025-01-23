FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    php7.4-json \
    php7.4-gd \
    php7.4-xml \
    php7.4-mbstring \
    curl \
	mariadb-client \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php
# Download and configure WordPress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY www.conf /etc/php/7.4/fpm/pool.d/
COPY wp-config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp-config.sh

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/usr/local/bin/wp-config.sh"]
