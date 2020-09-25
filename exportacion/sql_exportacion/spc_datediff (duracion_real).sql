--FUNCION QUE PERMITE OBTENER LA DURACION REAL DE LA CARRERA
--Se obtiene de la fecha de ingreso y la fecha de egreso del graduado a la carrera

--Creo la funcion que obtiene la duracion real en anios del graduado en la carrera.

--DROP FUNCTION dsa.spc_datediff(type VARCHAR, date_from DATE, date_to DATE);;

CREATE FUNCTION dsa.spc_datediff(type VARCHAR, date_from DATE, date_to DATE) RETURNS INTEGER LANGUAGE plpgsql
AS
$$
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

  -- PARA PROBAR EL FUNCIONAMIENTO
--SELECT dsa.datediff('year', '2018-04-11','2020-02-28');
--SELECT dsa.datediff('month', '2018-04-11','2020-02-28');

--SELECT recien_graduado.bi_carrera, 
--	dsa.spc_datediff('year', date(bi_fecha_ingreso),date(bi_fecha_egreso)) AS duracion_real
--   FROM dsa.recien_graduado;

