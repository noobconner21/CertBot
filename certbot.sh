#!/bin/sh
#root check

if ! [ $(id -u) = 0 ]; then
   echo -e "${RED}Plese run the script with root privilages!${ENDCOLOR}"
   exit 1
fi

clear
apt install figlet lolcat -y
apt install screenfetch -y
apt update -y
apt upgrade -y
clear
echo -e "          ░█▀▀▀█ ░█▀▀▀█ ░█─── ─█▀▀█ ░█▀▀█  " | lolcat
echo -e "          ─▀▀▀▄▄ ─▀▀▀▄▄ ░█─── ░█▄▄█ ░█▀▀▄  " | lolcat
echo -e "          ░█▄▄▄█ ░█▄▄▄█ ░█▄▄█ ░█─░█ ░█▄▄█  " | lolcat
echo ""
echo "             SSL certificate useing certbot"
sleep 3
echo ""
read -p "Do you want to continue? [y/n]" CONT
if [[ ! $CONT =~ ^[Yy]$ ]]; then
  echo "Abort.";
  exit 100
fi
#request
clear

read -p "📧 Please Enter a valid email address: " email
read -p "🌏 Please Enter the domain name: " domain

#main script
apt install snapd
snap install core; snap refresh core
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot

sudo certbot certonly --standalone --preferred-challenges http --agree-tos --email $email -d $domain

echo ""
echo ""
echo ""
echo "If you want to copy the public key and the private key, copy the path as below"
echo ""
echo "~ Public Key = /etc/letsencrypt/live/your_domain/fullchain.pem"
echo "~ Private Key = /etc/letsencrypt/live/your_domain/privkey.pem"
echo ""
echo ""
echo ""
echo " 2019-2024 Copyright | SSLaB LK Dev. Team"
