#FROM adminer:latest

FROM debian:bullseye


RUN apt -y update 

COPY ./tools/script.sh /

RUN apt install wget -y && apt install php php-mysql  -y

RUN chmod 777 script.sh

CMD ["/script.sh"]

# FROM alpine:3.18 as ADMINER

# RUN apk update && apk upgrade && apk add --no-cache  \
#     php \
#     php-session \
#     php-mysqli \
#     wget \
#     && rm -f /var/cache/apk/*

# RUN mkdir -p /var/www/html

# RUN wget "https://www.adminer.org/latest.php" -O /var/www/html/index.php

# ENTRYPOINT ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]