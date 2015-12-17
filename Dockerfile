FROM ytnobody/base
MAINTAINER tescom <tescom@atdt01410.com>

RUN apt-get update &&             \
    apt-get install -y python-dev \
                       python-pip \
                       openssl && \
    apt-get clean &&              \
    pip install twisted           \

ENV MAIL_NAME mydomain.com
ENV MAIL_PATH /var/mail
ENV MAIL_USER admin
ENV MAIL_PASS admin
ENV MAIL_OPTS=

VOLUME /var/mail
EXPOSE 25 110

CMD twistd -n mail --smtp=tcp:25                            \
                   --pop3=tcp:110                           \
                   --maildirdbmdomain=$MAIL_NAME=$MAIL_PATH \
                   --user=$MAIL_USER=$MAIL_PASS             \
                   --bounce-to-postmaster                   \
                   $MAIL_OPTS
