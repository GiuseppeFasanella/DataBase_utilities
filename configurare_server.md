Installa apache2

Installa php
sudo apt-get install libapache2-mod-php5
sudo a2enmod php5
sudo service apache2 restart

Installa mysql-server
sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
sudo service apache2 restart


sudo emacs /etc/mysql/my.cnf
bind-address            = 192.168.1.12
sudo service apache2 restart

mysql -u root -p
CREATE DATABASE Library;
USE Library;
create table Libro(title VARCHAR(30) NOT NULL, periodo VARCHAR(20) NULL, argomento VARCHAR(20) NULL, posizione_fissa VARCHAR(20) NOT NULL, posizione_temp VARCHAR(20) NULL, libro_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);
alter table Libro add constraint unique_title unique(title); 
create table autore(nome VARCHAR(60) NOT NULL, autore_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);
alter table autore add constraint unique_name unique(nome); 
create table libro_autore(libro_id int unsigned not null, autore_id int unsigned not null, primary key(libro_id,autore_id));

mysql> create user 'usersif'@'%' IDENTIFIED BY 'Hannibal123'
mysql> grant all privileges on *.* to 'usersif'@'%' with grant option;

mysql> create user 'root'@'Freebox-Server.local' IDENTIFIED BY 'H**123'
    -> ;
mysql> grant all privileges on *.* to 'root'@'Freebox-Server.local' with grant option;
Query OK, 0 rows affected (0.00 sec)

ErrorCan't connect to MySQL server on 'usersif.ddns.net' (111)

mysql> SHOW VARIABLES WHERE Variable_name = 'port';

--> Reindirizza la porta 3306 dal modem al raspberry (e' la porta di default di mysql server)
