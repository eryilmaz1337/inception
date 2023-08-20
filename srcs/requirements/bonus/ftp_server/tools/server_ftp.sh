#!/bin/sh

if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then

    mkdir -p /var/www/html

    cp /etc/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
    mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

    # Yeni kullanıcı ekle
    adduser $FTP_USR --disabled-password
    echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null
    # Dosya üzerindeki kullanıcı yetkisi
    chown -R $FTP_USR:$FTP_USR /var/www/html

    # env'den FTP_USR değerini alıp vsftpd.userlist dosyasına yazar
    echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

fi

# vsftpd başlat
echo "FTP started on :21"
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf




# Bu betik, bir Docker konteyneri içinde VSFTPD (Very Secure FTP Daemon) adlı FTP sunucusunun otomatik olarak yapılandırılması ve başlatılması amacıyla kullanılır. İşte betiğin her bir bölümünün ne işe yaradığına dair detaylı açıklamalar:
# 
# bash
# Copy code
!/bin/sh
# Bu satır, betiğin "sh" kabuk betiği olduğunu belirtir.
# 
# bash
# Copy code
# if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then
# Bu ifade, /etc/vsftpd/vsftpd.conf.bak dosyasının var olup olmadığını kontrol eder. Eğer bu dosya henüz oluşturulmadıysa, içeriye girer ve VSFTPD yapılandırması ile kullanıcı oluşturma işlemlerini yapar.
# 
# bash
# Copy code
# mkdir -p /var/www/html
# Bu komut, /var/www/html dizinini oluşturur. Bu dizin, FTP sunucusu tarafından servis edilecek dosyaların bulunacağı dizindir.
# 
# bash
# Copy code
# cp /etc/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
# mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf
# Bu komutlar, orijinal VSFTPD yapılandırma dosyasını yedekler ve yerine yeni bir yapılandırma dosyasını kopyalar. Yeni yapılandırma dosyası, önceden belirtilen /tmp/vsftpd.conf yolundan alınır.
# 
# bash
# Copy code
# adduser $FTP_USR --disabled-password
# echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null
# chown -R $FTP_USR:$FTP_USR /var/www/html
# echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null
# Bu komutlar, belirli bir kullanıcı oluşturur, kullanıcıya şifre atar, kullanıcıya ait dizinlerin sahipliğini ayarlar ve kullanıcı adını vsftpd.userlist dosyasına ekler. Bu, VSFTPD sunucusunun yetkilendirme ve erişim kontrolleri için kullanılır.
# 
# bash
# Copy code
# echo "FTP started on :21"
# /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
# Bu satırlar, FTP sunucusunu başlatır. Önce "FTP started on :21" mesajını yazdırır, ardından VSFTPD'yi belirtilen yapılandırma dosyasıyla çalıştırır.
# 
# Bu betik, Docker konteyneri içinde VSFTPD sunucusunun kurulumunu ve başlatılmasını otomatikleştirir.