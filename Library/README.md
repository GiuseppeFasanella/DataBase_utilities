# Disegnare il database

# Interfacciare mySQL con una script in bash

*Titolo Posizione_nella_libreria Autore*

insert_book.sh "'Amleto'" "'11b'" "'William Shakespeare'"

Nota che per un parsing corretto hai bisogno di passare gli argomenti con i doppi apici " e in piu' l'apice singolo '. L'apice doppio serve per far capire a bash che e' una stringa, l'apice singolo serve per far capire a mySQL che l'argomento passato e' una stringa. (**To do**: aggiungere l'apice in piu' con sed dentro lo script in bash: farlo a mano cosi' e' bruttissimo, oltre che c'ho messo una vita a capirlo)

Nota anche che lo script in bash e' solo un wrapper per settare gli argomenti in mySQL. Tutto il lavoro viene fatto dallo script **book_insert.sql**

