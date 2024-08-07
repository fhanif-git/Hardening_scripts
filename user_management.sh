#!/bin/bash
# user_management.sh
# This script disables root login and creates a new user with sudo privileges.

# Disable root login
echo "Disabling root login..."
sudo passwd -l root

# Create a new user
NEW_USER="<username>"
echo "Creating new user $NEW_USER..."
sudo adduser $NEW_USER
sudo passwd $NEW_USER

# Add new user to the wheel group (sudo privileges)
echo "Adding $NEW_USER to the wheel group..."
sudo usermod -aG wheel $NEW_USER
echo "User management completed."
