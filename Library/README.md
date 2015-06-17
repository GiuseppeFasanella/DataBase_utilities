**Per il disegno** vedi [qui] (https://github.com/GiuseppeFasanella/DataBase_utilities/blob/master/Library/db_library.md)

Per lavorarci sopra in comodita', ho interfacciato il db sia in **bash**, sia in **php**

**Interfaccia in php** (comodissima)
Da Browser `localhost/`

**Interfaccia in bash**
* Inserire un nuovo libro nel db

*Titolo Posizione_nella_libreria Autore*

./book_insert.sh "'Amleto'" "'11b'" "'William Shakespeare'"

Nota che per un parsing corretto hai bisogno di passare gli argomenti con i doppi apici " e in piu' l'apice singolo '. L'apice doppio serve per far capire a bash che e' una stringa, l'apice singolo serve per far capire a mySQL che l'argomento passato e' una stringa. (**To do**: aggiungere l'apice in piu' con sed dentro lo script in bash: farlo a mano cosi' e' bruttissimo, oltre che c'ho messo una vita a capirlo)

Nota anche che lo script in bash e' solo un wrapper per settare gli argomenti in mySQL. Tutto il lavoro viene fatto dallo script **book_insert.sql**

* Fare una query tipica

./book_query.sh "'Gabriele D\'Annunzio'" "results.txt"

Come prima: gli argomenti sono passati attraverso lo script in bash, mentre la sintassi sql e' implementata nello script book_query.sql
