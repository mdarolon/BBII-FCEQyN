--MAPEO DE LA FECHA DE INGRESO DEL GRADUADO 
----------------------------------------
--ETL: dsa_fecha_ingreso

SELECT * FROM dsa.recien_graduado

SELECT a.fecha_ingreso AS fecha_ingreso, a.nro_documento AS documento 
FROM dsa.graduado_colacion a, dsa.recien_graduado b 
where a.nro_documento = b.nro_doc;

--VERIFICO LOS ALUMNOS QUE NO LE FUERON MAPEADA LA FECHA DE INGRESO
SELECT nro_doc, anio_ingreso, bi_fecha_ingreso FROM dsa.recien_graduado 
