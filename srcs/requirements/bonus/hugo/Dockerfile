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