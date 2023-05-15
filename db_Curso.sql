create database bd_Curso;
use bd_curso;

create table tb_Instrutor(
	Cod_inst int primary key auto_increment,
    NomeInstrutor varchar(50),
    SexoInstrutor char(1),
    DataNascimento date,
    DataAdmissao date,
    SalarioInstrutor decimal (10,2)
);


insert into tb_Instrutor values (null, 'Pedro Barreiro','m', '2003-05-08','2015-11-16','15000');
insert into tb_Instrutor values (null, 'Heloisa Barreiro','f', '2005-02-26','2019-11-06','10000');
insert into tb_Instrutor values (null, 'Amanda Barreiro','f', '2006-04-03','2021-08-09','11250');
insert into tb_Instrutor values (null, 'Silvia Andrade','f', '1990-09-05','2005-07-19','5000');
insert into tb_Instrutor values (null, 'Andrea Regina','f', '1970-02-08','2005-12-25','3600');
insert into tb_Instrutor values (null, 'Fabricio Carlos','m', '1985-04-21','2015-01-11','6900');
insert into tb_Instrutor values (null, 'João Pedro','m', '1995-03-24','2016-02-12','1200');
insert into tb_Instrutor values (null, 'Bruno Silveira','m', '1987-04-19','2017-03-13','5035');
insert into tb_Instrutor values (null, 'Lucas Evangelista','m', '1975-05-20','2018-04-14','2100');
insert into tb_Instrutor values (null, 'Maria Aparecida','f', '1980-06-21','2019-05-15','1356');
insert into tb_Instrutor values (null, 'Julia Siqueira','f', '1965-07-27','2020-06-16','7855');
insert into tb_Instrutor values (null, 'Julio Cesar','m', '1975-01-01','2021-07-17','1596');
insert into tb_Instrutor values (null, 'Sara Cristina','f', '1987-09-12','2022-08-18','6963');
insert into tb_Instrutor values (null, 'Diogo Junior','m', '1945-05-01','2023-05-19','5999');
insert into tb_Instrutor values (null, 'Pietra Silva','f', '2006-04-01','2022-04-18','3256');
insert into tb_Instrutor values (null, 'Miguel Barbosa','m', '2000-07-19','2021-03-17','9508');
insert into tb_Instrutor values (null, 'Matheus Bispo','m', '2002-09-08','2020-02-16','6930');
insert into tb_Instrutor values (null, 'Karina Duarte','f', '2001-03-03','2019-01-15','1234');
insert into tb_Instrutor values (null, 'Andressa Oliveira','f', '1999-02-21','2018-07-28','11326');
insert into tb_Instrutor values (null, 'Jonas Madureira','m', '1987-06-17','2015-11-16','3489');
select * from tb_Instrutor;

alter table tb_Instrutor add column Email varchar(50);
alter table tb_Instrutor add column Celular varchar(20);
alter table tb_Instrutor add column Nacionalidade varchar(20);
select * from tb_Instrutor;

alter table tb_Instrutor drop column DataNascimento;

update tb_Instrutor set nacionalidade ='Brasileira';
select * from tb_Instrutor;

update  tb_Instrutor set SalarioInstrutor = SalarioInstrutor +'320' where DataAdmissao < '2013-01-01';

update  tb_Instrutor set SalarioInstrutor = SalarioInstrutor +'100' where SexoInstrutor = 'f';

delete from tb_Instrutor where Cod_inst = 10;
delete from tb_Instrutor where Cod_inst = 15;
delete from tb_Instrutor where Cod_inst = 20;
select * from tb_Instrutor;
