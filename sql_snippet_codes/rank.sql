SELECT
    forecastdate,
    valuedate,
    farm_id,
    point,
    model_type,
    model_index,
    direction,
    speed,
    density,
    RANK() OVER(PARTITION BY
        valuedate 
        ORDER BY
            valuedate - forecastdate
    ) AS rnk
FROM
    dh_den_stage.f_meteo_wind_farm_h    
        WHERE
                point != 0
            AND
                provider = 4
            AND
                valuedate >= 20170426000000
            AND
                valuedate <= 20170513235959
            AND
                forecastdate <= 20170510144115
            AND
                model_type = 'DET'
            AND
                farm_id = 247
            AND valuedate - forecastdate >=1000000
    order by valuedate,point
