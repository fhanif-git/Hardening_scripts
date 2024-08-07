#!/bin/bash
# install_fail2ban.sh
# This script installs and configures Fail2Ban to protect Nginx.

# Install Fail2Ban
echo "Installing Fail2Ban..."
sudo dnf install fail2ban -y

# Enable and start Fail2Ban
echo "Enabling and starting Fail2Ban..."
sudo systemctl enable fail2ban --now

# Configure Fail2Ban for Nginx
echo "Configuring Fail2Ban for Nginx..."
sudo tee /etc/fail2ban/jail.local <<EOL
[nginx-http-auth]
enabled = true
filter = nginx-http-auth
logpath = /var/log/nginx/error.log
maxretry = 3
bantime = 3600
EOL

# Restart Fail2Ban to apply configuration
echo "Restarting Fail2Ban..."
sudo systemctl restart fail2ban
echo "Fail2Ban installation and configuration completed."
