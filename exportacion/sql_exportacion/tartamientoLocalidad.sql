--LOCALIDADES DEL CATALOGO UNIFICADO
SELECT * FROM dsa.localidad 
WHERE TRANSLATE(UPPER(TRIM(nom_loc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') 
LIKE '%INDETER%' AND TRANSLATE(UPPER(TRIM(nom_dpto)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') 
LIKE '%INDETER%'AND TRANSLATE(UPPER(TRIM(nom_prov)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') 
LIKE '%INDETER%'
order by nom_pais

-----------------------------------------
-- MAPEO DE LOCALIDADES DE PROCEDENCIA--
-----------------------------------------
-- RANKING DE LOCALIDADES DE PROCEDENCIA EN LA ENCUESTA
SELECT TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU'), 
UPPER(TRIM(prov_proc)),UPPER(TRIM(pais_proc)), count(*) 
FROM dsa.recien_graduado
GROUP BY 1, 2, 3
ORDER BY 4 DESC 

-- VERIFICACION DE LOCALIDAD QUE NO HAN SIDO MAPEADAS 
SELECT ciudad_proc, bi_loc_proc FROM dsa.recien_graduado
WHERE bi_loc_proc IS NULL

-- SELECCION DE LOCALIDADES SEMEJANTES USANDO LIKE 
SELECT ciudad_proc FROM dsa.recien_graduado
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%SALTA%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 

-- MAPEO DE LOCALIDADES DE PROCEDENCIA
--QUITILIPI (CHACO)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '5415' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%QUITILIPI%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CHACO%' 
ROLLBACK;		COMMIT;

--CONCEPCION DE LA SIERRA (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4297' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CONCEPCION%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;


--CLORINDA (FORMOSA)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '5785' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CLORINDA%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%FORMOSA%' 
ROLLBACK;		COMMIT;

--SAN JAVIER (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4321' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%SAN JAVIER%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;


--HOHENAU
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '50131' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%HOHENAU%'
ROLLBACK;		COMMIT;

--PUERTO BELGRANO (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '5454049' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%BELGRANO%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--LA MATANZA (BS)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '5406427' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%LA MATANZA%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%BUENOS AIRES%' 
ROLLBACK;		COMMIT;

--GARUHAPE
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4142' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%GARUHAPE%'
ROLLBACK;		COMMIT;

--VILLA MADERO (BS)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '618' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MADERO%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%BUENOS AIRES%' 
ROLLBACK;		COMMIT;

--25 DE MAYO (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4383' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%25 DE MAYO%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--MENDOZA (MENDOZA)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '13208' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MENDOZA%'
--AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MENDOZA%' 
ROLLBACK;		COMMIT;

--VILLA SANTA ROSA (CORDOBA)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '10745' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%VILLA SANTA ROSA%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CORDOBA%' 
ROLLBACK;		COMMIT;

--COMANDANTE ANDRESITO (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4415' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%COMANDANTE ANDRESITO%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--LA PLATA (BA)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '1121' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%LA PLATA%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%BUENOS AIRES%' 
ROLLBACK;		COMMIT;

--ARROYITO (CORDOBA)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '1779' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%ARROYITO%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CORDOBA%' 
ROLLBACK;		COMMIT;

--CHIMBAS (SAN JUAN)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '12775' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CHIMBAS%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%SAN JUAN%' 
ROLLBACK;		COMMIT;

--CONCEPCION DEL URUGUAY (ER)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '3742' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CONCEPCION DEL URUGUAY%'
ROLLBACK;		COMMIT;

--CAMPO VIERA (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4372' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%VIERA%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--COLONIA AURORA
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4385' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%AURORA%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--SALTA (SALTA)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '8882' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%SALTA%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%SALTA%' 
ROLLBACK;		COMMIT;

--CAPIOVI (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4130' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CAPIOVI%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--GARUPA
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '3971' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%GARUPA%'
ROLLBACK;		COMMIT;

--ARISTOBULO DEL VALLE
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4394' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%VALLE%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--JARDIN AMERICA (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4122' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%JARDIN AMERICA%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--GOBERNADOR ROCA
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4098' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%ROCA%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--MONTECARLO (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4460' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MONTECARLO%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--LEANDRO N. ALEM (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4035' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%ALEM%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--ELDORADO (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4441' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%DORADO%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--PUERTO RICO (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4147' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%PUERTO RICO%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--APOSTOLES
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4259' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%OSTOLE%'
ROLLBACK;		COMMIT;

--POSADAS
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '3905' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%OSADA%'
ROLLBACK;		COMMIT;

--OBERA
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_proc = '4338' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%OBERA%'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;



-----------------------------------------
-- MAPEO DE LOCALIDADES DE RESIDENCIA--
-----------------------------------------
-- RANKING DE LOCALIDADES DE RESIDENCIA EN LA ENCUESTA
SELECT TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU'), 
UPPER(TRIM(prov_res)),UPPER(TRIM(pais_res)), count(*) 
FROM dsa.recien_graduado
GROUP BY 1, 2, 3
ORDER BY 4 DESC 

-- VERIFICACION DE LOCALIDAD QUE NO HAN SIDO MAPEADAS 
SELECT ciudad_res, bi_loc_res FROM dsa.recien_graduado
WHERE bi_loc_res IS NULL

-- SELECCION DE LOCALIDADES SEMEJANTES USANDO LIKE 
SELECT ciudad_res, prov_res, bi_loc_res FROM dsa.recien_graduado
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%ALICIA%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 

-- MAPEO DE LOCALIDADES DE RESIDENCIA

--MENDOZA (MENDOZA)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '13208' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MENDOZA%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MENDOZA%' 
ROLLBACK;		COMMIT;

--SANT CUGAT DEL VALLÈS (BARCELONA)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '341142' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CUGAT%'
ROLLBACK;		COMMIT;

--JARDIN AMERICA (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '4122' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%JARDIN AMERICA%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--CAPIOVI (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '4130' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CAPIOVI%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--SAN PEDRO (BUENOS AIRES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '2446' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%SAN PEDRO%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%BUENOS AIRES%' 
ROLLBACK;		COMMIT;

--GEELONG (AUSTRALIA)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '6198998' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%GEELONG%'
AND TRANSLATE(UPPER(TRIM(pais_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%AUSTRALIA%' 
ROLLBACK;		COMMIT;

--ITUZAINGO (CORRIENTES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '3930' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%ITUZAINGO%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CORRIENTES%' 
ROLLBACK;		COMMIT;

--COLONIA ALICIA (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '4384' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%ALICIA%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--CALETA OLIVIA (SANTA CRUZ)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '18559' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CALETA OLIVIA%'
ROLLBACK;		COMMIT;

--CORDOBA 
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '2056' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CORDOBA%'
ROLLBACK;		COMMIT;

--CONCEPCION DEL URUGUAY (ER)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '3742' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CONCEPCION DEL URUGUAY%'
ROLLBACK;		COMMIT;

--PUERTO ESPERANZA (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '4435' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%PUERTO ESPERANZA%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--SAN JAVIER (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '4321' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%SAN JAVIER%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--DON TORCUATO
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '2' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%DON TORCUATO%'
ROLLBACK;		COMMIT;

--HOHENAU
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '50131' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%HOHENAU%'
ROLLBACK;		COMMIT;

--SAN SALVADOR DE JUJUY
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '9716' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%JUJUY%'
ROLLBACK;		COMMIT;

--ARISTOBULO DEL VALLE
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '4394' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%VALLE%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--PUERTO IGUAZU
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '4424' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%IGUA%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--COLONIA AURORA
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '4385' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%AURORA%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--CONCEPCION DE LA SIERRA (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '4297' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CONCEPCION%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--GOBERNADOR ROCA
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '4098' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%ROCA%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--LEANDRO N. ALEM (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '4035' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%ALEM%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--PUERTO RICO (MISIONES)
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '4147' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%PUERTO RICO%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--OBERA
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '4338' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%OBERA%'
AND TRANSLATE(UPPER(TRIM(prov_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' 
ROLLBACK;		COMMIT;

--POSADAS
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '3905' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%OSADA%'
ROLLBACK;		COMMIT;

--APOSTOLES
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '4259' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%OSTOLE%'
ROLLBACK;		COMMIT;

--GARUPA
BEGIN;
UPDATE dsa.recien_graduado SET bi_loc_res = '3971' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_res)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%GARUPA%'
ROLLBACK;		COMMIT;
 


SELECT up(ciudad_res), count(*) FROM dsa.recien_graduado 
WHERE ciudad_res LIKE '%adas%'
OR ciudad_res LIKE '%posa%'
OR ciudad_res LIKE '%POSA%'
GROUP BY ciudad_res
ORDER BY 2 DESC
