#!/bin/bash
# configure_ssl.sh
# This script obtains and configures SSL certificates using Certbot.

# Install Certbot and the Nginx plugin
echo "Installing Certbot and Nginx plugin..."
sudo dnf install certbot python3-certbot-nginx -y

# Obtain SSL certificate
DOMAIN="your_domain.com"
echo "Obtaining SSL certificate for $DOMAIN..."
sudo certbot --nginx -d $DOMAIN

# Configure SSL settings in Nginx
echo "Configuring SSL in Nginx..."
SSL_CONF="/etc/nginx/conf.d/$DOMAIN.conf"
sudo sed -i "s/listen 80;/listen 443 ssl;/" $SSL_CONF
sudo sed -i "s/# listen 443 ssl;/listen 443 ssl;/" $SSL_CONF
sudo sed -i "s/# ssl_certificate/ssl_certificate/" $SSL_CONF
sudo sed -i "s/# ssl_certificate_key/ssl_certificate_key/" $SSL_CONF
echo 'ssl_protocols TLSv1.2 TLSv1.3;' | sudo tee -a $SSL_CONF
echo 'ssl_prefer_server_ciphers on;' | sudo tee -a $SSL_CONF
echo 'ssl_ciphers "EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH";' | sudo tee -a $SSL_CONF

# Restart Nginx to apply SSL configuration
echo "Restarting Nginx..."
sudo systemctl restart nginx
echo "SSL/TLS configuration completed."
