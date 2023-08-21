

-- create schema dw
/*
create clustered index IXC_indicadores_trajetoria_educacao_superior_2011_2020 ON indicadores_trajetoria_educacao_superior_2011_2020 (C�digo_da_Institui��o, C�digo_do_Curso_de_Gradua��o)
create clustered index IXC_indicadores_trajetoria_educacao_superior_2012_2021 ON indicadores_trajetoria_educacao_superior_2012_2021 (C�digo_da_Institui��o, C�digo_do_Curso_de_Gradua��o)
create clustered index IXC_indicadores_trajetoria_educacao_superior_2013_2021 ON indicadores_trajetoria_educacao_superior_2013_2021 (C�digo_da_Institui��o, C�digo_do_Curso_de_Gradua��o)
create clustered index IXC_indicadores_trajetoria_educacao_superior_2014_2021 ON indicadores_trajetoria_educacao_superior_2014_2021 (C�digo_da_Institui��o, C�digo_do_Curso_de_Gradua��o)
create clustered index IXC_indicadores_trajetoria_educacao_superior_2015_2021 ON indicadores_trajetoria_educacao_superior_2015_2021 (C�digo_da_Institui��o, C�digo_do_Curso_de_Gradua��o)
create clustered index IXC_indicadores_trajetoria_educacao_superior_2016_2021 ON indicadores_trajetoria_educacao_superior_2016_2021 (C�digo_da_Institui��o, C�digo_do_Curso_de_Gradua��o)
create clustered index IXC_indicadores_trajetoria_educacao_superior_2017_2021 ON indicadores_trajetoria_educacao_superior_2017_2021 (C�digo_da_Institui��o, C�digo_do_Curso_de_Gradua��o)
*/

DROP TABLE IF EXISTS ODS.ODS_CATALOGO -- CATALOGO DE FONTES DE DADOS PARA RASTREABILIDADE
CREATE TABLE ODS.ODS_CATALOGO
(	CO_CATALOGO INT NOT NULL PRIMARY KEY, 
	NO_CATALOGO VARCHAR(50), 
	TP_CATALOGO INT
)
-- ALTER TABLE ODS.ODS_CATALOGO drop column NO_TP_CATALOGO 
ALTER TABLE ODS.ODS_CATALOGO ADD NO_TP_CATALOGO 
	AS CASE 
			WHEN TP_CATALOGO = 1 THEN 'Fluxo Educa��o Superior' 
			WHEN TP_CATALOGO = 2 THEN 'Microdados Cursos (Censo)' 
			WHEN TP_CATALOGO = 3 THEN 'Microdados IES (Censo)' 
		END 

/* DOMINIO DE CAMPO TP_CATALOGO 
	1 -> INDICADORES DE FLUXO
	2 -> MICRODADOS DE CURSOS (CENSO)
	3 -> MICRODADOS DE CURSOS (CENSO)
	4 -> 
*/
INSERT INTO ODS.ODS_CATALOGO VALUES
(1, 'indicadores_trajetoria_educacao_superior_2011_2020', 1), 
(2, 'indicadores_trajetoria_educacao_superior_2012_2021', 1), 
(3, 'indicadores_trajetoria_educacao_superior_2013_2021', 1), 
(4, 'indicadores_trajetoria_educacao_superior_2014_2021', 1), 
(5, 'indicadores_trajetoria_educacao_superior_2015_2021', 1), 
(6, 'indicadores_trajetoria_educacao_superior_2016_2021', 1), 
(7, 'indicadores_trajetoria_educacao_superior_2017_2021', 1)


SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIkE 'microdados_cadastro_curso%'
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIkE 'microdados_cadastro_ies%'

INSERT INTO ODS.ODS_CATALOGO VALUES
(1, 'indicadores_trajetoria_educacao_superior_2011_2020', 1), 
(2, 'indicadores_trajetoria_educacao_superior_2012_2021', 1), 
(3, 'indicadores_trajetoria_educacao_superior_2013_2021', 1), 
(4, 'indicadores_trajetoria_educacao_superior_2014_2021', 1), 
(5, 'indicadores_trajetoria_educacao_superior_2015_2021', 1), 
(6, 'indicadores_trajetoria_educacao_superior_2016_2021', 1), 
(7, 'indicadores_trajetoria_educacao_superior_2017_2021', 1)

INSERT INTO ODS.ODS_CATALOGO VALUES
(8, 'MICRODADOS_CADASTRO_CURSOS_2011'					,2),
(9, 'MICRODADOS_CADASTRO_CURSOS_2011'					,2),
(11, 'MICRODADOS_CADASTRO_CURSOS_2012'					,2),
(12, 'MICRODADOS_CADASTRO_CURSOS_2013'					,2),
(13, 'MICRODADOS_CADASTRO_CURSOS_2014'					,2),
(14, 'MICRODADOS_CADASTRO_CURSOS_2015'					,2),
(15, 'MICRODADOS_CADASTRO_CURSOS_2016'					,2),
(16, 'MICRODADOS_CADASTRO_CURSOS_2017'					,2),
(17, 'MICRODADOS_CADASTRO_CURSOS_2018'					,2),
(18, 'MICRODADOS_CADASTRO_CURSOS_2019'					,2),
(19, 'MICRODADOS_CADASTRO_CURSOS_2020'					,2),
(20, 'MICRODADOS_CADASTRO_CURSOS_2021'					,2)

INSERT INTO ODS.ODS_CATALOGO VALUES
(21,	'MICRODADOS_CADASTRO_IES_2011'					,3),
(22,	'MICRODADOS_CADASTRO_IES_2012'					,3),
(23,	'MICRODADOS_CADASTRO_IES_2013'					,3),
(24,	'MICRODADOS_CADASTRO_IES_2014'					,3),
(25,	'MICRODADOS_CADASTRO_IES_2015'					,3),
(26,	'MICRODADOS_CADASTRO_IES_2016'					,3),
(27,	'MICRODADOS_CADASTRO_IES_2017'					,3),
(28,	'MICRODADOS_CADASTRO_IES_2018'					,3),
(29,	'MICRODADOS_CADASTRO_IES_2019'					,3),
(30,	'MICRODADOS_CADASTRO_IES_2020'					,3),
(31,	'MICRODADOS_CADASTRO_IES_2021'					,3)



---------------------------------------------------------------------------------------------------------------------------
--- CRIA��O DE TABELA DE INSTIUI��O DE ENSINO
---------------------------------------------------------------------------------------------------------------------------

drop table if exists ODS.ODS_INSTITUICAO_ENSINO 

select	C�digo_da_Institui��o		CO_IES, 
		Nome_da_Institui��o			NO_IES, 
		Categoria_Administrativa	TP_CATEGORIA_ADMINISTRATIVA, 
		Organiza��o_Acad�mica		TP_ORGANIZACAO_ACADEMICA,
		1							TP_CATALOGO
	into ODS.ODS_INSTITUICAO_ENSINO 
																													from indicadores_trajetoria_educacao_superior_2011_2020 union 
select C�digo_da_Institui��o, Nome_da_Institui��o, Categoria_Administrativa, Organiza��o_Acad�mica, 2	TP_CATALOGO from indicadores_trajetoria_educacao_superior_2012_2021	union 
select C�digo_da_Institui��o, Nome_da_Institui��o, Categoria_Administrativa, Organiza��o_Acad�mica, 3	TP_CATALOGO from indicadores_trajetoria_educacao_superior_2013_2021	union 
select C�digo_da_Institui��o, Nome_da_Institui��o, Categoria_Administrativa, Organiza��o_Acad�mica, 4 	TP_CATALOGO from indicadores_trajetoria_educacao_superior_2014_2021	union 
select C�digo_da_Institui��o, Nome_da_Institui��o, Categoria_Administrativa, Organiza��o_Acad�mica, 5	TP_CATALOGO from indicadores_trajetoria_educacao_superior_2015_2021	union 
select C�digo_da_Institui��o, Nome_da_Institui��o, Categoria_Administrativa, Organiza��o_Acad�mica, 6	TP_CATALOGO from indicadores_trajetoria_educacao_superior_2016_2021	union 
select C�digo_da_Institui��o, Nome_da_Institui��o, Categoria_Administrativa, Organiza��o_Acad�mica, 7	TP_CATALOGO from indicadores_trajetoria_educacao_superior_2017_2021	

ALTER TABLE ODS.ODS_INSTITUICAO_ENSINO  ALTER COLUMN  CO_IES						INT			NOT NULL
ALTER TABLE ODS.ODS_INSTITUICAO_ENSINO  ALTER COLUMN  TP_CATEGORIA_ADMINISTRATIVA	TINYINT		NOT NULL
ALTER TABLE ODS.ODS_INSTITUICAO_ENSINO  ALTER COLUMN  TP_ORGANIZACAO_ACADEMICA		TINYINT		NOT NULL
ALTER TABLE ODS.ODS_INSTITUICAO_ENSINO  ALTER COLUMN  TP_CATALOGO					TINYINT		NOT NULL

ALTER TABLE ODS.ODS_INSTITUICAO_ENSINO  ADD CONSTRAINT PK_DIM_INSTITUICAO_ENSINO PRIMARY KEY (CO_IES, TP_CATEGORIA_ADMINISTRATIVA, TP_ORGANIZACAO_ACADEMICA, TP_CATALOGO)

alter table ODS.ODS_INSTITUICAO_ENSINO add NO_CATEGORIA_ADMINISTRATIVA AS 
	CASE 
		WHEN TP_CATEGORIA_ADMINISTRATIVA = 1 THEN 'P�blica Federal'
		WHEN TP_CATEGORIA_ADMINISTRATIVA = 2 THEN 'P�blica Estadual'
		WHEN TP_CATEGORIA_ADMINISTRATIVA = 3 THEN 'P�blica Municipal'
		WHEN TP_CATEGORIA_ADMINISTRATIVA = 4 THEN 'Privada com fins lucrativos'
		WHEN TP_CATEGORIA_ADMINISTRATIVA = 5 THEN 'Privada sem fins lucrativos'
		WHEN TP_CATEGORIA_ADMINISTRATIVA = 7 THEN 'Especial'
	END 

alter table ODS.ODS_INSTITUICAO_ENSINO  add NO_ORGANIZACAO_ACADEMICA AS 
	CASE 
		WHEN TP_ORGANIZACAO_ACADEMICA = 1 THEN 'Universidade'
		WHEN TP_ORGANIZACAO_ACADEMICA = 2 THEN 'Centro Universit�rio'
		WHEN TP_ORGANIZACAO_ACADEMICA = 3 THEN 'Faculdade'
		WHEN TP_ORGANIZACAO_ACADEMICA = 4 THEN 'Instituto Federal de Educa��o, Ci�ncia e Tecnologia'
		WHEN TP_ORGANIZACAO_ACADEMICA = 5 THEN 'Centro Federal de Educa��o Tecnol�gica'
	END 

-- caso de duplicidade-> a universidade mudou para centro universit�rio
-- SELECT * FROM ODS.ODS_INSTITUICAO_ENSINO  WHERE CO_IES = 27



---------------------------------------------------------------------------------------------------------------------------
--- CRIA��O DE TABELA DE CURSO
---------------------------------------------------------------------------------------------------------------------------

drop table if exists ODS.ODS_CURSO 
-- verificar se faz sentido ter codigo de municipio e deriva��es no curso
select	
		C�digo_do_Curso_de_Gradua��o										CO_CURSO,
		Nome_do_Curso_de_Gradua��o											NO_CURSO, 
		C�digo_do_Munic�pio_do_Curso										CO_MUNICIPIO, 
		Grau_acad�mico														TP_GRAU_ACADEMICO, 
		Modalidade_de_ensino												TP_MODALIDADE_ENSINO, 
		C�digo_da_Grande_�rea_do_Curso_segundo_a_classifica��o_CINE_BRASIL	CO_CINE_ROTULO
		-- C�digo_da_�rea_do_Curso_segundo_a_classifica��o_CINE_BRASIL		CO_CINE_AREA_GERAL,

	into ODS.ODS_CURSO 

																													from indicadores_trajetoria_educacao_superior_2011_2020 union 
select C�digo_do_Curso_de_Gradua��o, Nome_do_Curso_de_Gradua��o, C�digo_do_Munic�pio_do_Curso, Grau_acad�mico, Modalidade_de_ensino, C�digo_da_Grande_�rea_do_Curso_segundo_a_classifica��o_CINE_BRASIL from indicadores_trajetoria_educacao_superior_2012_2021	union 
select C�digo_do_Curso_de_Gradua��o, Nome_do_Curso_de_Gradua��o, C�digo_do_Munic�pio_do_Curso, Grau_acad�mico, Modalidade_de_ensino, C�digo_da_Grande_�rea_do_Curso_segundo_a_classifica��o_CINE_BRASIL from indicadores_trajetoria_educacao_superior_2013_2021	union 
select C�digo_do_Curso_de_Gradua��o, Nome_do_Curso_de_Gradua��o, C�digo_do_Munic�pio_do_Curso, Grau_acad�mico, Modalidade_de_ensino, C�digo_da_Grande_�rea_do_Curso_segundo_a_classifica��o_CINE_BRASIL from indicadores_trajetoria_educacao_superior_2014_2021	union 
select C�digo_do_Curso_de_Gradua��o, Nome_do_Curso_de_Gradua��o, C�digo_do_Munic�pio_do_Curso, Grau_acad�mico, Modalidade_de_ensino, C�digo_da_Grande_�rea_do_Curso_segundo_a_classifica��o_CINE_BRASIL from indicadores_trajetoria_educacao_superior_2015_2021	union 
select C�digo_do_Curso_de_Gradua��o, Nome_do_Curso_de_Gradua��o, C�digo_do_Munic�pio_do_Curso, Grau_acad�mico, Modalidade_de_ensino, C�digo_da_Grande_�rea_do_Curso_segundo_a_classifica��o_CINE_BRASIL from indicadores_trajetoria_educacao_superior_2016_2021	union 
select C�digo_do_Curso_de_Gradua��o, Nome_do_Curso_de_Gradua��o, C�digo_do_Munic�pio_do_Curso, Grau_acad�mico, Modalidade_de_ensino, C�digo_da_Grande_�rea_do_Curso_segundo_a_classifica��o_CINE_BRASIL from indicadores_trajetoria_educacao_superior_2017_2021	



ALTER TABLE ODS.ODS_CURSO  ALTER COLUMN  CO_CURSO						INT			NOT NULL
-- parei aqui - erro de PK - 127 cursos duplicados
/*
 select count(1), co_curso from ODS.ODS_CURSO
 group by CO_CURSO having count(1) > 1
 select * from ods.ODS_CURSO where co_curso in (
 4809
, 48510
, 101331
, 46306
, 92254
 )
 */

ALTER TABLE ODS.ODS_CURSO  ADD CONSTRAINT PK_ODS_CURSO PRIMARY KEY (CO_CURSO)

alter table ODS.ODS_CURSO add NO_GRAU_ACADEMICO AS 
	CASE 
		WHEN TP_GRAU_ACADEMICO = 1 THEN 'Bacharelado'
		WHEN TP_GRAU_ACADEMICO = 2 THEN 'Licenciatura'
		WHEN TP_GRAU_ACADEMICO = 3 THEN 'Tecnol�gico'
	END 

alter table ODS.ODS_INSTITUICAO_ENSINO  add NO_MODALIDADE_ENSINO AS 
	CASE 
		WHEN TP_ORGANIZACAO_ACADEMICA = 1 THEN 'Presencial'
		WHEN TP_ORGANIZACAO_ACADEMICA = 2 THEN 'Curso a dist�ncia'
	END 

