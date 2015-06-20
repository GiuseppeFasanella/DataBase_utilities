# Interfaccia php

* Nella cartella /var/www crea una cartella My_db (ti ricordo che se hai fatto le cose bene da browser puoi navigare la cartella /var/www scrivendo come indirizzo `localhost`)
* fuori da /www piazza lo script di aggancio al db `mysqli_connect.php`
* in www/My_db/ piazza gli script di lavoro

A questo punto, da browser, se scrivi `localhost/My_db/` puoi lavorare sul tuo db in tutta comodita'
* `localhost/My_db/addbook.php` permette di inserire un nuovo libro
* `localhost/My_db/searchBook.php` permette di cercare un libro
* `localhost/My_db/getAllLibrary.php` visualizza a schermo TUTTI i libri che hai
