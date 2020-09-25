
-- TODO ESTO ES DSA
CREATE TABLE dsa.d_situacion_laboral
(
  situacionlab_id varchar NOT NULL,
  condicion_lab_actual varchar
)

select situacionlab_id::text, condicion_lab_actual::integer from d_situacion_laboral


-- LUEGO ENLA DW
DROP TABLE d_situacion_laboral;

CREATE TABLE d_situacion_laboral
(
  situacionlab_id integer NOT NULL,
  condicion_lab_actual varchar
)

ETL para cargar mi DW

Para cargar la tabla de entrada:

select situacionlab_id::integer, condicion_lab_actual from dsa.d_situacion_laboral
