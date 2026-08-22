#!/bin/bash
set -euo pipefail

BUCKET_NAME="tahir-image-frontend"

dnf install -y httpd awscli
systemctl enable http
aws s3 sync "s3://${BUCKET_NAME}/" /var/www/html/ --delete
chown -R apache:apache /var/www/html
printf '%s\n' 'ErrorDocument 404 /404.html' > /etc/httpd/conf.d/site-errors.conf
systemctl restart httpd
