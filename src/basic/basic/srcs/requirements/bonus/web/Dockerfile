

FROM debian:bullseye

    RUN apt update && apt upgrade -y && apt install -y \
    nginx \
    && rm -rf /var/lib/apt/lists/*


#COPY ./conf/index.html /usr/share/nginx/html
COPY ./conf/index.html /var/www/html

#EXPOSE 7070

CMD ["nginx", "-g", "daemon off;"]

