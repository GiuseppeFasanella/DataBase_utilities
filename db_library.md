# Come implementare un db di libri
**Il disegno e' questo**

![alt tag](https://raw.githubusercontent.com/GiuseppeFasanella/DataBase_utilities/master/img/libri_db.png)

**Fatto il disegno, puoi creare le tabelle e popolarle**

* create table Libro(title VARCHAR(30) NOT NULL, periodo VARCHAR(20) NULL, argomento VARCHAR(20) NULL, posizione_fissa VARCHAR(20) NOT NULL, posizione_temp VARCHAR(20) NULL, libro_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);

* create table autore(nome VARCHAR(60) NOT NULL, autore_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);

* alter table autore add constraint unique_name unique(nome); **in questo modo ti proteggi dall'inserire due volte lo stesso autore**

* create table libro_autore(libro_id int unsigned not null, autore_id int unsigned not null, primary key(libro_id,autore_id));

* insert into Libro value("Maigret prende un granchio","","","11a","",NULL);

* insert into autore value("George Simenon",NULL);

* insert into libro_autore(libro_id,autore_id) select libro_id, autore_id from Libro join autore where Libro.title="Maigret prende un granchio" and autore.nome="George Simenon"; 

**Con "insert select" eviti di scrivere una cosa del genere**

* insert into libro_autore value(X,Y); 

*Che risulta debolissima perche' devi sapere che X e' "Maigret prende un granchio" e Y e' Simenon.*

* Se poi volessi sapere l'id di un libro e l'id del suo autore, li chiedo cosi':

select nome,autore_id from autore where nome="Gabriele D'Annunzio";

select title, libro_id from Libro where title="Il trionfo della morte";


**Le mie query solite**

**Il concetto cardine e' quello di fare un controllo incrociato delle chiavi**

select Libro.title, Libro.posizione_fissa, autore.nome from Libro,autore,libro_autore where Libro.libro_id=libro_autore.libro_id and libro_autore.autore_id=autore.autore_id;

![alt tag](https://raw.githubusercontent.com/GiuseppeFasanella/DataBase_utilities/master/img/output_query.png)

**Cerca "titolo", "periodo", "autore" in questo modo:**

select Libro.title, Libro.posizione_fissa, autore.nome
from Libro,autore,libro_autore 
where Libro.libro_id=libro_autore.libro_id and libro_autore.autore_id=autore.autore_id
and Libro.argomento="Decadentismo";

*Le mie query tipiche: ricerca per titolo/autore/periodo, percio' l'ultima condizione e' una di queste:*

and Libro.title="Maigret prende un granchio";

and Libro.argomento="Decadentismo";

and autore.nome="Simenon";



