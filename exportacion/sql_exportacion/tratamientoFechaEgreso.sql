--MAPEO DE LA FECHA DE EGRESO DEL GRADUADO 
----------------------------------------
--ETL: dsa_fecha_egreso

SELECT * FROM dsa.recien_graduado

SELECT a.nro_documento AS documento 
FROM dsa.graduado_colacion a, dsa.recien_graduado b 
where a.nro_documento = b.nro_doc;

--VERIFICO LOS ALUMNOS QUE NO LE FUERON MAPEADA LA FECHA DE INGRESO
SELECT nro_doc, bi_fecha_egreso FROM dsa.recien_graduado 
