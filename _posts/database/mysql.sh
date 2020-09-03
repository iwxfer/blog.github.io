export HOST=127.0.0.1
export USER=root
export DATABASE=
export TABLE=
export BKP_FILE=bkp.sql
export ZBKP_FILE=bkp.sql.zstd

# export `root` password
mysqladmin -u root password NEWPASSWORD
mysqladmin -u root -p'oldpassword' password newpass
mysqladmin -u user -p oldpassword password newpass

# backup y restore
mysqldump -u root -p $DATABASE > bkp.sql
mysqldump -u root -p --all-databases > /tmp/bkp.sql
mysqldump -h $HOST -u $USER -p __DATABASE__ > bkp.sql
mysqldump -h $HOST -u $USER -p $DATABASE $TABLE > bkp.sql
mysqldump -h $HOST -u $USER -p $DATABASE $TABLE -C > bkp.sql.zip
mysqldump -h $HOST -u $USER -p $DATABASE $TABLE -C --compression-algorithms=zstd > $ZBKP_FILE
# --compress --compression-algorithms=zstd 

mysql -u __USER__ -p < bkp.sql
mysql -u root -p < bkp.sql

# Enable remote connections
sudo sed -i '/bind-address/s/^/#/g' /etc/mysql/my.cnf
sudo sed -i '/bind-address/s/^/#/g' sudo vim /etc/mysql/mariadb.conf.d/50-server.cnf
sudo sed -i '/skip-networking/s/^/#/g' sudo vim /etc/mysql/mariadb.conf.d/50-server.cnf
sudo service mysql restart
# sed -i '/test/s/^/#/g' file    (to comment out)
# sed -i '/test/s/^#//g' file    (to uncomment)

## Restore root password ##
sudo service mysql stop
mysqld_safe --skip-grant-tables &
mysql -u root mysql
# mysql> UPDATE user SET Password=PASSWORD('nueva_contraseña') WHERE User='root';
# mysql> FLUSH PRIVILEGES;
# mysql> \q
killall mysqld;
/etc/init.d/mysql start

## Repair 
mysqld --datadir=/wamp/data --console
bin\mysqld.exe --datadir=/wamp/data --console --user=root --skip-grant-tables
use mysql;
repair table user use_frm;