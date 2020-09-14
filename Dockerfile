FROM debian:buster
# cp
COPY srcs/localhost /etc/nginx/sites-available/
COPY srcs/wordpress.sql /var/www/
COPY srcs/init.sql /var/www/
COPY srcs/launch.sh .
COPY srcs/wp-config.php /tmp
COPY srcs/config.inc.php /tmp
# script
CMD bash launch.sh && tail -f /dev/null
