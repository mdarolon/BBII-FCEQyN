
--MAPEO DE LA FECHA DE NACIMIENTO DEL GRADUADO 
----------------------------------------
--ETL: dsa_carrera_graduado

SELECT * FROM dsa.recien_graduado

SELECT a.fecha_nacimiento AS fechanac, a.nro_documento AS documento 
FROM dsa.graduado_colacion a, dsa.recien_graduado b 
where a.nro_documento = b.nro_doc;

--VERIFICO LOS ALUMNOS QUE NO LE FUERON MAPEADA UNA CARRERA
SELECT nro_doc, fecha_nac, bi_fecha_nac FROM dsa.recien_graduado 

--CASOS CORREGIDOS...
