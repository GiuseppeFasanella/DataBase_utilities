* Vedi anche [HTML] (https://github.com/GiuseppeFasanella/html_snippets_codes)
* Vedi anche [PHP] (https://github.com/GiuseppeFasanella/PHP/tree/master)

# Esistono 2 soluzioni, a seconda dei gusti:

**La soluzione piu' comune e' usare PHPMYADMIN** che e' un tool in cui l'interfaccia e' gia' implementata.

Quindi, poche chiacchiere:

* sudo apt-get install libapache2-mod-auth-mysql php5-mysql phpmyadmin

Ti chiede la passwd di root di mysql e di creare una passwd di phpmyadmin
* A questo punto creo un link simbolico

sudo ln -s /usr/share/phpmyadmin /var/www/phpmyadmin

* Fatto questo, da browser puoi lanciare `localhost/phpmyadmin

e si apre una pagine web all'interno della quale hai accesso grafico ai tuoi db

* Nota: se dovesse darti qualche errore. riavvia il server apache2 e vedrai che funziona: 
* sudo /etc/init/d/apache2 start (oppure stop, oppure restart)

**La soluzione piu' artigianale, che quasi preferisco e' interfacciare mysql con php a mano**

Bastano **4 passaggi**:

* 1) Attraverso l'estensione mysqli_connect del php ci si puo' agganciare ai db

In /var/www/My_db/mysqli_connect.php metti lo script di aggancio. In futuro, va messo **fuori** da www per sicurezza. Percio' da browser `localhost/My_db/mysqlt_connect.php` e ti agganci al tuo db

* 2) Fai una query da browser

`localhost/My_db/getstudentinfo.php` (Si connette al db e stampa a schermo il risultato della query)

Nota: se uno script ti da' problemi, e' utile fare il test di "cosa vede il server"

* php file.php > file.html (questo processa il php e lo converte in html. Se qualcosa va storto ti dice la riga che da' problemi e perche')

* 3) Aggiungere una entry nel db:

`localhost/My_db/addstudent.php` (A schermo c'e' un form da riempire. Premendo `Send` verra' invocato lo script 4)

* 4) `localhost/My_db/studentadded.php` che si connette ad db e inserisce una nuova entry.





