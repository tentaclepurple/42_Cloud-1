FROM debian:bullseye


RUN apt update -y

RUN apt install vsftpd -y


COPY ./conf/script.sh /

RUN chmod 777 ./script.sh

CMD ["/script.sh"]