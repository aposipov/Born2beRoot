# commands
  
```
certUtil -hashfile b2br.vdi sha1
```
```
apt install sudo vim ufw libpam-pwquality net-tools wget lighttpd mariadb-server php php-cgi php-mysql -y  
```
```
lsblk
```
ufw (ufw enable/ufw allow/ufw status verbose)  
groups groupadd  
useradd adduser  
usermod -aG <group> <user>  
gpasswd -a <user> <group>  
passwd   
tty sudo shvt №tty  
  
poweroff reboot logout exit  

# MariaDB
`su` - войти под рутом  
`apt install mariadb-server` - установка  
`mysql_secure_installation` - настройка (везде yes, кроме установки пароля рута и в первом запросе нажать Enter)  
`mariadb` войти в оболочку дб  
`CREATE DATABASE wordpress;` создание дб  
`CREATE USER '<user>'@'localhost' IDENTIFIED BY 'password';` создание пользователя для дб  
`GRANT ALL ON wordpress.* TO '<user>'@'localhost';` привилегии для пользователя  
`FLUSH PRIVILEGES;`  
`exit`  
`mariadb -u <user> -p` вход под пользователем  
`SHOW DATABASES;` проверка созданной БД  

# lighttpd
`apt install lighttpd` установка  
`/etc/lighttpd/lighttpd.conf` разрешаем доступ по порту сервера `ufw allow 80`  
Пробрасываем порты в virtualbox 80  
Заходим в браузере по `ip 127.0.0.1` попадаем на посадочную страницу
  
# PHP
`apt install php php-cgi php-mysql`  
`lighty-enable-mod fastcgi` запускам север в режиме fastcgi  
`lighty-enable-mod fastcgi-php` подключаем к сереверу php  
`service lighttpd force-reload` перезагружаем сервис  
  
# Wordpress
`su`  
`wget https://ru.wordpress.org/latest-ru_RU.tar.gz`  
`cp latest-ru_RU.tar.gz /var/www/html/`  
`tar -xvzf latest-ru_RU.tar.gz`  
 
# folders
`$chown -R www-data:www-data /var/www/html/wordpress`  
`$find /var/www/html/wordpress -type d -exec chmod 750 {} \;`  
`$find /var/www/html/wordpress -type f -exec chmod 640 {} \;`  

# setup wordpress
`http://127.0.0.1/wordpress`  

# vsftpd
`apt install vsftpd`  
`service vsftpd stop`  
/etc/vsftpd.conf  
write_enable=YES  
chroot_local_user=YES    
`ufw allow 20`  
/etc/init.d/vsftpd start  
/etc/init.d/vsftpd status  
https://routerus.com/how-to-setup-ftp-server-with-vsftpd-on-ubuntu-20-04/
  
# mail server
```
apt install mailutils postfix -y
```
/etc/postfix/main.cf редактируем файл  

`mailbox_size_limit = 0`  
`recipient_delimiter = +`  
`inet_interfaces = loopback-only`  
  
`mydestination = $myhostname, localhost.$mydomain, $mydomain`  
 ```
 sudo systemctl restart postfix
 ```  
 https://www.8host.com/blog/ustanovka-i-nastrojka-smtp-servera-isxodyashhej-pochty-postfix-v-debian-10/
  
  

