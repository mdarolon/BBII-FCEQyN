--CREACION DE LA TABLA DE HECHOS: ft_valoracion_academica
--DSA

--Creo una VISTA con los datos que contendra mi TABLA DE HECHOS

DROP VIEW dsa.vw_valoracion_academica;

CREATE VIEW dsa.vw_valoracion_academica AS 
 SELECT recien_graduado.bi_plan_tecnico, 
	recien_graduado.bi_interes_cont, 
	recien_graduado.fecha_fin_enc, 
	recien_graduado.bi_aporte_univ, 
	recien_graduado.bi_carrera, 
	recien_graduado.nro_doc,
	recien_graduado.bi_sexo,
	recien_graduado.bi_nivel_exig, 
	recien_graduado.bi_selec_univer,
	recien_graduado.bi_selec_car,
	recien_graduado.bi_valor_univ,	
	recien_graduado.bi_expec_cont,
	recien_graduado.bi_plan_corto,
	recien_graduado.bi_plan_gen,
	recien_graduado.bi_univ_socie,
	--date_part('year',age(bi_fecha_egreso, bi_fecha_ingreso)) AS duracion_real,
	dsa.spc_datediff('year', date(bi_fecha_ingreso),date(bi_fecha_egreso)) AS duracion_real,
	recien_graduado.bi_duracion_teorica
   FROM dsa.recien_graduado;

--select * from dsa.vw_valoracion_academica;


--Creo la tabla de hechos en mi dsa dsa.ft_valoracion_academica

DROP TABLE dsa.ft_valoracion_academica;

CREATE TABLE dsa.ft_valoracion_academica
(
  bi_plan_tecnico character varying, 
  bi_interes_cont character varying, 
  fecha_fin_enc character varying,
  bi_aporte_univ character varying, 
  bi_carrera character varying,
  nro_doc character varying,
  bi_sexo character varying,
  bi_nivel_exig character varying, 
  bi_selec_univer character varying,
  bi_selec_car character varying,
  bi_valor_univ character varying,	
  bi_expec_cont character varying,
  bi_plan_corto character varying,
  bi_plan_gen character varying,
  bi_univ_socie character varying,
  duracion_real character varying,
  bi_duracion_teorica integer
  )

--Inserto el contenido de la VISTA en la tabla de hechos creada 
DELETE FROM dsa.ft_valoracion_academica;
INSERT INTO dsa.ft_valoracion_academica
SELECT recien_graduado.bi_plan_tecnico, 
	recien_graduado.bi_interes_cont, 
	recien_graduado.fecha_fin_enc, 
	recien_graduado.bi_aporte_univ, 
	recien_graduado.bi_carrera, 
	recien_graduado.nro_doc,
	recien_graduado.bi_sexo,
	recien_graduado.bi_nivel_exig, 
	recien_graduado.bi_selec_univer,
	recien_graduado.bi_selec_car,
	recien_graduado.bi_valor_univ,	
	recien_graduado.bi_expec_cont,
	recien_graduado.bi_plan_corto,
	recien_graduado.bi_plan_gen,
	recien_graduado.bi_univ_socie,
	--date_part('year',age(bi_fecha_egreso, bi_fecha_ingreso))AS duracion_real,
	dsa.spc_datediff('year', date(bi_fecha_ingreso),date(bi_fecha_egreso)) AS duracion_real,
	recien_graduado.bi_duracion_teorica
 FROM 
  dsa.recien_graduado;


--Creo la tabla de hechos en mi esquema PUBLIC ft_valoracion_academica

DROP TABLE ft_valoracion_academica;

CREATE TABLE ft_valoracion_academica
(
  plan_tecnico_id integer, 
  interes_cont_id integer, 
  tiempo_id date,
  aporte_univ_id integer, 
  carrera_id integer,
  nro_doc character varying,
  sexo_id integer,
  nivel_exig_id integer, 
  selec_univer_id integer,
  selec_carrera_id integer,
  valor_univ_id integer,	
  expec_cont_id integer,
  plan_corto_id integer,
  plan_gen_id integer,
  valor_univ_socie_id integer,
  duracion_real integer,
  bi_duracion_teorica integer
  )
  
)