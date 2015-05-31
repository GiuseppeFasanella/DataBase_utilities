# Installare mysql server
sudo apt-get install mysql-server

* In questa sede, decidi la passwd di root

* Per avere un controllo grafico sugli account: mysql workbench

* A questo punto mi chiedo: dove sono fisicamente i miei db? : apri `/etc/mysql/my.cnf` e alla voce dirname trovo `/var/lib/mysql/`. Quello e' il path sull'hd.

# Accedere a mysql 
mysql -u root -p

* Nota che la sintassi mysql NON distingue maiuscole/minuscole e che **tutti i comandi devono terminare con `;`**

show databases;

create database mydb;

use mydb;

(Cioe' dici "voglio lavorare su mydb")

select database();

(Stai chiedendo "Su quale db sono?")

drop database if exists mydb;

(Rimuove il db)

La cosa importante del db e' la progettazione (Ho scritto un .md a parte)

![alt tag](https://raw.githubusercontent.com/GiuseppeFasanella/Git_commands/master/images/basso.png)

# Creare le tabelle e popolarle

create table student(
first_name VARCHAR(30) NOT NULL,
email VARCHAR(60) NULL,
state CHAR(2) NOT NULL DEFAULT "PA",
birth_date DATE NOT NULL,
sex ENUM('M','F') NOT NULL,
student_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);

* NOT NULL= non puo' non esserci

* NULL= puo' anche essere vuoto

show tables;

insert into student value
("Giovanni", "mail","M",NULL)

delete from absences
where student_id=6;

# Creare le entita' di raccordo

* Sono tabelle fatte di chiavi, disegnate per gestire le relazioni "molti a molti" (Uno studente fa molti test e un test e' sostenuto da molti studenti)

create table score(
student_id int unsigned not null,
event_id int unsigned not null,
score int not null,
primary key(event_id,student_id));

* Come chiave primaria uso la combinazione event_id, student_id che e' unica

# Guardare al volo il db
show tables;

describe test;

(Decido di ispezionare la tabella test)

rename table absence to absences

# Query

* select vuol dire MOSTRAMI A SCHERMO

* Voglio vedere tutto di una tabella: `select * from students;`

* select first_name, email from students where sex='M';

* select ..... order by last_name;

* `select ..... where first_name like "D%";` (Quando il nome inizia con D)

* `select sex, count(*) from students group by sex;` (Raggruppare l'output)

* `select state, count(state) as "amount" from students group by state having amount > 1;` (Ti puoi sbizzarrire)

# Chiedere info da due tabelle diverse 

* Le 2 tabelle devono "parlarsi" attraverso 1 chiave comune

select students.first_name, tests.date, scores.score from tests scores, students where date='X' and tests.test_id=scores.test_id and students.stud_id=scores.stud_id

# Regole auree per un buon disegno (per ulteriori dettagli c'e' un .md a parte)

Per avere un db veloce (deve navigare O(100.000) entries in O(s))

* Ogni tabella deve descrivere una sola cosa

* Non devono esistere input multipli in un campo, devi trovare un modo per splittare il tutto e rompere le tabelle, per avere un db normalizzato

Per esempio se di uno studente voglio sapere "Past courses" lo devo mettere in un'altra tabella

**DIVIDE ET IMPERA**

 

