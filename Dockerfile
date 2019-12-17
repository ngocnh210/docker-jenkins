FROM jenkins/jenkins:alpine

LABEL maintainer="Ngọc Nguyễn <me@ngocnh.info>"

EXPOSE 50000 8080

WORKDIR /var/jenkins_home

USER root

RUN apk update \
    && apk --update add \
    php \
    php-common \
    php-intl \
    php-mbstring \
    php-curl \
    php-openssl \
    php-json \
    php-phar \
    nodejs \
    npm \
    wget \
    git \
    nano

RUN npm i -g yarn

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --filename=composer --install-dir=/usr/local/bin \
    && php -r "unlink('composer-setup.php');"

ENTRYPOINT ["/usr/local/bin/jenkins.sh"]