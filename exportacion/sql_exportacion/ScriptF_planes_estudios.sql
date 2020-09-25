-- Script F
-- Exportacion planes de estudio por carrera
-- BD: SIU-Guarani

select unidad_academica, carrera, plan, vigencia_minima
from sga_planes 
where estado = 'V' 
and carrera <> 'SAC'
order by carrera, plan
