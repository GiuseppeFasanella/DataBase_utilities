--supponiamo di voler fare una query che ritorna la max forecastdate
select max(forecastdate) from dh_den_stage.f_production_farm_h_experiment where farm_id=247 and model_type='DUF_BDT_blend' and provider=51

--ora il risultato di questa query mi serve come input di una query piu' grande
select *
from vattalapesca_table
where forecastdate = (RISULTATO DELLA QUERY PRECENDENTE);

--Quindi, in sintesi farai cosi' --purtroppo funzioni non se ne possono fare (o io non so come farle):
select *
from vattalapesca_table
where forecastdate = (select max(forecastdate) from dh_den_stage.f_production_farm_h_experiment where farm_id=247 and model_type='DUF_BDT_blend' and provider=51)
