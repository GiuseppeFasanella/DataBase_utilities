# How To Migrate a MySQL Database Between Two Servers

* Make your usual access: `mysql -u root -p` (o semplicemente da terminale, non mi ricordo)

* Step 1: dumpt the db

mysqldump -u root -p [database name] > dump_db.sql

Find the dump_db.sql in your /home directory

* Step 2: copy the dump_db.sql in your other server

Use a pen drive, or `scp` if you can

* Step 3: Create the "host db" in the new server

mysql -u root -p

create database host_db

and leave it empty

* Step 4: import the db in the new server

From terminal:

mysql -u root -p host_db < /path/to/dump_db.sql



