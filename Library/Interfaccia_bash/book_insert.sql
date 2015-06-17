use Library;
insert ignore into Libro value(@title,"","",@pos,"",NULL);
insert ignore into autore value(@author,NULL);
insert into libro_autore(libro_id,autore_id) select libro_id, autore_id from Libro join autore where Libro.title=@title and autore.nome=@author;

##Avevo un PROBLEMA GROSSO: se un autore e' presente, fa giustamente errore, ma NON VA AVANTI e si ferma ==> risolto con insert ignore
