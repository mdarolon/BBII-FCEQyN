SELECT DISTINCT fecha, anio, mes, dia FROM
(
SELECT 
 recien_graduado.fecha_fin_enc as fecha, 
 date_part('Y',recien_graduado.fecha_fin_enc) as anio,
 date_part('month',recien_graduado.fecha_fin_enc) as mes,
 date_part('day',recien_graduado.fecha_fin_enc)as dia

FROM 
  dsa.recien_graduado
) temp


SELECT 
  distinct (recien_graduado.bi_fecha_fin_enc),
  
FROM 
  dsa.recien_graduado
  
