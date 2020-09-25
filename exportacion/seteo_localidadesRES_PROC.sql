INSERT INTO dsa.localidad VALUES ('50998998', 'Indeterminada','Indeterminada','Indeterminada','Haiti', '50998998', '50998', '509')
INSERT INTO dsa.localidad VALUES ('6198998', 'Indeterminada','Indeterminada','Indeterminada','Australia', '6198998', '61988', '61')
INSERT INTO dsa.localidad VALUES ('341142', 'Sant Cugat del Vallès','Barcelona','Catalunya','España', '3435248', '3435', '34')

SELECT * from dsa.localidad where 
TRANSLATE(UPPER(TRIM(nom_pais)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%ESPAÑA%'
TRANSLATE(UPPER(TRIM(nom_LOC)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CABARET%'
AND 

TRANSLATE(UPPER(TRIM(nom_dpto)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%CAPITAL FEDERAL%'
ORDER BY NOM_LOC;


SELECT * from dsa.localidad where TRANSLATE(UPPER(TRIM(nom_PAIS)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%PARAGUAY%'
ORDER BY NOM_LOC
AND TRANSLATE(UPPER(TRIM(nom_PROV)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%PARANA%';

select usuario, bi_loc_PROC, ciudad_proc, prov_proc, pais_proc from dsa.recien_graduado where bi_loc_PROC = '0'
ORDER BY ciudad_proc;
select bi_loc_res, ciudad_res, prov_res, pais_res from dsa.recien_graduado where bi_loc_res = '0'
ORDER BY bi_loc_res;

select * from dsa.recien_graduado
WHERE CIUDAD_PROC = 'Bernardo de Irigoyen '

select * from dsa.recien_graduado
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%Bernardo de Irigoyen %'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' ;


--BERNARDO DE YRIGOYEN (MISIONES)
UPDATE dsa.recien_graduado SET bi_loc_proc = '4414' 
WHERE TRANSLATE(UPPER(TRIM(ciudad_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%BERNARDO DE YRIGOYEN %'
AND TRANSLATE(UPPER(TRIM(prov_proc)),'áéíóúÁÉÍÓÚ' ,'aeiouAEIOU') LIKE '%MISIONES%' ;

UPDATE dsa.recien_graduado SET bi_loc_proc = '4414' 
WHERE CIUDAD_PROC = 'Bernardo de Irigoyen '
