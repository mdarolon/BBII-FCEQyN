# BBII-FCEQyN

Tesis de Maestría en Tecnologías de la Información

_*Metodología para el desarrollo de Datamarts en Universidades Nacionales del Consorcio SIU.
Caso de Estudio: Área Graduados de la FCEQyN*_

Autora: Lic. Maria Daniela Rolon

Director: Dr. Eduardo Zamudio
Co-Director: Mgter. Jesús Germán Andrés Pautsch

Facultad de Ciencias Exactas, Químicas y Naturales - Universidad Nacional de Misiones

REQUISITOS
    Pentaho Data Integration 8 
    Librerías para Informix (ifxtools.jar,	ifxjdbc.jar, ifxlang.jar, ifxlsupp.jar)
    Debian GNU/Linux 10
    PostgreSQL 9.3
     
INSTRUCCIONES
1. Instalar Servidor de Pentaho (http://www.pentaho.com/)
2. Instalar PostgreSQL y crear la base de datos
3. Descargar la carpeta ETL_Carga-inicial y ejecutar los job: carga_datasets_ifx.kjb, job_transformaciones.kjb, job_mapeos.kjb, carga_dimensiones.kjb,
  carga_ft.kjb
4. Descargar el esquema multidimensional (egresados.xml) y publicarlo en el servidor de Pentaho

