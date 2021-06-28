/*
Autor:Diego Silva
Data:15/04/2020
Descrição:
*/

--criando tabela para versão atual
create table versao_sistema(
	versao number(10) not null,
	funcionalidade number(10) not null,
	alteracao number(10) not null,
	correcao number(10) not null 
);

--criando tabela para armazenar scripts armazenados
create table script_executados(
	versao number(10) not null,
	funcionalidade number(10) not null,
	alteracao number(10) not null,
	correcao number(10) not null,
	data_execucao date not null
);

--coomit das alterações
commit;
delete from versao_sistema;
insert into versao_sistema values(1,0,0,0);
insert into script_executados values(1,0,0,0, sysdate);
commit;