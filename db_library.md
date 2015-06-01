# Come implementare un db di libri
**Il disegno e' questo**

![alt tag](https://raw.githubusercontent.com/GiuseppeFasanella/DataBase_utilities/master/img/libri_db.png)

* create table Libro(title VARCHAR(30) NOT NULL, periodo VARCHAR(20) NULL, argomento VARCHAR(20) NULL, posizione_fissa VARCHAR(20) NOT NULL, posizione_temp VARCHAR(20) NULL, libro_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);

* create table autore(nome VARCHAR(60) NOT NULL, autore_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);

* create table libro_autore(libro_id int unsigned not null, autore_id int unsigned not null, primary key(libro_id,autore_id));

* insert into autore value("Thomas Mann",NULL)

* insert into autore value("George Simenon",NULL)

* insert into Libro value("Maigret prende un granchio","","","11a","",NULL);

* insert into libro_autore value(1,2); 
*questo e' un po' debole perche' devi sapere che 1 e' Maigret prende un granchio e 2 e' Simenon*

**Query**

select Libro.title, Libro.posizione_fissa, autore.nome from Libro,autore,libro_autore where Libro.libro_id=libro_autore.libro_id and libro_autore.autore_id=autore.autore_id;

![alt tag](https://raw.githubusercontent.com/GiuseppeFasanella/DataBase_utilities/master/img/output_query.png)



