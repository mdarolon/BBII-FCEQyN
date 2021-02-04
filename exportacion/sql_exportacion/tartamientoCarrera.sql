
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

--CARRERAS QUITADAS Y/O CAMBIADO SU CODIGO
--QUITADA - 600	LICENCIATURA EN SISTEMAS DE INFORMACION (Cod. correspondiente 110)
DELETE FROM dsa.carrera WHERE carrera_id = '600';

--QUITADA - 601	LICENCIATURA EN ANALISIS QUIMICOS Y BROMATOLOGICOS (Cod. correspondiente 108)
DELETE FROM d_carrera WHERE carrera_id = '601';

--ACTUALIZADA - 112	PROFESORADO UNIVERSITARIO EN COMPUTACION (Cod. correspondiente 800)
UPDATE dsa.carrera SET carrera_id = '800' WHERE carrera_id = '112' AND nom_largo = 'PROFESORADO UNIVERSITARIO EN COMPUTACION';


--ACTUALIZACION NOMBRES CORTOS CARRERAS

﻿select * from dsa.recien_graduado where bi_carrera = '600';

UPDATE dsa.carrera SET nombre = 'EspMicroCli' WHERE carrera_id = '113';
UPDATE d_carrera SET nom_carrera = 'EspMicroCli' WHERE carrera_id = '113';

update dsa.carrera set nombre = 'MSPyET' where carrera_id = '117';
update d_carrera set nom_carrera = 'MSPyET' where carrera_id = '117';

update dsa.carrera set nombre = 'EspBioqCli' where carrera_id = '116';
update d_carrera set nom_carrera = 'EspBioqCli' where carrera_id = '116';

update d_carrera set nom_carrera = 'LG' where carrera_id = '147';
update d_carrera set nom_carrera = 'IQ' where carrera_id = '101';
update d_carrera set nom_carrera = 'LQI' where carrera_id = '103';
update d_carrera set nom_carrera = 'TUCyP' where carrera_id = '105';
update d_carrera set nom_carrera = 'FA' where carrera_id = '104';
update d_carrera set nom_carrera = 'PF' where carrera_id = '170';
update d_carrera set nom_carrera = 'PM' where carrera_id = '172';
update d_carrera set nom_carrera = 'IA' where carrera_id = '106';
update d_carrera set nom_carrera = 'AQ' where carrera_id = '107';
update d_carrera set nom_carrera = 'PB' where carrera_id = '143';
update d_carrera set nom_carrera = 'ASC' where carrera_id = '109';
update d_carrera set nom_carrera = 'LSI' where carrera_id = '110';
update d_carrera set nom_carrera = 'LAQyB' where carrera_id = '108';
update d_carrera set nom_carrera = 'MGA' where carrera_id = '111';
update d_carrera set nom_carrera = 'TUTI' where carrera_id = '112';
update d_carrera set nom_carrera = 'MTA' where carrera_id = '114';
update d_carrera set nom_carrera = 'MaeMateAplic' where carrera_id = '115';
update d_carrera set nom_carrera = 'MTI' where carrera_id = '118';
update d_carrera set nom_carrera = 'MCyTMF' where carrera_id = '119';
update d_carrera set nom_carrera = 'EspQcaClinica' where carrera_id = '127';
update d_carrera set nom_carrera = 'PUB' where carrera_id = '142';
update d_carrera set nom_carrera = 'MCMCyP' where carrera_id = '314';
update d_carrera set nom_carrera = 'MTMCyP' where carrera_id = '315';
update d_carrera set nom_carrera = 'EspCyP' where carrera_id = '505';
update d_carrera set nom_carrera = 'LAQyB' where carrera_id = '601';
update d_carrera set nom_carrera = 'PUC' where carrera_id = '800';
update d_carrera set nom_carrera = 'DCA' where carrera_id = '901';
update d_carrera set nom_carrera = 'DF' where carrera_id = '902';

