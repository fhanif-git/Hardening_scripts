#!/bin/bash
# install_nginx.sh
# This script installs and configures Nginx.

# Install Nginx
echo "Installing Nginx..."
sudo dnf install nginx -y

# Enable and start Nginx
echo "Enabling and starting Nginx..."
sudo systemctl enable nginx --now

# Basic Nginx configuration
echo "Configuring Nginx..."
sudo sed -i "s/# server_tokens off;/server_tokens off;/" /etc/nginx/nginx.conf

# Restart Nginx to apply changes
echo "Restarting Nginx..."
sudo systemctl restart nginx
echo "Nginx installation and configuration completed."
