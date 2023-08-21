FROM    alpine:3.17.4

WORKDIR /var/hugo/info

RUN     apk update && apk upgrade && apk add --update --no-cache \
            hugo \
            git \
            && rm -f /var/cache/apk/*
# create new hugo site
RUN hugo new site /var/hugo/info \
 	&&     cd /var/hugo/info \
 	&&     git clone https://github.com/LordMathis/hugo-theme-nightfall themes/nightfall \
 	&&     hugo -b https://eryilmaz.42.fr/info

COPY    ./conf/config.toml        /var/hugo/info/config.toml

EXPOSE 1313

CMD     ["hugo", "server", \
         "--bind=0.0.0.0", \
         "--baseURL=https://eryilmaz.42.fr/info", \
         "-p", "1313", \
         "--logFile=/dev/stdout", \
        "--appendPort=false"]
