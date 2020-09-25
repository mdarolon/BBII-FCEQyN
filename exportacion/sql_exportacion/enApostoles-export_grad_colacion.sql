Para correr en la BD de Apostoles:

--A-- Exportacion de las carreras (sga_carreras)

select * from sga_carreras;


--B-- Exportacion de los graduados x colacion (sga_graduado_colacion)
-- Creacion de una vista. Involucra las tablas: sga_titulos_otorg, sga_alumnos, sga_personas
-- NECESITO LAS COLACIONES DE LOS AÑOS 2018, 2019 Y 2020
-- En mi caso son las colaciones 26, 27, 28 y 29

--select * from sga_colaciones
--26 y 27 = año 2018
--28 = año 2019
--29 = año 2020 

-- ACLARACION: Los campos tipo Date deben ser exportados con el formato dd/mm/aaaa
--(este script se ejecuta x cada colacion)

select a.nro_inscripcion, a.carrera, a.plan, (SUBSTR(a.fecha_egreso, 4, 2)||'/'||SUBSTR(a.fecha_egreso, 1, 2)||'/'||SUBSTR(a.fecha_egreso, 7, 4)),
a.colacion, (SUBSTR(b.fecha_ingreso, 4, 2)||'/'||SUBSTR(b.fecha_ingreso, 1, 2)||'/'||SUBSTR(b.fecha_ingreso, 7, 4)), c.tipo_documento, c.nro_documento,
(SUBSTR(c.fecha_nacimiento, 4, 2)||'/'||SUBSTR(c.fecha_nacimiento, 1, 2)||'/'||SUBSTR(c.fecha_nacimiento, 7, 4))
from sga_titulos_otorg a, sga_alumnos b, sga_personas c where (colacion = '29') and a.carrera = b.carrera
and a.nro_inscripcion = b.nro_inscripcion and b.nro_inscripcion = c.nro_inscripcion 


-- C-- Exportacion de las colaciones (guarani_colaciones)

select * from sga_colaciones;

