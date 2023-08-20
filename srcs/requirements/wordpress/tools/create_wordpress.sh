#!/bin/sh

if [ -f ./wp-config.php ]
then
	echo "Wordpress already downloaded"
else

	rm -rf wp-admin wp-content wp-includes

######## MANDATORY ########
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL};
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};

######## BONUS ########
## Redis Çerez Ayarları ##
	wp config set WP_REDIS_HOST redis --allow-root
  	wp config set WP_REDIS_PORT 6379 --raw --allow-root
 	wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
 	wp config set WP_REDIS_CLIENT phpredis --allow-root
	wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
	wp redis enable --allow-root
fi

exec "$@"




#Tabii, aşağıda betiğin her bir satırını detaylı olarak açıklıyorum:
#
#
#
##!/bin/sh
#Bu satır, betiğin "Shell" betiği olduğunu belirtir. Betiğin başlamasıyla birlikte bu yorum satırı çalıştırılmaz, sadece betiğin türünü tanımlar.
#
#
#
#if [ -f ./wp-config.php ]
#then
#    echo "Wordpress already downloaded"
#else
#Bu satır, wp-config.php adında bir dosyanın mevcut olup olmadığını kontrol eder. Eğer dosya varsa, zaten WordPress indirilmiş demektir ve bir sonraki adıma geçilmez. Eğer dosya yoksa, WordPress henüz indirilmemiş demektir ve indirme işlemine geçilir.
#
#
#
#    rm -rf wp-admin wp-content wp-includes
#Bu satır, wp-admin, wp-content ve wp-includes dizinlerini siler. Bunu yaparak önceki bir WordPress kurulumu varsa onu temizler.
#
#
#
#    wget http://wordpress.org/latest.tar.gz
#    tar xfz latest.tar.gz
#    mv wordpress/* .
#    rm -rf latest.tar.gz
#    rm -rf wordpress
#Bu adımlar, en son WordPress sürümünü indirir, açar ve mevcut dizine taşır. Ardından indirilen dosyalar ve dizin temizlenir.
#
#
#
#    sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
#    sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
#    sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
#    sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
#    cp wp-config-sample.php wp-config.php
#Bu satırlar, wp-config-sample.php dosyasındaki örnek ayarları MySQL veritabanı bilgileriyle değiştirir ve ardından dosyanın adını wp-config.php olarak değiştirir.
#
#
#
#    wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL};
#    wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
#Bu adımlar, WordPress çekirdek kurulumunu ve kullanıcı oluşturmayı wp-cli (WordPress Command Line Interface) aracılığıyla gerçekleştirir.
#
#
#
#    wp config set WP_REDIS_HOST redis --allow-root
#    wp config set WP_REDIS_PORT 6379 --raw --allow-root
#    wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
#    wp config set WP_REDIS_CLIENT phpredis --allow-root
#    wp plugin install redis-cache --activate --allow-root
#    wp plugin update --all --allow-root
#    wp redis enable --allow-root
#Bu satırlar, Redis önbellekleme ayarlarını ve eklentisini ayarlar.
#
#
#
#fi
#Bu ifadenin sonu, if koşulunun kapanışını belirtir.
#
#
#
#exec "$@"
#Bu ifade, komut satırından geçirilen tüm argümanları çalıştırmak için kullanılır. Bu, aslında Docker konteynerini başlatan komutu temsil eder.
#
#Bu betik, WordPress kurulumunu ve yapılandırmasını otomatikleştirmek amacıyla tasarlanmıştır. Her bir satır, belirli bir görevi yerine getirir ve toplamda tüm WordPress kurulumunu gerçekleştiren adımları içerir.