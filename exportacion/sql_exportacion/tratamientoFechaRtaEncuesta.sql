--PARA ACTUALIZAR EN LA TABLA recien_graduados
-- Usado en dsa_fecha_rta_encuesta. Mapea el nuevo formato de fecha
---------------------------------------------
SELECT nro_doc AS documento, 
extract(YEAR from fecha_fin_enc)::text || '-' || extract(MONTH from fecha_fin_enc)::text AS aniomes
FROM dsa.recien_graduado;

--consultas extras
select  extract(YEAR from fecha_fin_enc) from dsa.recien_graduado;
select  extract(MONTH from fecha_fin_enc) from dsa.recien_graduado;


select fecha_fin_enc AS fecha,
 extract(YEAR from fecha_fin_enc) AS anio,
 extract(MONTH from fecha_fin_enc)AS mes,
 extract(YEAR from fecha_fin_enc)::text || '-' || extract(MONTH from fecha_fin_enc)::text AS aniomes
  from dsa.recien_graduado;


