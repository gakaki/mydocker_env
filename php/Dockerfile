FROM php:rc-fpm

# RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo 'deb http://mirrors.aliyun.com/debian/ buster main non-free contrib' > /etc/apt/sources.list \
    && echo 'deb http://mirrors.aliyun.com/debian-security buster/updates main' >> /etc/apt/sources.list \
    && echo 'deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib' >> /etc/apt/sources.list \
    && echo 'deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib' >> /etc/apt/sources.list 


RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
    && apt-get install -y --no-install-recommends curl git \
        libjpeg62-turbo-dev \
        libmagickwand-dev \
        libmcrypt-dev \
        libmemcached-dev \
        build-essential \
        ca-certificates \
        gettext-base \
        libgd-dev \
        libgeoip-dev \
        libncurses5-dev \
        libperl-dev \
        libreadline-dev \
        libxslt1-dev \
        make \
        perl \
        unzip \
        zlib1g-dev \
        git \
        autoconf \
        libtool \
        automake \
        libxml2-dev \
        libpng-dev \
        libz-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libxpm-dev \
        libx11-dev \
        libxt-dev \
        libfontconfig-dev \
        libvpx-dev \
        libtiff-dev \
    && rm -rf /var/lib/apt/lists/* 

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) bcmath calendar exif gettext sockets dba mysqli pcntl pdo_mysql shmop sysvmsg sysvsem sysvshm iconv gd 
RUN pecl install imagick-3.4.4 mcrypt-1.0.2 memcached-3.1.3 redis-5.0.2 xdebug-2.8.0beta2 \
    && docker-php-ext-enable imagick mcrypt memcached redis xdebug
RUN docker-php-ext-configure opcache --enable-opcache
RUN pecl install swoole-4.4.8 && docker-php-ext-enable swoole
RUN curl -s http://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
# RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

# 取消配置
# composer config -g --unset repos.packagist

LABEL Author="Stone"
LABEL Version="2019.8"
LABEL Description="PHP 7.4.8 开发环境镜像. "