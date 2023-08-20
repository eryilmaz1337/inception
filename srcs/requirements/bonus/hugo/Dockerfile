FROM    alpine:3.15

WORKDIR /var/hugo/info

RUN     apk update && apk upgrade && apk add --update --no-cache \
            hugo \
            git \
            shadow \
 &&     rm -f /var/cache/apk/*

RUN hugo new site /var/hugo/info \
 	&&     cd /var/hugo/info \
 	&&     git clone https://github.com/Yukuro/hugo-theme-shell.git themes/shell \
 	&&     hugo -b https://eryilmaz.42.fr/info

COPY    ./conf/hugo.conf        /var/hugo/info/hugo.conf

EXPOSE 1313

CMD     ["hugo", "server", \
         "--bind=0.0.0.0", \
         "--baseURL=https://eryilmaz.42.fr/info", \
         "-p", "1313", \
         "--logFile=/dev/stdout", \
        "--appendPort=false"]




# Bu Docker dosyası, Hugo adlı statik site oluşturma aracının kullanıldığı ve oluşturulan sitenin bir sunucu üzerinde çalıştırılmasını sağlamak amacıyla tasarlanmıştır. İşte bu dosyanın her bir bölümünün ne işe yaradığına dair açıklamalar:
# 
# Dockerfile
# Copy code
# FROM alpine:3.15
# Bu satır, Alpine Linux tabanlı bir Docker görüntüsü oluşturulacağını belirtir. Görüntünün temel altyapısını Alpine Linux 3.15 versiyonu oluşturur.
# 
# Dockerfile
# Copy code
# WORKDIR /var/hugo/info
# Bu komut, çalışma dizininin /var/hugo/info olarak ayarlanmasını sağlar. Tüm komutlar bu dizinde çalıştırılacaktır.
# 
# Dockerfile
# Copy code
# RUN apk update && apk upgrade && apk add --update --no-cache \
        # hugo \
        # git \
        # shadow \
#  &&     rm -f /var/cache/apk/*
# Bu komutlar, sistem güncellemesi yapar ve hugo, git, ve shadow paketlerini kurar. Ayrıca, kullanılmayan paketlerin cache'ini temizler.
# 
# Dockerfile
# Copy code
# RUN hugo new site /var/hugo/info \
    # && cd /var/hugo/info \
    # && git clone https://github.com/Yukuro/hugo-theme-shell.git themes/shell \
    # && hugo -b https://eryilmaz.42.fr/info
# Bu komutlar, /var/hugo/info dizininde yeni bir Hugo site oluşturur, Shell temasını indirir, ve Hugo ile siteyi oluşturur.
# 
# Dockerfile
# Copy code
# COPY ./conf/hugo.conf /var/hugo/info/hugo.conf
# Bu komut, yerel dizindeki hugo.conf dosyasını Docker görüntüsünün /var/hugo/info/ yoluna kopyalar. Bu dosya, Hugo yapılandırma ayarlarını içerir.
# 
# Dockerfile
# Copy code
# EXPOSE 1313
# Bu satır, Docker konteynerinin 1313 numaralı portu dışarıya açılmasını belirtir. Bu port, Hugo'nun önizleme sunucusu tarafından kullanılır.
# 
# Dockerfile
# Copy code
# CMD ["hugo", "server", \
    #  "--bind=0.0.0.0", \
    #  "--baseURL=https://eryilmaz.42.fr/info", \
    #  "-p", "1313", \
    #  "--logFile=/dev/stdout", \
    # "--appendPort=false"]
# Bu komut, Docker konteyneri başlatıldığında otomatik olarak çalıştırılacak komutu belirtir. Bu komut, Hugo önizleme sunucusunu başlatır ve belirtilen ayarları kullanır. Önizleme sunucusu, statik web sayfasını görüntülemek için kullanılır.
# 