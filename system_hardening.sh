#!/bin/bash
# system_hardening.sh
# This script disables unnecessary services and sets up automatic updates.

# Disable unnecessary services
echo "Disabling unnecessary services..."
sudo systemctl disable <service_name> --now

# Install and configure automatic updates
echo "Installing dnf-automatic..."
sudo dnf install dnf-automatic -y

# Enable and start dnf-automatic
echo "Enabling and starting dnf-automatic..."
sudo systemctl enable --now dnf-automatic.timer
echo "System hardening completed."
