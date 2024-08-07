#!/bin/bash
# automate_backups.sh
# This script sets up regular backups using cron jobs.

# Create a backup script
echo "Creating backup script..."
sudo tee /usr/local/bin/backup.sh <<EOL
#!/bin/bash
# This script performs a backup of the web server files and configuration.

BACKUP_DIR="/backup"
WEB_DIR="/var/www"
NGINX_CONF_DIR="/etc/nginx"

# Create backup directory if it doesn't exist
mkdir -p \$BACKUP_DIR

# Backup web files and Nginx configuration
tar -czf \$BACKUP_DIR/web_backup_\$(date +\%F).tar.gz \$WEB_DIR \$NGINX_CONF_DIR
EOL

# Make the backup script executable
sudo chmod +x /usr/local/bin/backup.sh

# Set up a cron job for daily backups
echo "Setting up cron job for daily backups..."
(crontab -l 2>/dev/null; echo "0 2 * * * /usr/local/bin/backup.sh") | crontab -
echo "Backup automation completed."
