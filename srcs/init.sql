CREATE DATABASE wordpress;
CREATE USER 'wp-user'@'localhost' IDENTIFIED BY 'server';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp-user'@'localhost';
FLUSH PRIVILEGES;