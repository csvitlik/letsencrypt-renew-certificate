#!/bin/sh

# https://github.com/diafygi/acme-tiny/issues/8
PYTHON=python3

# Path to acme_tiny.py:
ACME_TINY=/home/user/Code/acme-tiny/acme_tiny.py 

# Path to account private key:
ACCOUNT_KEY=/home/user/.user.key

# Path to challenge directory:
ACME_DIR=/var/www/challenges

# Location of NGINX SSL certs:
NGINX_SSL=/etc/ssl/nginx/

# Domain name:
SITE=domain.com

# Certificates:
CRT=$NGINX_SSL/$SITE.crt
CSR=$NGINX_SSL/$SITE.csr 
PEM=/ssl/nginx/$SITE.pem
X3=$NGINX_SSL/lets-encrypt-x3-cross-signed.pem 

# Do It
$PYTHON $ACME_TINY \
	--account-key $ACCOUNT_KEY \
	--acme-dir $ACME_DIR \
	--csr $CSR \
	> $CRT

cat $CRT $X3 > $PEM
chmod 400 $NGINX_SSL/*

systemctl restart nginx
