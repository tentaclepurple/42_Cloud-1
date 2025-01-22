FROM debian:bullseye

RUN		apt-get update
RUN		apt-get install -y redis \
		&& rm -rf /var/lib/apt/lists/*
RUN 	chmod +x /var/lib/redis
RUN 	chmod +x /tmp

COPY ./tools/redis.sh /tmp/redis.sh

RUN chmod 777 /tmp/redis.sh

EXPOSE 6379

CMD ["sh", "/tmp/redis.sh"]