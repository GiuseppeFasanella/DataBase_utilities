use Library;
select nome,autore_id
from autore
where nome=@nome;
