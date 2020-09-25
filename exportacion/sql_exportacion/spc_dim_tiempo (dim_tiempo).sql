CREATE TABLE dsa.d_tiempo
(
    fecha date NOT NULL,
    mes character varying,
    anio character varying
);


-- DROP FUNCTION public.spc_mi_cursor(character varying);
-- CREA UNA FUNCION QUE GENERA REGISTROS PARA LA DIMENSION TIEMPO
-- DESDE LA FECHA RECIBIDA (pfecha) Y POR LA CANTIDAD DE DIAS INDICADOS (phasta)
CREATE OR REPLACE FUNCTION dsa.spc_dim_tiempo(pfecha date, phasta int)
    RETURNS void
    LANGUAGE 'plpgsql'
AS $BODY$
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
$BODY$;

-- PARA PROBAR EL FUNCIONAMIENTO
--truncate table dsa.d_tiempo;
--select dsa.spc_dim_tiempo('2018-1-1',1600)
--SELECT * FROM dsa.d_tiempo order by 1
