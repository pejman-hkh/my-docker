bash install-docker.sh
cd my-alpine
make
cd ../site/mysql
make
cd ../
make
sudo service nginx stop
sudo service apache2 stop
sudo service mysqld stop
bash install.sh