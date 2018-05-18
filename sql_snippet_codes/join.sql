--lo spiego passo per passo

--1. hai una tabella che e' il risultato di una certa query --> chiamala PIPPO1
--> sarebbe questo pezzo qui
    (select valuedate, hour, quarter, macro_zone, imbalance_mhw
    from F_Terna_Segno_Zonale_Quarterly
    where macro_zone = 'NORD') PIPPO1
    
--2. hai una seconda tabella che e' il risultato di una certa query --> chiamala PIPPO2
--> sarebbe questo pezzo qui
    (select valuedate, hour, quarter, macro_zone, imbalance_mhw
    from F_Terna_Segno_Zonale_Quarterly
    where macro_zone = 'SUD') PIPPO2
    
-->3. ora devi decidere come fare il join delle tabelle (vedi link)
-->4. e quale e' il criterio di join on PIPPO1.valuedate=PIPPO2.valuedate and PIPPO1.hour=PIPPO1.hour
select pippo1.valuedate, pippo2.hour, pippo1.imbalance_mhw, pippo2.imbalance_mhw
from 
    (select valuedate, hour, quarter, macro_zone, imbalance_mhw
    from F_Terna_Segno_Zonale_Quarterly
    where macro_zone = 'NORD') PIPPO1
inner join
    (select valuedate, hour, quarter, macro_zone, imbalance_mhw
    from F_Terna_Segno_Zonale_Quarterly
    where macro_zone = 'SUD') PIPPO2 on PIPPO1.valuedate=PIPPO2.valuedate and PIPPO1.hour=PIPPO1.hour; 
