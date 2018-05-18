# oracle_sql_developer

Lo shortcut e' su windows

In alto, sulla sinistra c'e' un "Sql" in verde che crea la connessione con un database (DWHP e' meglio: DWHT e' piu' piccola) 

Nel worksheet scrivi la tua query normalmente, tranne che di fronte al nome della tabella devi mettere

DH_DEN_STAGE

```
select * from DH_DEN_STAGE.f_production_farm_h;
```
Il punto e virgola alla fine serve per delimitare la fine della tua query

se ne scrivi un'altra sotto, sempre e solo l'ultima sara' eseguita

Puo' succedere che la query sia parecchio lunga:

--> per facilitare la lettura, seleziona tutto e vai di "Ctrl+f7" per indentare
