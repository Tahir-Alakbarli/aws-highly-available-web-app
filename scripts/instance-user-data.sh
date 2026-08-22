#!/bin/bash
set -euo pipefail

BUCKET_NAME="tahir-image-frontend"

aws s3 sync "s3://${BUCKET_NAME}/" /var/www/html/ --delete
chown -R apache:apache /var/www/html
systemctl enable httpd
systemctl restart httpd
