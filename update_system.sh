#!/bin/bash
# update_system.sh
# This script updates all packages on the system to their latest versions.

# Update all packages
echo "Updating all packages..."
sudo dnf update -y
echo "System update completed."
