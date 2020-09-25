
--MAPEO DE LA CARRERA EN QUE SE GRADUO EL ALUMNO 
----------------------------------------
--ETL: dsa_carrera_graduado

SELECT * FROM dsa.recien_graduado

SELECT a.carrera AS carrera FROM dsa.graduado_colacion a, dsa.recien_graduado b 
where a.nro_documento = b.nro_doc

--VERIFICO LOS ALUMNOS QUE NO LE FUERON MAPEADA UNA CARRERA
SELECT nro_doc, titulo, bi_carrera FROM dsa.recien_graduado 

--CASOS CORREGIDOS DE DNI MAL CARGADOS:
--DNI = 39220527
--DNI = 34034409
--DNI = 20629386
--DNI = 30362464
--DNI = 39220791
--USUARIO dodonalisio SIN DNI ?? 33227508 OK
--USUARIO fgregori SIN DNI ?? 25560026 OK