---------------------
-- CARGA TABLA plan_estudio
--------------------
--id, carrera, plan de estudio, duracien teorica (en anos)

select distinct (plan, carrera) from dsa.graduado_colacion

insert into dsa.plan_estudio values (2,147, '1992', 5 );
insert into dsa.plan_estudio values (3,109, '1996', 3 );
insert into dsa.plan_estudio values (4,114, '1997', 2 );
insert into dsa.plan_estudio values (5,170, '1997', 4 );
insert into dsa.plan_estudio values (6,172, '1997', 4 );
insert into dsa.plan_estudio values (7,143, '2000', 4 );
insert into dsa.plan_estudio values (8,101, '2003', 5 );
insert into dsa.plan_estudio values (9,105, '2004', 4 );
insert into dsa.plan_estudio values (10,102, '2007', 6 );
insert into dsa.plan_estudio values (11,104, '2007', 6 );
insert into dsa.plan_estudio values (12,106, '2008', 5 );
insert into dsa.plan_estudio values (13,109, '2010', 3 );
insert into dsa.plan_estudio values (14,111, '2011', 2 );
insert into dsa.plan_estudio values (15,901, '2012', 2 );
insert into dsa.plan_estudio values (16,110, '2013', 4 );
insert into dsa.plan_estudio values (17,114, '2013', 2 );
insert into dsa.plan_estudio values (18,116, '2014', 2 );
insert into dsa.plan_estudio values (19,117, '2014', 2 );
insert into dsa.plan_estudio values (20,800, '2015', 4 );
insert into dsa.plan_estudio values (21,118, '2016', 2 );
insert into dsa.plan_estudio values (22,119, '2016', 2 );
insert into dsa.plan_estudio values (23,142, '2016', 4 );