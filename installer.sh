#!/bin/bash

# Update the package list
sudo apt update

# Install Apache
sudo apt install -y apache2

# Install FFmpeg
sudo apt install -y ffmpeg

# Add PHP repository
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update

# Install PHP 8.1 and necessary extensions
sudo apt install -y php8.1 php8.1-cli php8.1-fpm php8.1-mysql php8.1-curl php8.1-gd php8.1-mbstring php8.1-xml php8.1-zip php8.1-ftp php8.1-imap php8.1-intl php8.1-soap php8.1-ldap

# Install zip and unzip
sudo apt install -y zip unzip

# Install phpMyAdmin
sudo apt install -y phpmyadmin

# Configure Apache for phpMyAdmin
sudo echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

# Restart Apache
sudo systemctl restart apache2

# Install MariaDB
sudo apt install -y mariadb-server

# Set root password for MariaDB
sudo debconf-set-selections <<< "mariadb-server-10.3 mysql-server/root_password password Cario@888$"
sudo debconf-set-selections <<< "mariadb-server-10.3 mysql-server/root_password_again password Cario@888$"

# Install MariaDB without prompts
sudo apt install -y mariadb-server

# Install Composer
sudo apt install -y composer

# Install Let's Encrypt certbot
sudo apt install -y certbot python3-certbot-apache

# Obtain SSL certificate using certbot
sudo certbot --apache

# Restart Apache
sudo systemctl restart apache2

# Install iptables
sudo apt install -y iptables

# Configure iptables rules
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 21 -j ACCEPT
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -j DROP

# Save iptables rules
sudo sh -c "iptables-save > /etc/iptables/rules.v4"

# Install ufw
sudo apt install -y ufw

# Configure ufw rules
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 22
sudo ufw allow 21

# Enable ufw
sudo ufw enable

# Install rar and unrar
sudo apt install -y rar unrar

# Install and configure ProFTPD FTP server
sudo apt install -y proftpd
sudo sed -i 's/# DefaultRoot/DefaultRoot/' /etc/proftpd/proftpd.conf
sudo systemctl restart proftpd

# Install and configure Postfix mail server
sudo debconf-set-selections <<< "postfix postfix/mailname string yourdomain.com"
sudo debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
sudo apt install -y postfix

# Install Roundcube webmail
sudo apt install -y roundcube roundcube-core roundcube-mysql roundcube-plugins

# Configure Roundcube
sudo cp /etc/roundcube/config.inc.php /etc/roundcube/config.inc.php.backup
sudo ln -s /etc/roundcube/apache.conf /etc/apache2/conf-available/roundcube.conf
sudo a2enconf roundcube.conf
sudo systemctl reload apache2

# Restart services
sudo systemctl restart apache2
sudo systemctl restart proftpd
sudo systemctl restart postfix

# Print MySQL root password for reference
echo "MySQL root password: Cario@888$"
