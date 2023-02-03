#! /bin/bash

echo 'UPDATE'

sudo apt-get update -y

echo 'done'

echo 'UPGRADE'

sudo apt-get upgrade -y

echo 'done'


echo 'INSTALL APACHE 2'

sudo apt install -y apache2 apache2-utils

echo 'done'


echo 'START APACHE 2'

sudo systemctl start apache2

echo 'done'

echo 'ENABLE APACHE 2'

sudo systemctl enable apache2

echo 'done'

echo 'PORT APACHE 2'

sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT


echo 'done'
echo 'PORT 443 APACHE 2'

sudo iptables -I INPUT -p tcp --dport 443 -j ACCEPT


echo 'done'
echo 'CHMOD APACHE 2'

sudo chown www-data:www-data /var/www/html/ -R



echo 'done'

echo 'RELOAD APACHE 2'

sudo systemctl reload apache2

echo 'done'

echo 'MARIADB'

sudo apt install mariadb-server mariadb-client -y

echo 'done'

echo 'MARIADB start'

sudo systemctl start mariadb

echo 'done'

echo 'MARIADB ENABLE'

sudo systemctl enable mariadb


echo 'done'

echo 'MARIADB LOGIN SET UP'

sudo mysql_secure_installation


echo 'done'



echo 'php8.1 SET UP'

sudo apt install php8.1-fpm php8.1 libapache2-mod-php8.1 php8.1-common php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-intl php8.1-bcmath unzip -y


echo 'done'

echo 'python certbot ssl SET UP'
sudo apt install python3-certbot-apache
echo 'done'

echo 'php7.4 SET UP'

sudo systemctl restart apache2


echo 'done'

echo 'PHPMYADMIN SET UP'

sudo apt-get install phpmyadmin -y


echo 'done'

echo 'FFMPEG SET UP'

sudo apt-get install ffmpeg -y


echo 'done'

echo 'rar SET UP'

sudo apt-get install rar -y


echo 'done'

echo 'unrar SET UP'

sudo apt-get install unrar -y


echo 'done'

echo 'curl SET UP'

sudo apt-get install curl -y


echo 'done'
echo 'save iptables SET UP'

sudo /sbin/iptables-save > /etc/iptables/rules.v4


echo 'done'

echo 'PHPINFO'

echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

echo 'done'

echo 'COMPOSER SET UP'

sudo apt install php-cli unzip -y


echo 'done'


echo 'COMPOSER SET UP'

curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php


echo 'done'

echo 'COMPOSER SET UP'

HASH=`curl -sS https://composer.github.io/installer.sig`


echo 'done'

echo 'COMPOSER SET UP'

php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"


echo 'done'
echo 'COMPOSER SET UP'

sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

echo 'done'

echo 'COMPOSER VERIFY SET UP'

composer

echo 'done'





