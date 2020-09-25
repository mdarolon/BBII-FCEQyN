-- CREACION DSA: Recien graduado

--DROP TABLE dsa.recien_graduado;
CREATE TABLE dsa.recien_graduado
(
  id serial NOT NULL,
  usuario varchar,
  nro_doc varchar,
  fecha_nac varchar,
  sexo varchar,
  nacionalidad varchar,
  mail varchar,
  estado_civil varchar,
  cant_hijos varchar,
  grupo_conv varchar,
  bi_edad integer,
  titulo varchar,
  anio_ingreso varchar,
  ciudad_res varchar,
  prov_res varchar,
  pais_res varchar,
  ciudad_proc varchar,
  prov_proc varchar,
  pais_proc varchar,
  hab_lectura varchar,
  tipo_lectura varchar,
  otros_hab varchar,
  estudio_padre varchar,
  estudio_madre varchar,
  estudio_pareja varchar,
  cond_actual varchar,
  busca_trab varchar,
  exp_laboral varchar,
  caract_val_empleador varchar,
  otras_capacidades varchar,
  otras_fuentes_lab varchar,
  info_bolsa_trab varchar,
  recibe_remun varchar,
  realiza_aporte_jub varchar,
  tipo_relacion_lab varchar,
  tipo_contratacion varchar,
  cant_hs_semanal varchar,
  satisfecho_trabajo varchar,
  entidad_trabaja varchar,
  mejora_por_titulo varchar,
  razon_no_trabaja varchar,
  sector_pref varchar,
  activ_pref varchar,
  exig_lugar_trabajo varchar,
  motivo_elec_carrera varchar,
  motivo_estud_univer varchar,
  cont_carrera_interes varchar,
  cont_carrera_expec varchar,
  nivel_exigencia_carrera varchar,
  plan_estudio_corto varchar,
  plan_estudio_largo varchar,
  plan_estudio_tecnico varchar,
  plan_estudio_gral varchar,
  opinion_alum varchar,
  opinion_aulas varchar,
  opinion_biblio varchar,
  opinion_lab varchar,
  opinion_admin varchar,
  volver_univer varchar,
  aspectos_univer_aprecia varchar,
  reconom_univer_socie varchar,
  brindar_univer varchar,
  otros_estudios varchar,
  tipo_institucion varchar,
  nombre_carrera varchar,
  finalizo_carrera varchar,
  conoc_ingles varchar,
  conoc_frances varchar,
  conoc_aleman varchar,
  conoc_italiano varchar,
  conoc_portugues varchar,
  conoc_herr_infor varchar,
  seguir_estud varchar,
  que_seguir_estud varchar,
  donde_seguir_estud varchar,
  porque_seguir_estud varchar,
  interes_formac_continua varchar,
  fecha_inicio_enc date,
  fecha_fin_enc date,
  CONSTRAINT pk_recieng PRIMARY KEY (id)
)     

-- CREACION DSA: Carrera

--DROP TABLE dsa.carrera;

CREATE TABLE dsa.carrera
(
  carrera_id serial NOT NULL,
  unidad_academica character varying,
  carrera character varying,
  nombre character varying,
  CONSTRAINT pk_carrera PRIMARY KEY (carrera_id)
)

-- CREACION DSA: Graduado por colacion

--DROP TABLE dsa.graduado_colacion;

CREATE TABLE dsa.graduado_colacion
(
  gradcolacion_id serial NOT NULL,
  nro_inscripcion varchar,
  carrera varchar,
  plan varchar,
  fecha_egreso date,
  colacion integer,
  fecha_ingreso date,
  tipo_documento integer,
  nro_documento varchar, 
  fecha_nacimiento date, 
  CONSTRAINT pk_gradcolacion PRIMARY KEY (gradcolacion_id)
)


--DROP TABLE dsa.localidad;

CREATE TABLE dsa.localidad
(
  loc_id integer NOT NULL,
  nom_loc varchar,
  nom_dpto varchar,
  nom_prov varchar,
  nom_pais varchar,
  CONSTRAINT pk_localidad PRIMARY KEY (loc_id)
)

--1- SELECCION
-- Crearle a la tabla resultados un PK para poder manipular los datos

alter table dsa.resultados
add primary key (resul_id);

--Se actualizo el ano de ingreso (OPCION 1)
--Se actualizo el ano de ingreso del dni 34735550 a 2012 (tenia cargado 2009-2012)
UPDATE dsa.resultados SET "Anio de Ingreso" = '2012'
where "Número de documento" = '34735550';
--
-- Extraer el ANIO DE INGRESO del sistema SIU-Guarani (OPCION 2)

--Se actualizo el Titulo (OPCION 1)
--Se actualizo el titulo del dni 34735550 a la carrera relacionada con la encuesta (tenia cargado LG-PB)
UPDATE dsa.resultados SET "Título"='Profesora en Biologia'
where "Número de documento" = '34735550';
---
-- Extraer la CARRERA del sistema SIU-Guarani (OPCION 2)

--Se actualizo la fecha de nacimiento (OPCION 1)
UPDATE dsa.recien_graduado SET fecha_nac='02/08/1995' where nro_doc = '39045630';
UPDATE dsa.recien_graduado SET fecha_nac='29/04/1995' where nro_doc = '38874115';
UPDATE dsa.recien_graduado SET fecha_nac='29/04/1995' where nro_doc = '38874115';
---
-- Extraer la fecha de nacimiento del sistema SIU-Guarani (OPCION 2)

--calculos aux
select * from dsa.resultados where "Número de documento" = '34735550';

select "Usuario", "Fecha de nacimiento", edad from dsa.resultados
where "Usuario" = '36923428'


--2- Limpieza de Datos: La idea es NO hacer esta etapa. Como solucion 
--se propone integracion con SIU Guarani
select date_part('Y',"Fecha de nacimiento"::date) from resultados'

--3- Transformacion

create or replace function dsa.f_edad (date)
RETURNS integer AS
$BODY$
DECLARE edad Integer;

BEGIN
    edad := date_part('Y',now()) - date_part('Y',$1::date);
    RETURN edad;
END;
$BODY$
LANGUAGE plpgsql VOLATILE

--Setear las edades en la tabla recien_graduado
UPDATE dsa.recien_graduado SET bi_edad =
date_part('Y',now()) - date_part('Y',bi_fecha_nac::date)


