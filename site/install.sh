chmod 0777 -R home/pma/tmp/
read -p 'Username: ' user
read -p 'Domain without www: ' domain
echo $user : $domain;
mkdir -p home/$user/$domain/public_html
mkdir -p home/$user/tmp
cp php81/sample/partakbi.ir.conf php81/php-fpm.d/$domain.conf
sed -i 's\partak\'"$user"'\g' php81/php-fpm.d/$domain.conf
cp nginx/sample/partakbi.ir.conf nginx/http.d/$domain.conf
sed -i 's\partakbi.ir\'"$domain"'\g' nginx/http.d/$domain.conf
sed -i 's\partak\'"$user"'\g' nginx/http.d/$domain.conf

mkdir -p letsencrypt/live/$domain/

cp data/certs/domain.ir.cert letsencrypt/live/$domain/fullchain.pem;
cp data/certs/domain.ir.key letsencrypt/live/$domain/privkey.pem;
sudo docker compose down
sudo docker compose up -d
#sudo rm -rf letsencrypt/live/$domain
sudo docker compose exec nginx certbot certonly --webroot -w /home/$user/$domain/public_html/ -d $domain -d www.$domain
sudo docker compose restart nginx