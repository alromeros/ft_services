#! /bin/bash

# Wait that mysql was up
until mysql
do
	echo "NO_UP"
done

# Init DB
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'alromero'@'%' IDENTIFIED BY 'services';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'alromero'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
#echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "ALTER USER 'alromero'@'%' IDENTIFIED BY 'services';" | mysql -u root --skip-password
#echo "ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root --skip-password
echo "DROP DATABASE test" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
cat wordpress.sql | mysql wordpress -u root --skip-password