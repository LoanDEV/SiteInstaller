#!/bin/bash
echo "Site domain (exemple.com)"
read domain

echo "Root of the site (/home/web/exemple.com/)"
read root


cp BASE.conf /etc/apache2/sites-available/$domain.conf

echo "Domain replacement --> $domain"
sed -i -e "s/DOMAINE/$domain/g" $domain.conf


echo "Root directory replacement --> $root"
sed -i -e "s#RACINE#$root#g" $domain.conf


echo "Creation of the logs folder --> /home/web/logs/$domain"
mkdir /home/web/logs/$domain


a2ensite $domain.conf
sleep 1
service apache2 reload
echo "Done !"
