#!/bin/bash
# firewall_config.sh
# This script installs and configures the firewall to allow only necessary services.

# Install firewalld
echo "Installing firewalld..."
sudo dnf install firewalld -y

# Enable and start firewalld
echo "Enabling and starting firewalld..."
sudo systemctl enable firewalld --now

# Allow necessary services
echo "Configuring firewall rules..."
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https

# Reload firewall to apply changes
echo "Reloading firewall..."
sudo firewall-cmd --reload
echo "Firewall configuration completed."
