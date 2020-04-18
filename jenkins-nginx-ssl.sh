#!/bin/bash
sudo apt install nginx software-properties-common -y
sudo rm -rf /etc/nginx/sites-enabled/default
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt update
sudo apt install certbot -y
sudo certbot certonly --standalone --non-interactive -d jenkins.heryslty.xyz --email hery1923@gmail.com --agree-tos
sudo mkdir /etc/nginx/ssl/
sudo openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048
sudo service nginx stop
sudo certbot certonly --standalone --non-interactive -d jenkins.heryslty.xyz --email hery1923@gmail.com --agree-tos
sudo nginx -t
sudo systemctl restart nginx