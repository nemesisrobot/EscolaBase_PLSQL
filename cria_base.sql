/*
Autor:Diego Silva
Data:14/07/2020
Descrição: Script para gerar base de dados
*/

--criando tabelas de aplicacao, funcionalidade e tipos
create table cas_mp_aplicacao(
	id_aplicacao int not null primary key,
	nome_aplicacao varchar2(200) not null,
	modulo_aplicacao varchar2(200) ,
	descricao_aplicacao varchar2(500) not null
);


create table cas_mp_tipo(
	id_tipo int not null primary key,
	nome_tipo varchar2(100) not null,
	descricao_tipo varchar2(500) not null
);

create table cas_mp_funcionalidade(
	id_funcionalidade int not null primary key,
	nome_funcionalidade varchar2(200) not null,
	descricao_funcionaldiade varchar2(500) not null,
	aplicacao_id int not null,
	tipo_id int not null,
	automatizado char(1) not null,
	tem_manual char(1) not null
);

commit;

--fazendo relacionamento entre tabelas
alter table cas_mp_funcionalidade add constraint fk_funcionalidade_aplicacao foreign key (aplicacao_id) references cas_mp_aplicacao(id_aplicacao);

alter table cas_mp_funcionalidade add constraint fk_funcionalidade_tipo foreign key (tipo_id) references cas_mp_tipo(id_tipo);

commit;