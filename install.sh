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
apt-add-repository universe

# Install PHP 8.1 and necessary extensions
sudo apt install -y php8.1 php8.1-{common,cli,gd,mysql,mbstring,bcmath,xml,fpm,curl,zip}  tar unzip git redis-server





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

# Secure MariaDB installation
sudo mysql_secure_installation

# Install Composer
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

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
