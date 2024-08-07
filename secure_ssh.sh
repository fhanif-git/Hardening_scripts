#!/bin/bash
# secure_ssh.sh
# This script configures SSH for better security.

# Variables
SSH_PORT="<new_port>"
ALLOW_USERS="<username>"

# Backup current SSH configuration
echo "Backing up current SSH configuration..."
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Update SSH configuration
echo "Configuring SSH..."
sudo sed -i "s/#Port 22/Port $SSH_PORT/" /etc/ssh/sshd_config
sudo sed -i "s/#PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config
echo "AllowUsers $ALLOW_USERS" | sudo tee -a /etc/ssh/sshd_config
sudo sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

# Restart SSH service
echo "Restarting SSH service..."
sudo systemctl restart sshd
echo "SSH configuration completed."
