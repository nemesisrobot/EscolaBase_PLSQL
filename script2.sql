/*
Autor:Diego Silva
Data:09/04/2020
Descrição:Script com carga de dados para base
*/

--insert tabela aluno
insert into aluno values(1,'A904muife','Diego Silva','diego@gmail.com');
insert into aluno values(2,'Pekh4903','Claudineia Bayer','claudineia@gmail.com');
insert into aluno values(3,'TF23476','Marco Ivan','marco@gmail.com');
insert into aluno values(4,'aere5POIK','Liliane Freitas','liliane@gmail.com');
insert into aluno values(5,'AIDJN#W','Ronaldo Gentil','ronaldo@gmail.com');


--insert tabela disciplinas
insert into disciplinas(id,descricao) values(1,'Banco de dados');
insert into disciplinas(id,descricao) values(2,'Progamação Java');
insert into disciplinas(id,descricao) values(3,'IoT');
insert into disciplinas(id,descricao) values(4,'Big Data');


insert into disciplinas_cursadas values(1,3,3);
insert into disciplinas_cursadas values(2,1,4);
insert into disciplinas_cursadas values(3,2,2);
insert into disciplinas_cursadas values(4,4,5);