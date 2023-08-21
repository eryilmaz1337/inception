FROM    alpine:3.17.4

WORKDIR /var/hugo/static

RUN     apk update && apk upgrade && apk add --update --no-cache \
            hugo \
            git \
 &&     rm -f /var/cache/apk/*
# create new hugo site
RUN hugo new site /var/hugo/static \
 	&&     cd /var/hugo/static \
 	&&     git clone https://github.com/LordMathis/hugo-theme-nightfall themes/nightfall \
 	&&     hugo new posts/docker.md \
 	&&     hugo -b https://eryilmaz.42.fr/static \
	&& mkdir -p /var/hugo/info/content/posts

COPY    ./conf/config.toml        /var/hugo/static/config.toml
COPY    conf/docker.md    /var/hugo/static/content/posts/docker.md
COPY    conf/about.md           /var/hugo/static/content/about/index.md
COPY    conf/1.png         /var/hugo/static/themes/nightfall/static/1.png
COPY    conf/2.png         /var/hugo/static/themes/nightfall/static/2.png

EXPOSE 1313

CMD     ["hugo", "server", \
         "--bind=0.0.0.0", \
         "--baseURL=https://eryilmaz.42.fr/static", \
         "-p", "1313", \
         "--logFile=/dev/stdout", \
        "--appendPort=false"]

# Bu Docker dosyası, Hugo adlı statik site oluşturma aracını kullanarak bir statik web sitesi oluşturmayı ve bu sitesi özel bir temayla sunmayı amaçlar. İşte bu dosyanın her bir bölümünün ne işe yaradığına dair açıklamalar:
#
# Dockerfile
# Copy code
# FROM alpine:3.15
# Bu satır, Alpine Linux tabanlı bir Docker görüntüsü oluşturulacağını belirtir. Görüntünün temel altyapısını Alpine Linux 3.15 versiyonu oluşturur.
#
# Dockerfile
# Copy code
# WORKDIR /var/hugo/static
# Bu komut, çalışma dizininin /var/hugo/static olarak ayarlanmasını sağlar. Tüm komutlar bu dizinde çalıştırılacaktır.
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
# RUN hugo new site /var/hugo/static \
    # && cd /var/hugo/static \
    # && git clone https://github.com/LordMathis/hugo-theme-nightfall themes/nightfall \
    # && hugo new posts/docker.md \
    # && hugo -b https://eryilmaz.42.fr/static \
    # && mkdir -p /var/hugo/info/content/posts
# Bu komutlar, yeni bir Hugo sitesi oluşturur, "nightfall" temasını indirir, birkaç örnek içerik sayfası ve yazı oluşturur, ardından Hugo ile siteyi oluşturur.
#
# Dockerfile
# Copy code
# COPY ./conf/config.toml /var/hugo/static/config.toml
# COPY conf/docker.md /var/hugo/static/content/posts/docker.md
# COPY conf/about.md /var/hugo/static/content/about/index.md
# COPY conf/1.png /var/hugo/static/themes/nightfall/static/1.png
# COPY conf/2.png /var/hugo/static/themes/nightfall/static/2.png
# Bu komutlar, yerel dizindeki dosyaları Docker görüntüsünün ilgili dizinlerine kopyalar. Bu dosyalar, sitenin yapılandırma dosyası, içerik dosyaları, resimler gibi unsurları içerir.
#
# Dockerfile
# Copy code
# EXPOSE 1313
# Bu satır, Docker konteynerinin 1313 numaralı portu dışarıya açılmasını belirtir. Bu port, Hugo önizleme sunucusu tarafından kullanılır.
#
# Dockerfile
# Copy code
# CMD ["hugo", "server", \
    #  "--bind=0.0.0.0", \
    #  "--baseURL=https://eryilmaz.42.fr/static", \
    #  "-p", "1313", \
    #  "--logFile=/dev/stdout", \
    # "--appendPort=false"]
# Bu komut, Docker konteyneri başlatıldığında otomatik olarak çalıştırılacak komutu belirtir. Bu komut, Hugo önizleme sunucusunu başlatır ve belirtilen ayarları kullanır. Bu önizleme sunucusu, statik web sayfasını görüntülemek için kullanılır.
