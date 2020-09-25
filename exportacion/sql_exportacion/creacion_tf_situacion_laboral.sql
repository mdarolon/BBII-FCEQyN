--CREACION DE LA TABLA DE HECHOS: ft_situacion_laboral
--DSA

--Creo una VISTA con los datos que contendra mi TABLA DE HECHOS

DROP VIEW dsa.vw_situacion_laboral;

CREATE VIEW dsa.vw_situacion_laboral AS 
 SELECT recien_graduado.bi_loc_res, recien_graduado.bi_carrera, 
    recien_graduado.fecha_fin_enc, recien_graduado.bi_cond_actual, 
    recien_graduado.bi_cant_hs_sem, recien_graduado.nro_doc,
    recien_graduado.bi_sexo, recien_graduado.bi_estado_civil, recien_graduado.bi_grupo_conv,
    recien_graduado.bi_fecha_nac, dsa.f_edad(bi_fecha_nac) as edad,
    recien_graduado.bi_satisf_trabajo, recien_graduado.bi_entidad_trabaja,
    recien_graduado.bi_loc_proc
   FROM dsa.recien_graduado;
--select * from dsa.vw_situacion_laboral;


--Creo la tabla de hechos en mi dsa dsa.ft_situacion_laboral

DROP TABLE dsa.ft_situacion_laboral;

CREATE TABLE dsa.ft_situacion_laboral
(
  bi_loc_res character varying,
  bi_carrera character varying,
  fecha_fin_enc character varying,
  bi_cond_actual character varying,
  bi_cant_hs_sem character varying,
  nro_doc character varying,
  bi_sexo character varying,
  bi_estado_civil character varying,
  bi_grupo_conv character varying,
  bi_fecha_nac character varying,
  edad integer,
  bi_satisf_trabajo character varying,
  bi_entidad_trabaja character varying,
  bi_loc_proc character varying
  )

--Inserto el contenido de la VISTA en la tabla de hechos creada 
DELETE FROM dsa.ft_situacion_laboral;
INSERT INTO dsa.ft_situacion_laboral
SELECT 
  recien_graduado.bi_loc_res, 
  recien_graduado.bi_carrera, 
  recien_graduado.fecha_fin_enc, 
  recien_graduado.bi_cond_actual, 
  recien_graduado.bi_cant_hs_sem, 
  recien_graduado.nro_doc,
  recien_graduado.bi_sexo,
  recien_graduado.bi_estado_civil,
  recien_graduado.bi_grupo_conv,
  recien_graduado.bi_fecha_nac,
  dsa.f_edad(recien_graduado.bi_fecha_nac) as edad,
  recien_graduado.bi_satisf_trabajo, 
  recien_graduado.bi_entidad_trabaja,
  recien_graduado.bi_loc_proc
FROM 
  dsa.recien_graduado;


--Creo la tabla de hechos en mi esquema PUBLIC ft_situacion_laboral

DROP TABLE ft_situacion_laboral;

CREATE TABLE ft_situacion_laboral
(
  ciudadres_id integer,
  carrera_id integer NOT NULL,
  sit_lab_id integer,
  cant_hs_sem_id integer,
  nro_doc character varying NOT NULL,
  tiempo_id date,
  sexo_id integer,
  estadocivil_id integer,
  grupoconv_id integer,
  bi_fecha_nac date,
  edad integer,
  satisf_trabajo_id integer,
  entidad_id integer,
  ciudadproc_id integer
  
)