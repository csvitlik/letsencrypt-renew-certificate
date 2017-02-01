# Abstract

Helper script to quickly renew HTTPS certificates with
[Let's Encrypt](https://letsencrypt.org/).

# Use

    $ sudo sh renew-certificate.sh

## Customization

You must customize the script:

Path to [acme-tiny](https://github.com/diafygi/acme-tiny/).

    ACME_TINY=/home/user/Code/acme-tiny/acme_tiny.py 

Path to your private key:

    ACCOUNT_KEY=/home/user/.user.key

Path to the directory where the challenges will be created:

ACME_DIR=/var/www/challenges

N.B. You might have to apply this patch to acme_tiny.py:

Path to NGINX SSL Certificates:

    NGINX_SSL=/etc/ssl/nginx/

URI for domain name:

    SITE=domain.com

Certificates:

    CRT=$NGINX_SSL/$SITE.crt
    CSR=$NGINX_SSL/$SITE.csr 
    PEM=/ssl/nginx/$SITE.pem
    X3=$NGINX_SSL/lets-encrypt-x3-cross-signed.pem 
