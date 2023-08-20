FROM debian:buster

RUN apt-get update && apt-get -y install \
	wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

WORKDIR /var/www/html/

EXPOSE 9000

RUN mkdir /run/php

COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]


CMD ["/usr/sbin/php-fpm7.3", "-F"]




# Bu Docker dosyası, bir Debian Buster tabanlı Docker görüntüsü oluşturmak için kullanılır. İşte dosyanın her bir parçasının ne işe yaradığına dair ayrıntılı açıklamalar:
# 
# Dockerfile
# Copy code
# FROM debian:buster
# Bu satır, Docker görüntüsünün temel alınacak taban görüntüsünü belirtir. Bu durumda, debian:buster taban alınmıştır.
# 
# Dockerfile
# Copy code
# RUN apt-get update && apt-get -y install \
    # wget \
    # curl \
    # bash \
    # php \
    # php-cgi \
    # php-mysql \
    # php-fpm \
    # php-pdo \
    # php-gd php-cli \
    # php-mbstring \
    # redis \
    # php-redis \
    # && rm -rf /var/lib/apt/lists/*
# Bu komut bloğu, Docker görüntüsünün içine belirtilen paketleri kurmak için kullanılır. apt-get update ile paket listesi güncellenir, ardından apt-get -y install ile belirtilen paketler kurulur. rm -rf /var/lib/apt/lists/* komutu ile kurulum sırasında kullanılan geçici veriler temizlenir.
# 
# Dockerfile
# Copy code
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#   && chmod +x wp-cli.phar \
#   && mv wp-cli.phar /usr/local/bin/wp
# Bu blok, WP-CLI adlı WordPress komut satırı aracını görüntüye ekler. curl komutu ile WP-CLI'nin son sürümü indirilir, chmod +x ile çalıştırılabilir hale getirilir ve ardından /usr/local/bin/wp yoluna taşınır.
# 
# Dockerfile
# Copy code
# COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
# Bu satır, yerel dizindeki www.conf dosyasını Docker görüntüsünün /etc/php/7.3/fpm/pool.d/ yoluna kopyalar. Bu ayar dosyası, PHP-FPM havuzunu yapılandırmak için kullanılır.
# 
# Dockerfile
# Copy code
# WORKDIR /var/www/html/
# Bu satır, çalışma dizinini /var/www/html/ olarak belirler. Docker konteyneri içinde çalışırken, komutlar bu dizinde çalışacaktır.
# 
# Dockerfile
# Copy code
# EXPOSE 9000
# Bu komut, Docker konteynerinin 9000 numaralı portu dışa açılmasını belirtir. Bu port, PHP-FPM'nin dinlediği porttur.
# 
# Dockerfile
# Copy code
# RUN mkdir /run/php
# Bu komut, /run/php adında bir dizin oluşturur. Bu dizin, PHP-FPM'nin çalışırken kullanacağı bir dizindir.
# 
# Dockerfile
# Copy code
# COPY ./tools/create_wordpress.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/create_wordpress.sh
# Bu satırlar, yerel dizindeki create_wordpress.sh betiğini Docker görüntüsünün /usr/local/bin/ yoluna kopyalar ve çalıştırılabilir yapar.
# 
# Dockerfile
# Copy code
# ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]
# Bu komut, Docker konteyneri başlatıldığında otomatik olarak create_wordpress.sh betiğini çalıştırmasını belirtir.
# 
# Dockerfile
# Copy code
# CMD ["/usr/sbin/php-fpm7.3", "-F"]
# Bu komut, Docker konteyneri başlatıldığında varsayılan olarak çalıştırılacak komutu belirtir. Bu durumda, PHP-FPM'yi başlatır.