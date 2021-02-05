--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.13
-- Dumped by pg_dump version 9.2.13
-- Started on 2021-02-05 09:05:11 -03

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 30601)
-- Name: dsa; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA dsa;


ALTER SCHEMA dsa OWNER TO postgres;

--
-- TOC entry 234 (class 3079 OID 11767)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 234
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = dsa, pg_catalog;

--
-- TOC entry 247 (class 1255 OID 30602)
-- Name: f_edad(date); Type: FUNCTION; Schema: dsa; Owner: postgres
--

CREATE FUNCTION f_edad(date) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
DECLARE edad Integer;

BEGIN
    edad := date_part('Y',now()) - date_part('Y',$1::date);
    RETURN edad;
END;
$_$;


ALTER FUNCTION dsa.f_edad(date) OWNER TO postgres;

--
-- TOC entry 250 (class 1255 OID 40435)
-- Name: spc_datediff(character varying, date, date); Type: FUNCTION; Schema: dsa; Owner: postgres
--

CREATE FUNCTION spc_datediff(type character varying, date_from date, date_to date) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE age INTERVAL;
BEGIN
       age := age(date_to, date_from);
       CASE type
           WHEN 'month' THEN
               RETURN date_part('year', age) * 12 + date_part('month', age);
           WHEN 'year' THEN
               RETURN date_part('year', age);
           ELSE
               RETURN (date_to - date_from)::int;
       END CASE;
END;
$$;


ALTER FUNCTION dsa.spc_datediff(type character varying, date_from date, date_to date) OWNER TO postgres;

--
-- TOC entry 249 (class 1255 OID 39939)
-- Name: spc_dim_edad(integer, integer); Type: FUNCTION; Schema: dsa; Owner: postgres
--

CREATE FUNCTION spc_dim_edad(pdesde integer, phasta integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
i int;
BEGIN
for  i in pdesde..phasta
loop
     INSERT INTO dsa.d_redad (edad) VALUES(i);
end loop;
update dsa.d_redad set rango_edad = 'Menor a 16' where edad <= 16;
update dsa.d_redad set rango_edad = '17 a 20' where edad between 17 and 20;
update dsa.d_redad set rango_edad = '21 a 24' where edad between 21 and 24;
update dsa.d_redad set rango_edad = '25 a 29' where edad between 25 and 29;
update dsa.d_redad set rango_edad = '30 a 34' where edad between 30 and 34;
update dsa.d_redad set rango_edad = '35 a 39' where edad between 35 and 39;
update dsa.d_redad set rango_edad = '40 a 49' where edad between 40 and 49;
update dsa.d_redad set rango_edad = '50 a 59' where edad between 50 and 59;
update dsa.d_redad set rango_edad = 'Mayor a 60' where edad >= 60;
END;
$$;


ALTER FUNCTION dsa.spc_dim_edad(pdesde integer, phasta integer) OWNER TO postgres;

--
-- TOC entry 248 (class 1255 OID 39432)
-- Name: spc_dim_tiempo(date, integer); Type: FUNCTION; Schema: dsa; Owner: postgres
--

CREATE FUNCTION spc_dim_tiempo(pfecha date, phasta integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
i int;
fecha date;
BEGIN
for  i in 1..phasta
loop
		SELECT into fecha (pfecha + i)::date;
		INSERT INTO dsa.d_tiempo VALUES(fecha,(date_part('month',fecha))::text || '-' || (date_part('Y',fecha))::text,date_part('Y',fecha));
end loop;
END;
$$;


ALTER FUNCTION dsa.spc_dim_tiempo(pfecha date, phasta integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 38911)
-- Name: carrera; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE carrera (
    carrera_id integer NOT NULL,
    unidad_academica character varying,
    nombre character varying,
    nom_largo character varying
);
ALTER TABLE ONLY carrera ALTER COLUMN carrera_id SET STATISTICS 0;


ALTER TABLE dsa.carrera OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 40201)
-- Name: d_aporte_univ; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_aporte_univ (
    aporte_univ_id character varying,
    aporte_univ character varying
);


ALTER TABLE dsa.d_aporte_univ OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 39773)
-- Name: d_cant_hijos; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_cant_hijos (
    canthijos_id character varying,
    cant_hijos character varying
);


ALTER TABLE dsa.d_cant_hijos OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 39670)
-- Name: d_cant_hs_sem; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_cant_hs_sem (
    cant_hs_sem_id character varying,
    cant_hs_semanal character varying
);


ALTER TABLE dsa.d_cant_hs_sem OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 39381)
-- Name: d_colacion; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_colacion (
    colacion_id integer NOT NULL,
    nom_colacion character varying,
    anio_colacion integer
);


ALTER TABLE dsa.d_colacion OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 39991)
-- Name: d_entidad_trabaja; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_entidad_trabaja (
    entidad_id character varying,
    entidad_trabaja character varying
);


ALTER TABLE dsa.d_entidad_trabaja OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 39692)
-- Name: d_estado_civil; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_estado_civil (
    estadocivil_id character varying,
    estado_civil character varying
);


ALTER TABLE dsa.d_estado_civil OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 40147)
-- Name: d_expec_cont; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_expec_cont (
    expec_cont_id character varying,
    expec_cont character varying
);


ALTER TABLE dsa.d_expec_cont OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 39729)
-- Name: d_grupo_conv; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_grupo_conv (
    grupoconv_id character varying,
    grupo_conv character varying
);


ALTER TABLE dsa.d_grupo_conv OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 40153)
-- Name: d_interes_cont; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_interes_cont (
    interes_cont_id character varying,
    interes_cont character varying
);


ALTER TABLE dsa.d_interes_cont OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 39854)
-- Name: d_nivel_estudio; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_nivel_estudio (
    nivelestudio_id character varying,
    nivel_estudio character varying
);


ALTER TABLE dsa.d_nivel_estudio OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 40135)
-- Name: d_nivel_exigencia; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_nivel_exigencia (
    nivel_exig_id character varying,
    nivel_exig character varying
);


ALTER TABLE dsa.d_nivel_exigencia OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 40159)
-- Name: d_plan_corto; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_plan_corto (
    plan_corto_id character varying,
    plan_corto character varying
);


ALTER TABLE dsa.d_plan_corto OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 40171)
-- Name: d_plan_gen; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_plan_gen (
    plan_gen_id character varying,
    plan_gen character varying
);


ALTER TABLE dsa.d_plan_gen OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 40165)
-- Name: d_plan_tecnico; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_plan_tecnico (
    plan_tecnico_id character varying,
    plan_tecnico character varying
);


ALTER TABLE dsa.d_plan_tecnico OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 39928)
-- Name: d_redad; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_redad (
    edad integer,
    rango_edad character varying
);


ALTER TABLE dsa.d_redad OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 39972)
-- Name: d_satisf_trabajo; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_satisf_trabajo (
    satisf_trabajo_id character varying,
    satisfaccion_trabajo character varying
);


ALTER TABLE dsa.d_satisf_trabajo OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 40189)
-- Name: d_selec_carrera; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_selec_carrera (
    selec_carrera_id character varying,
    selec_carrera character varying
);


ALTER TABLE dsa.d_selec_carrera OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 40141)
-- Name: d_selec_univer; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_selec_univer (
    selec_univer_id character varying,
    selec_univer character varying
);


ALTER TABLE dsa.d_selec_univer OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 39745)
-- Name: d_sexo; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_sexo (
    sexo_id character varying,
    sexo character varying
);


ALTER TABLE dsa.d_sexo OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 39649)
-- Name: d_situacion_laboral; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_situacion_laboral (
    sit_lab_id character varying,
    sit_laboral character varying
);


ALTER TABLE dsa.d_situacion_laboral OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 39426)
-- Name: d_tiempo; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_tiempo (
    fecha date NOT NULL,
    mes character varying,
    anio character varying
);


ALTER TABLE dsa.d_tiempo OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 40195)
-- Name: d_valor_univ; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_valor_univ (
    valor_univ_id character varying,
    valor_univ character varying
);


ALTER TABLE dsa.d_valor_univ OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 40177)
-- Name: d_valor_univ_socie; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE d_valor_univ_socie (
    valor_univ_socie_id character varying,
    valor_univ_socie character varying
);


ALTER TABLE dsa.d_valor_univ_socie OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 40036)
-- Name: ft_situacion_laboral; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE ft_situacion_laboral (
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
);


ALTER TABLE dsa.ft_situacion_laboral OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 40418)
-- Name: ft_valoracion_academica; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE ft_valoracion_academica (
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
);


ALTER TABLE dsa.ft_valoracion_academica OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 38927)
-- Name: graduado_colacion; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE graduado_colacion (
    gradcolacion_id integer NOT NULL,
    nro_inscripcion character varying,
    plan character varying,
    fecha_egreso date,
    colacion integer,
    fecha_ingreso date,
    tipo_documento integer,
    nro_documento character varying,
    fecha_nacimiento date,
    carrera integer
);


ALTER TABLE dsa.graduado_colacion OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 38925)
-- Name: graduado_colacion_gradcolacion_id_seq; Type: SEQUENCE; Schema: dsa; Owner: postgres
--

CREATE SEQUENCE graduado_colacion_gradcolacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dsa.graduado_colacion_gradcolacion_id_seq OWNER TO postgres;

--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 175
-- Name: graduado_colacion_gradcolacion_id_seq; Type: SEQUENCE OWNED BY; Schema: dsa; Owner: postgres
--

ALTER SEQUENCE graduado_colacion_gradcolacion_id_seq OWNED BY graduado_colacion.gradcolacion_id;


--
-- TOC entry 177 (class 1259 OID 38969)
-- Name: localidad; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE localidad (
    loc_id integer NOT NULL,
    nom_loc character varying,
    nom_dpto character varying,
    nom_prov character varying,
    nom_pais character varying,
    dpto_id integer,
    prov_id integer,
    pais_id integer
);


ALTER TABLE dsa.localidad OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 40256)
-- Name: plan_estudio; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE plan_estudio (
    carrera_id integer,
    plan character varying,
    duracion_teorica integer,
    unidad_academica character varying
);


ALTER TABLE dsa.plan_estudio OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 38790)
-- Name: recien_graduado; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE recien_graduado (
    id integer NOT NULL,
    usuario character varying,
    nro_doc character varying,
    fecha_nac character varying,
    sexo character varying,
    nacionalidad character varying,
    mail character varying,
    estado_civil character varying,
    cant_hijos character varying,
    grupo_conv character varying,
    bi_edad integer,
    titulo character varying,
    ciudad_res character varying,
    prov_res character varying,
    pais_res character varying,
    ciudad_proc character varying,
    prov_proc character varying,
    pais_proc character varying,
    hab_lectura character varying,
    tipo_lectura character varying,
    otros_hab character varying,
    estudio_padre character varying,
    estudio_madre character varying,
    estudio_pareja character varying,
    cond_actual character varying,
    busca_trab character varying,
    exp_laboral character varying,
    caract_val_empleador character varying,
    otras_capacidades character varying,
    otras_fuentes_lab character varying,
    info_bolsa_trab character varying,
    recibe_remun character varying,
    realiza_aporte_jub character varying,
    tipo_relacion_lab character varying,
    tipo_contratacion character varying,
    cant_hs_semanal character varying,
    satisfecho_trabajo character varying,
    entidad_trabaja character varying,
    mejora_por_titulo character varying,
    razon_no_trabaja character varying,
    sector_pref character varying,
    activ_pref character varying,
    exig_lugar_trabajo character varying,
    motivo_elec_carrera character varying,
    motivo_estud_univer character varying,
    cont_carrera_interes character varying,
    cont_carrera_expec character varying,
    nivel_exigencia_carrera character varying,
    plan_estudio_corto character varying,
    plan_estudio_largo character varying,
    plan_estudio_tecnico character varying,
    plan_estudio_gral character varying,
    opinion_alum character varying,
    opinion_aulas character varying,
    opinion_biblio character varying,
    opinion_lab character varying,
    opinion_admin character varying,
    volver_univer character varying,
    aspectos_univer_aprecia character varying,
    reconom_univer_socie character varying,
    brindar_univer character varying,
    otros_estudios character varying,
    tipo_institucion character varying,
    nombre_carrera character varying,
    finalizo_carrera character varying,
    conoc_ingles character varying,
    conoc_frances character varying,
    conoc_aleman character varying,
    conoc_italiano character varying,
    conoc_portugues character varying,
    conoc_herr_infor character varying,
    seguir_estud character varying,
    que_seguir_estud character varying,
    donde_seguir_estud character varying,
    porque_seguir_estud character varying,
    interes_formac_continua character varying,
    fecha_inicio_enc date,
    fecha_fin_enc date,
    anio_ingreso character varying,
    bi_loc_res integer,
    bi_loc_proc integer,
    bi_fecha_nac date,
    bi_fecha_ingreso date,
    bi_fecha_egreso date,
    bi_colacion integer,
    bi_fecha_fin_enc character varying,
    bi_carrera integer,
    bi_cond_actual character varying,
    bi_cant_hs_sem character varying,
    bi_estado_civil character varying,
    bi_grupo_conv character varying,
    bi_sexo character varying,
    bi_cant_hijos character varying,
    bi_est_padre character varying,
    bi_est_madre character varying,
    bi_satisf_trabajo character varying,
    bi_entidad_trabaja character varying,
    bi_nivel_exig character varying,
    bi_selec_univer character varying,
    bi_selec_car character varying,
    bi_valor_univ character varying,
    bi_expec_cont character varying,
    bi_interes_cont character varying,
    bi_plan_corto character varying,
    bi_plan_gen character varying,
    bi_univ_socie character varying,
    bi_aporte_univ character varying,
    bi_plan_tecnico character varying,
    bi_duracion_teorica integer
);


ALTER TABLE dsa.recien_graduado OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 38788)
-- Name: recien_graduado_id_seq; Type: SEQUENCE; Schema: dsa; Owner: postgres
--

CREATE SEQUENCE recien_graduado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dsa.recien_graduado_id_seq OWNER TO postgres;

--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 171
-- Name: recien_graduado_id_seq; Type: SEQUENCE OWNED BY; Schema: dsa; Owner: postgres
--

ALTER SEQUENCE recien_graduado_id_seq OWNED BY recien_graduado.id;


--
-- TOC entry 169 (class 1259 OID 28297)
-- Name: resultados; Type: TABLE; Schema: dsa; Owner: postgres; Tablespace: 
--

CREATE TABLE resultados (
    "Usuario" name,
    "Respondida por" name,
    "Apellido y Nombres" name,
    "Tipo de documento" name,
    "Número de documento" integer,
    "Fecha de nacimiento" name,
    "Sexo" name,
    "Nacionalidad" name,
    "Correo Electrónico" name,
    "Estado Civil" name,
    "Cantidad de Hijos" name,
    "Grupo de Convivencia" name,
    "Título" name,
    "Ańo de Ingreso" name,
    "Ciudad_a" name,
    "Provincia_a" name,
    "País_a" name,
    "Ciudad" name,
    "Provincia" name,
    "País" name,
    "Hábito de Lectura" name,
    "Tipo de Lectura" name,
    "Otros Hábitos" name,
    "Padre" name,
    "Madre" name,
    "Pareja" name,
    "Condición Actual" name,
    "Busca trabajo" name,
    "Expectativas laborales en los próximos 6 meses" name,
    "Qué característica de los graduados universitarios de su áre" name,
    "En caso de haber seleccionado Otras capacidades, mencione cuál" name,
    "Mencione, qué organismos, empresas o instituciones visualiza c" name,
    "Le interesaría recibir información de la bolsa de trabajo de " name,
    "Recibe remuneración" name,
    "Realiza aportes jubilatorios" name,
    "Tipo de relación laboral" name,
    "Qué tipo de contratación posee" name,
    "Cantidad de hs. semanales de trabajo" name,
    "Esta satisfecho con su trabajo" name,
    "La entidad donde trabaja es" name,
    "Con relación a su trabajo actual y por haberse recibido" name,
    "Razón por la que no trabaja" name,
    "Sector Preferido" name,
    "Actividad Preferida" name,
    "Exigencias respecto del lugar de trabajo" name,
    "Motivos por los cuales eligió su carrera Universitaria" name,
    "Por qué eligió estudiar en esta Universidad" name,
    "Los contenidos estudiados durante su carrera fueron interesante" name,
    "Los contenidos estudiados durante su carrera cumplieron sus exp" name,
    "Nivel de exigencia de la carrera" name,
    "El plan de estudios debería ser más corto" name,
    "El plan de estudios debería ser más largo" name,
    "El plan de estudios tendría que ser un perfil más técnico" name,
    "El plan de estudios tendría que ser más generalista" name,
    "Alumnos" name,
    "Aulas" name,
    "Biblioteca" name,
    "Laboratorio" name,
    "Administración" name,
    "Volvería a estudiar en la Universidad Pública" name,
    "Cuáles son los aspectos de la Universidad que usted más aprec" name,
    "Cuál es su percepción sobre el reconocimiento de la sociedad " name,
    "Qué desearía Ud. le brinde esta Universidad" name,
    "Aparte de la carrera universitaria que finalizó, realizó otro" name,
    "Tipo de Institución" name,
    "Nombre de la carrera" name,
    "Finalizó la carrera" name,
    "Conocimientos de Inglés" name,
    "Conocimientos de Francés" name,
    "Conocimientos de Alemán" name,
    "Conocimientos de Italiano" name,
    "Conocimientos de Portugués" name,
    "Conocimientos de Herramientas Informáticas" name,
    "Piensa seguir estudiando" name,
    "Si piensa seguir estudiando, qué le gustaría hacer" name,
    "Dónde cree que lo hará" name,
    "Si va a estudiar en otra universidad o en el extranjero, por qu" name,
    "Está interesado en cursos de formación contínua" name,
    "Fecha de inicio" name,
    "Fecha fin" name,
    edad integer,
    resul_id integer NOT NULL
);


ALTER TABLE dsa.resultados OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 38815)
-- Name: resultados_resul_id_seq; Type: SEQUENCE; Schema: dsa; Owner: postgres
--

CREATE SEQUENCE resultados_resul_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dsa.resultados_resul_id_seq OWNER TO postgres;

--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 173
-- Name: resultados_resul_id_seq; Type: SEQUENCE OWNED BY; Schema: dsa; Owner: postgres
--

ALTER SEQUENCE resultados_resul_id_seq OWNED BY resultados.resul_id;


--
-- TOC entry 205 (class 1259 OID 40031)
-- Name: vw_situacion_laboral; Type: VIEW; Schema: dsa; Owner: postgres
--

CREATE VIEW vw_situacion_laboral AS
    SELECT recien_graduado.bi_loc_res, recien_graduado.bi_carrera, recien_graduado.fecha_fin_enc, recien_graduado.bi_cond_actual, recien_graduado.bi_cant_hs_sem, recien_graduado.nro_doc, recien_graduado.bi_sexo, recien_graduado.bi_estado_civil, recien_graduado.bi_grupo_conv, recien_graduado.bi_fecha_nac, f_edad(recien_graduado.bi_fecha_nac) AS edad, recien_graduado.bi_satisf_trabajo, recien_graduado.bi_entidad_trabaja, recien_graduado.bi_loc_proc FROM recien_graduado;


ALTER TABLE dsa.vw_situacion_laboral OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 40413)
-- Name: vw_valoracion_academica; Type: VIEW; Schema: dsa; Owner: postgres
--

CREATE VIEW vw_valoracion_academica AS
    SELECT recien_graduado.bi_plan_tecnico, recien_graduado.bi_interes_cont, recien_graduado.fecha_fin_enc, recien_graduado.bi_aporte_univ, recien_graduado.bi_carrera, recien_graduado.nro_doc, recien_graduado.bi_sexo, recien_graduado.bi_nivel_exig, recien_graduado.bi_selec_univer, recien_graduado.bi_selec_car, recien_graduado.bi_valor_univ, recien_graduado.bi_expec_cont, recien_graduado.bi_plan_corto, recien_graduado.bi_plan_gen, recien_graduado.bi_univ_socie, date_part('year'::text, age((recien_graduado.bi_fecha_egreso)::timestamp with time zone, (recien_graduado.bi_fecha_ingreso)::timestamp with time zone)) AS duracion_real, recien_graduado.bi_duracion_teorica FROM recien_graduado;


ALTER TABLE dsa.vw_valoracion_academica OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 220 (class 1259 OID 40290)
-- Name: d_aporte_univ; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_aporte_univ (
    aporte_univ_id integer,
    aporte_univ character varying
);


ALTER TABLE public.d_aporte_univ OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 39658)
-- Name: d_cant_hijos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_cant_hijos (
    canthijos_id integer,
    cant_hijos character varying
);


ALTER TABLE public.d_cant_hijos OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 39664)
-- Name: d_cant_hs_sem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_cant_hs_sem (
    cant_hs_sem_id integer,
    cant_hs_semanal character varying
);


ALTER TABLE public.d_cant_hs_sem OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 39021)
-- Name: d_carrera; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_carrera (
    nom_carrera character varying,
    carrera_id integer,
    unidad_academica character varying
);


ALTER TABLE public.d_carrera OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 39680)
-- Name: d_colacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_colacion (
    colacion_id integer,
    nom_colacion character varying,
    anio_colacion integer
);


ALTER TABLE public.d_colacion OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 40001)
-- Name: d_entidad_trabaja; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_entidad_trabaja (
    entidad_id integer,
    entidad_trabaja character varying
);


ALTER TABLE public.d_entidad_trabaja OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 39114)
-- Name: d_estado_civil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_estado_civil (
    estadocivil_id integer,
    estado_civil character varying
);


ALTER TABLE public.d_estado_civil OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 40296)
-- Name: d_expec_cont; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_expec_cont (
    expec_cont_id integer,
    expec_cont character varying
);


ALTER TABLE public.d_expec_cont OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 39147)
-- Name: d_grupo_conv; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_grupo_conv (
    grupoconv_id integer,
    grupo_conv character varying
);


ALTER TABLE public.d_grupo_conv OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 40302)
-- Name: d_interes_cont; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_interes_cont (
    interes_cont_id integer,
    interes_cont character varying
);


ALTER TABLE public.d_interes_cont OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 39089)
-- Name: d_nivel_est_madre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_nivel_est_madre (
    estudiomadre_id integer,
    estudios_madre character varying
);


ALTER TABLE public.d_nivel_est_madre OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 39083)
-- Name: d_nivel_est_padre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_nivel_est_padre (
    estudiopadre_id integer,
    estudios_padre character varying
);


ALTER TABLE public.d_nivel_est_padre OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 40308)
-- Name: d_nivel_exigencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_nivel_exigencia (
    nivel_exig_id integer,
    nivel_exig character varying
);


ALTER TABLE public.d_nivel_exigencia OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 40314)
-- Name: d_plan_corto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_plan_corto (
    plan_corto_id integer,
    plan_corto character varying
);


ALTER TABLE public.d_plan_corto OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 40320)
-- Name: d_plan_gen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_plan_gen (
    plan_gen_id integer,
    plan_gen character varying
);


ALTER TABLE public.d_plan_gen OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 40326)
-- Name: d_plan_tecnico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_plan_tecnico (
    plan_tecnico_id integer,
    plan_tecnico character varying
);


ALTER TABLE public.d_plan_tecnico OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 39717)
-- Name: d_procedencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_procedencia (
    ciudadproc_id integer,
    nom_ciudad_proc character varying,
    nom_provincia_proc character varying,
    nom_pais_proc character varying,
    provproc_id integer,
    dptoproc_id integer,
    paisproc_id integer,
    nom_dpto_proc character varying
);


ALTER TABLE public.d_procedencia OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 39963)
-- Name: d_redad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_redad (
    edad integer,
    rango_edad character varying
);


ALTER TABLE public.d_redad OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 28361)
-- Name: d_residencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_residencia (
    ciudadres_id integer,
    nom_ciudad_res character varying,
    nom_provincia_res character varying,
    nom_pais_res character varying,
    provres_id integer,
    dptores_id integer,
    paisres_id integer,
    nom_dpto_res character varying
);


ALTER TABLE public.d_residencia OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 39982)
-- Name: d_satisf_trabajo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_satisf_trabajo (
    satisf_trabajo_id integer,
    satisfaccion_trabajo character varying
);


ALTER TABLE public.d_satisf_trabajo OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 40332)
-- Name: d_selec_carrera; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_selec_carrera (
    selec_carrera_id integer,
    selec_carrera character varying
);


ALTER TABLE public.d_selec_carrera OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 40338)
-- Name: d_selec_univer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_selec_univer (
    selec_univer_id integer,
    selec_univer character varying
);


ALTER TABLE public.d_selec_univer OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 39125)
-- Name: d_sexo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_sexo (
    sexo_id integer,
    sexo character varying
);


ALTER TABLE public.d_sexo OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 39616)
-- Name: d_situacion_laboral; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_situacion_laboral (
    sit_lab_id integer,
    sit_laboral character varying
);


ALTER TABLE public.d_situacion_laboral OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 39514)
-- Name: d_tiempo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_tiempo (
    mes character varying,
    tiempo_id date,
    anio integer
);


ALTER TABLE public.d_tiempo OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 40344)
-- Name: d_valor_univ; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_valor_univ (
    valor_univ_id integer,
    valor_univ character varying
);


ALTER TABLE public.d_valor_univ OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 40350)
-- Name: d_valor_univ_socie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE d_valor_univ_socie (
    valor_univ_socie_id integer,
    valor_univ_socie character varying
);


ALTER TABLE public.d_valor_univ_socie OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 40042)
-- Name: ft_situacion_laboral; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ft_situacion_laboral (
    ciudadres_id integer,
    carrera_id integer NOT NULL,
    sit_lab_id integer,
    cant_hs_sem_id integer,
    nro_doc character varying NOT NULL,
    sexo_id integer,
    estadocivil_id integer,
    grupoconv_id integer,
    bi_fecha_nac date,
    edad integer,
    satisf_trabajo_id integer,
    entidad_id integer,
    ciudadproc_id integer,
    tiempo_id date
);


ALTER TABLE public.ft_situacion_laboral OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 40425)
-- Name: ft_valoracion_academica; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ft_valoracion_academica (
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
);


ALTER TABLE public.ft_valoracion_academica OWNER TO postgres;

SET search_path = dsa, pg_catalog;

--
-- TOC entry 2162 (class 2604 OID 38930)
-- Name: gradcolacion_id; Type: DEFAULT; Schema: dsa; Owner: postgres
--

ALTER TABLE ONLY graduado_colacion ALTER COLUMN gradcolacion_id SET DEFAULT nextval('graduado_colacion_gradcolacion_id_seq'::regclass);


--
-- TOC entry 2161 (class 2604 OID 38793)
-- Name: id; Type: DEFAULT; Schema: dsa; Owner: postgres
--

ALTER TABLE ONLY recien_graduado ALTER COLUMN id SET DEFAULT nextval('recien_graduado_id_seq'::regclass);


--
-- TOC entry 2160 (class 2604 OID 38817)
-- Name: resul_id; Type: DEFAULT; Schema: dsa; Owner: postgres
--

ALTER TABLE ONLY resultados ALTER COLUMN resul_id SET DEFAULT nextval('resultados_resul_id_seq'::regclass);


--
-- TOC entry 2168 (class 2606 OID 38919)
-- Name: pk_carrera; Type: CONSTRAINT; Schema: dsa; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT pk_carrera PRIMARY KEY (carrera_id);


--
-- TOC entry 2170 (class 2606 OID 38935)
-- Name: pk_gradcolacion; Type: CONSTRAINT; Schema: dsa; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY graduado_colacion
    ADD CONSTRAINT pk_gradcolacion PRIMARY KEY (gradcolacion_id);


--
-- TOC entry 2172 (class 2606 OID 38976)
-- Name: pk_localidad; Type: CONSTRAINT; Schema: dsa; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY localidad
    ADD CONSTRAINT pk_localidad PRIMARY KEY (loc_id);


--
-- TOC entry 2166 (class 2606 OID 38798)
-- Name: pk_recieng; Type: CONSTRAINT; Schema: dsa; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recien_graduado
    ADD CONSTRAINT pk_recieng PRIMARY KEY (id);


--
-- TOC entry 2164 (class 2606 OID 38823)
-- Name: resultados_pkey; Type: CONSTRAINT; Schema: dsa; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resultados
    ADD CONSTRAINT resultados_pkey PRIMARY KEY (resul_id);


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2021-02-05 09:05:16 -03

--
-- PostgreSQL database dump complete
--
