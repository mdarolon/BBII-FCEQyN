--PARA GUARDAR ASI COMO ESTA EN FT 
--select nro_doc,bi_fecha_nac, dsa.f_edad(bi_fecha_nac) as edad from dsa.recien_graduado


--Creo la funcion que carga mi dimension d_redad

--DROP FUNCTION dsa.spc_dim_edad(integer, integer);

CREATE OR REPLACE FUNCTION dsa.spc_dim_edad(pdesde integer, phasta integer)
  RETURNS void AS
$BODY$
DECLARE
i int;
BEGIN
for  i in pdesde..phasta
loop
     INSERT INTO dsa.d_redad (edad) VALUES(i);
end loop;
update dsa.d_redad set rango_edad = 'Menor a 16' where edad <= 16;
update dsa.d_redad set rango_edad = '17 a 20' where edad between 17 and 20;
update dsa.d_redad set rango_edad = '21 a 24' where edad between 21 and 24;
update dsa.d_redad set rango_edad = '25 a 29' where edad between 25 and 29;
update dsa.d_redad set rango_edad = '30 a 34' where edad between 30 and 34;
update dsa.d_redad set rango_edad = '35 a 39' where edad between 35 and 39;
update dsa.d_redad set rango_edad = '40 a 49' where edad between 40 and 49;
update dsa.d_redad set rango_edad = '50 a 59' where edad between 50 and 59;
update dsa.d_redad set rango_edad = 'Mayor a 60' where edad >= 60;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

  -- PARA PROBAR EL FUNCIONAMIENTO
--truncate table dsa.d_redad;
--select dsa.spc_dim_edad(1,100)
--SELECT * FROM dsa.d_redad order by 1


