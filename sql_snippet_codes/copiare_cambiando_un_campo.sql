insert into f_meteo_wind_farm_h_experiment (provider, inserttime, forecastdate, valuedate, farm_id, point, model_type, model_index, direction, speed, density, pressure, temperature)
select 99 as provider, inserttime, forecastdate, valuedate, farm_id, point, model_type, model_index, direction, speed, density, pressure, temperature from f_meteo_wind_farm_h_experiment where provider=19
