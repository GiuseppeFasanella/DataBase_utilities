select * from (
select valuedate, value_50,pcs_index from DH_DEN_STAGE.F_METEO_PCS_H where var_index=3
)
PIVOT
(MIN(value_50) FOR PCS_INDEX IN (0 AS value50_0, 1 AS value50_1, 2 AS value50_2))
ORDER BY VALUEDATE DESC

per spiegarti questa query partiamo dal pezzo centrale

select valuedate, value_50,pcs_index from DH_DEN_STAGE.F_METEO_PCS_H where var_index=3

che seleziona quello che mi serve dalla tabella METEO_PCS_H

ora pero' la tabella scritta cosi' non mi piace, perche' ho:

valuedate  value50 pcs_index==0
valuedate  value50 pcs_index==1
valuedate  value50 pcs_index==2

e non mi piace: io voglio

valuedate value50_per_pcs1 value50_per_pcs2 value50_per_pcs3 e cosi' via e quindi pivoto

La logica del pivoting funziona cosi':
MIN o MAX(value_50) deve essere una funzione per forza....
poi se pcs_index e' 0 allora chiamalo value50_0, se pcs_index e' 1 chiamalo value50_1 e cosi' via





