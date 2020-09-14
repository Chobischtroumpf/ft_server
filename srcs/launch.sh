apt-get update
apt-get upgrade -y
apt-get install -y wget nginx mariadb-server php php-cli php-fpm php-cgi php-mysql php-mbstring openssl
apt-get install -y php-{mbstring,zip,gd,xml,pear,gettext,cgi}

# wordpress
wget wordpress.org/latest.tar.gz
mv latest.tar.gz /var/www/html
cd /var/www/html
tar xvf /var/www/html/latest.tar.gz
rm -rf /var/www/html/latest.tar.gz
mkdir /var/www/html/wordpress
mv /tmp/wp-config.php /var/www/html/wordpress
mkdir /var/www/html/nginx
mv /var/www/html/index* /var/www/html/nginx/

# sql
service mysql start
mysql < /var/www/init.sql
mysql wordpress -u root --password=  < /var/www/wordpress.sql

ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

# phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz
mkdir /var/www/html/phpmyadmin
tar xzf phpMyAdmin-4.9.0.1-english.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin
rm -rf phpMyAdmin-4.9.0.1-english.tar.gz
mv /tmp/config.inc.php /var/www/html/phpmyadmin/

# perm
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*


# ssl
cd / && wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64 && mv mkcert-v1.1.2-linux-amd64 certs && chmod 755 certs
./certs -install
./certs localhost

service nginx start
service php7.3-fpm start
