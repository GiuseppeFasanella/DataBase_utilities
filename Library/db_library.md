# Come implementare un db di libri
**Il disegno e' questo**

![alt tag](https://raw.githubusercontent.com/GiuseppeFasanella/DataBase_utilities/master/img/libri_db.png)

**Fatto il disegno, puoi creare le tabelle e popolarle**

```
## Creare il database
sudo apt-get install mysql-server
mysql -u root -p
CREATE DATABASE Library;
USE Library;
```


* create table Libro(title VARCHAR(30) NOT NULL, periodo VARCHAR(20) NULL, argomento VARCHAR(20) NULL, posizione_fissa VARCHAR(20) NOT NULL, posizione_temp VARCHAR(20) NULL, libro_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);

* alter table Libro add constraint unique_title unique(title); **in questo modo ti proteggi dall'inserire due volte lo stesso libro.**

*Vero e' che puoi avere due edizioni dello stesso libro ma, in quel caso, puoi modificare il constraint e dire unique(title,edizione). Oppure, meno elegante ma altrettanto efficace nel mio caso chiamero' il doppione "Maigret prende un granchio (ed. Adelphi)"*

* create table autore(nome VARCHAR(60) NOT NULL, autore_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);

* alter table autore add constraint unique_name unique(nome); **in questo modo ti proteggi dall'inserire due volte lo stesso autore**

* create table libro_autore(libro_id int unsigned not null, autore_id int unsigned not null, primary key(libro_id,autore_id));

* insert into Libro value("Maigret prende un granchio","","","11a","",NULL);

* insert into autore value("George Simenon",NULL); #mySQL e' case INsensitive per le stringhe

* insert into libro_autore(libro_id,autore_id) select libro_id, autore_id from Libro join autore where Libro.title="Maigret prende un granchio" and autore.nome="George Simenon"; 

**Con "insert select" eviti di scrivere una cosa del genere**

* insert into libro_autore value(X,Y); 

*Che risulta debolissima perche' devi sapere che X e' "Maigret prende un granchio" e Y e' Simenon.*

* Se poi volessi sapere l'id di un libro e l'id del suo autore, li chiedo cosi':

select nome,autore_id from autore where nome="Gabriele D'Annunzio";

select title, libro_id from Libro where title="Il trionfo della morte";


**Le mie query solite**

**In mySQL il confronto tra stringhe e' case INSENSITIVE**

* select * from autore where nome="george simenon"; *funziona benissmo*

**Ricerca per pattern**

* `%` richiede il match con un numero arbitrario di caratteri (anche 0) e si usa in combinazione con `like`

* `_` richiede il match con esattemente 1 carattere (anche lui da usare in combinazione con `like`

* select * from autore where nome like "%simenon";

*oppure anche cosi' (se non ricordi se il nome l'hai scritto prima o dopo il nome)*

* select * from autore where nome like "%simenon%";

**Tutto questo casino io l'ho fatto perche' voglio la risposta alla domanda "Dove si trova questo libro?":** il concetto cardine e' quello di fare un controllo incrociato delle chiavi

select Libro.title, Libro.posizione_fissa, autore.nome from Libro,autore,libro_autore where Libro.libro_id=libro_autore.libro_id and libro_autore.autore_id=autore.autore_id;

![alt tag](https://raw.githubusercontent.com/GiuseppeFasanella/DataBase_utilities/master/img/output_query.png)

**Cerca per "titolo", "periodo", "autore" e dimmi dove si trovano i miei libri**

*L'ultima condizione e' una di quelle proposte a seconda dei casi (o una loro combinazione)*

select Libro.title, Libro.posizione_fissa, autore.nome
from Libro,autore,libro_autore 
where Libro.libro_id=libro_autore.libro_id and libro_autore.autore_id=autore.autore_id
and Libro.argomento="Decadentismo";

*oppure*

and Libro.title="Maigret prende un granchio";

*oppure*

and Libro.title like "maigret prende un granchio%"; *% alla fine se pensi di poter avere piu' edizioni (ti ricordo che le query su stringhe sono case INsensitive) *

*oppure*

and Libro.argomento="Decadentismo";

*oppure ancora*

and autore.nome like "%Simenon";




