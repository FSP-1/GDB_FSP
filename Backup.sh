#/bin/bash
set -x

#----------------------------------------------------
# Variables de configuración 
#----------------------------------------------------

MYSQL_ROOT_PASSWORD=root
PHPMYADMIN_APP_PASS= root
#----------------------------------------------------
#----------------------------------------------------

# Instalacíon de la pila LAMP
#----------------------------------------------------
# Actualizamos el sistema
apt update
apt upgrade -y

# Instalamos El Apache2
apt install apache2 -y

# Instalamos MySQL Server
apt install mysql-server -y

# Cambiamos la contraseña del usuario root
# mysql <<< "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';"

# Instalamos php-mysql
apt install php libapache2-mod-php php-mysql -y

# Reiniciamos el servidor apache2
systemctl restart apache2

# Copiamos el archivo info.php en /var/www/html
cp info.php /var/www/html

#----------------------------------------------------
# Instalacíon de herramientas adicionales 
#----------------------------------------------------
# Herramienta: Adminer
cd /var/www/html
mkdir adminer
cd adminer
wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php
mv adminer-4.8.1-mysql.php index.php

# Actualizamos el propietario y el grupo del directorio /var/www/html
chown www-data:www-data /var/www/html -R 

# Herramienta: phpMyAdmin 
#
#Instalamos las dependencias de phpmyadmin
apt install  php-mbstring php-zip php-gd php-json php-curl

# Configuramos las respuestas para hacer una instalacíon automatica 
echo "phpadmin phpadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections 
echo "phpadmin phpadmin/dbconfig-install boolean true" | debconf-set-selections 
echo "phpadmin phpadmin/mysql/app-pass password $PHPMYADMIN_APP_PASS" | debconf-set-selections 
echo "phpadmin phpadmin/app-password-confirm password $PHPMYADMIN_APP_PASS" | debconf-set-selections 

# Instalamos phpMyAdmin 
sudo apt install phpmyadmin -y 
#----------------------------------------------------
