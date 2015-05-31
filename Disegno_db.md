# Come disegnare un db

* L'idea di base e': se un campo, per essere descritto ha bisogno di piu' di un valore

![alt tag](https://raw.githubusercontent.com/GiuseppeFasanella/Git_commands/master/images/basso.png)

deve essere "rotto" in una tabella a parte.


* Se dei valori tornano spesso, conviene fare una tabella con i valori che possono essere assunti, per evitare di scrivere sempre le stesse cose, con il rischio di sbagliare


* Le relazioni multiple ("molti a molti") vanno spezzate.

Esempio: in un db di studenti, uno studente fa molti test e un test e' sostenuto da molti studenti. La soluzione e' sempre quella di spezzare la relazione "molti a molti" in un duplice relazione "uno a molti", creando una "tabella (entita') di raccordo".

Quindi, nel caso specifico, avro' una tabella "studenti", una tabella "test" e una entita' di raccordo "score" che e' di fatto una tabella di chiavi e "connette" l'id dello studente con l'id del test che ha sostenuto.
