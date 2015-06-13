use Library;
select nome,autore_id
from autore
where nome=@nome;

##Now you can pass nome at run time, throght the wrapper shell script
