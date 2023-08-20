FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
        vsftpd

COPY conf/vsftpd.conf /tmp/vsftpd.conf

COPY tools/server_ftp.sh /tmp/server_ftp.sh

ENTRYPOINT ["sh", "/tmp/server_ftp.sh"]




# Bu Docker dosyası, Alpine Linux tabanlı bir Docker görüntüsü oluşturmak için kullanılır ve içerisinde VSFTPD (Very Secure FTP Daemon) adlı FTP sunucusunu kurmayı ve çalıştırmayı otomatikleştirmek amacıyla tasarlanmıştır. İşte betiğin her bir bölümünün ne işe yaradığına dair açıklamalar:
# 
# Dockerfile
# Copy code
# FROM alpine:3.13
# Bu satır, Alpine Linux tabanlı bir Docker görüntüsü oluşturulacağını belirtir. Görüntünün temel altyapısını Alpine Linux 3.13 versiyonu oluşturur.
# 
# Dockerfile
# Copy code
# RUN apk update && apk upgrade && apk add --no-cache \
#     vsftpd
# Bu satır, Alpine Linux paket yöneticisi apk kullanılarak güncellemeler yapılır ve vsftpd paketi kurulur.
# 
# Dockerfile
# Copy code
# COPY conf/vsftpd.conf /tmp/vsftpd.conf
# Bu komut, yerel dizindeki vsftpd.conf dosyasını Docker görüntüsünün /tmp/ yoluna kopyalar. Bu dosya, VSFTPD sunucusunun yapılandırma ayarlarını içerir.
# 
# Dockerfile
# Copy code
# COPY tools/server_ftp.sh /tmp/server_ftp.sh
# Bu komut, yerel dizindeki server_ftp.sh dosyasını Docker görüntüsünün /tmp/ yoluna kopyalar. Bu dosya, FTP sunucusunu başlatan betiği içerir.
# 
# Dockerfile
# Copy code
# ENTRYPOINT ["sh", "/tmp/server_ftp.sh"]
# Bu komut, Docker konteyneri başlatıldığında otomatik olarak server_ftp.sh betiğini çalıştırır. Bu, VSFTPD sunucusunun otomatik olarak başlatılmasını sağlar.
# 
# Bu Docker dosyası, Alpine Linux tabanlı bir çevre içinde VSFTPD sunucusunu kurmayı ve başlatmayı otomatikleştiren bir yapı oluşturur.