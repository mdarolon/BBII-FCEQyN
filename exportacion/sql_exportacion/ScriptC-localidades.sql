-- Script C
-- Exportacion de las localidades (mug_paises, mug_localidades, 
-- mug_dptos_partidos, mug_provincias)
-- BD: SIU-Kolla

SELECT 
  mug_localidades.localidad, 
  mug_localidades.nombre, 
  mug_localidades.dpto_partido, 
  mug_dptos_partidos.nombre, 
  mug_dptos_partidos.provincia, 
  mug_provincias.nombre, 
  mug_provincias.pais, 
  mug_paises.nombre
FROM 
  kolla.mug_paises, 
  kolla.mug_localidades, 
  kolla.mug_dptos_partidos, 
  kolla.mug_provincias
WHERE 
  mug_localidades.dpto_partido = mug_dptos_partidos.dpto_partido AND
  mug_dptos_partidos.provincia = mug_provincias.provincia AND
  mug_provincias.pais = mug_paises.pais and
  (mug_paises.nombre = 'Argentina' or mug_paises.nombre = 'Brasil');

