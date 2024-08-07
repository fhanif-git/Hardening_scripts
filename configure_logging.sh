#!/bin/bash
# configure_logging.sh
# This script configures log rotation for Nginx logs.

# Create logrotate configuration for Nginx
echo "Configuring log rotation for Nginx..."
sudo tee /etc/logrotate.d/nginx <<EOL
/var/log/nginx/*.log {
    daily
    missingok
    rotate 14
    compress
    delaycompress
    notifempty
    create 0640 nginx adm
    sharedscripts
    postrotate
        [ -f /var/run/nginx.pid ] && kill -USR1 `cat /var/run/nginx.pid`
    endscript
}
EOL
echo "Log rotation configuration completed."
