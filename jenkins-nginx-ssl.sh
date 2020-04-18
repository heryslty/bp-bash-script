#!/bih/bash
sudo apt install nginx software-properties-common -y
sudo rm -rf /etc/nginx/sites-enabled/default
sudo add-apt-repository ppa:certbot/certbot
sudo apt update
sudo apt install certbot -y
sudo certbot certonly --standalone -d jenkins.heryslty.xyz
sudo mkdir /etc/nginx/ssl/
sudo openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048
sudo service nginx stop
sudo nano /etc/nginx/site-enabled/jenkins.heryslty.xyz
sudo certbot certonly --standalone -d jenkins.heryslty.xyz 
sudo nginx -t
sudo systemctl restart nginx