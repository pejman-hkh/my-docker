chmod 0777 -R home/pma/tmp/
read -p 'Username: ' user
read -p 'Domain without www: ' domain
read -p 'Which php version: ' phpversion

echo $user : $domain;
mkdir -p home/$user/$domain;
mkdir -p home/$user/tmp
cp $phpversion/sample/domain.ir.conf $phpversion/php-fpm.d/$domain.conf
sed -i 's\usersample\'"$user"'\g' $phpversion/php-fpm.d/$domain.conf
cp nginx/sample/domain.ir.conf nginx/http.d/$domain.conf
sed -i 's\domain.ir\'"$domain"'\g' nginx/http.d/$domain.conf
sed -i 's\usersample\'"$user"'\g' nginx/http.d/$domain.conf
sed -i 's\sockets/php81\sockets/'"$phpversion"'\g' nginx/http.d/$domain.conf

mkdir -p letsencrypt/live/$domain/

read -p 'Enter repository url: ' rep
mkdir home/$user/$domain/$user
git clone $rep home/$user/$domain/$user/.

cp data/certs/domain.ir.cert letsencrypt/live/$domain/fullchain.pem;
cp data/certs/domain.ir.key letsencrypt/live/$domain/privkey.pem;
sudo docker compose down
sudo docker compose up -d
#sudo rm -rf letsencrypt/live/$domain
sudo docker compose exec nginx certbot certonly --webroot -w /home/$user/$domain/public_html/ -d $domain -d www.$domain
sudo docker compose restart nginx

sudo docker compose exec nginx sh -c "cd /home/$user/$domain/$user/ && bash install.sh"