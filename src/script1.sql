create table aluno(
	id number(10) primary key not null,
	matricula varchar2(200) not null,
	nome varchar2(200) not null,
	contato char(20) not null
);

/
create table disciplinas(
	id number(10) primary key not null,
	descricao varchar2(100) not null
);

/
create table disciplinas_cursadas(

	id number(10) primary key not null,
	disciplinas_id number(10) not null,
	aluno_id number(10) not null
);
/
alter table disciplinas_cursadas add constraint fk_disciplinas foreign key(disciplinas_id) references disciplinas(id);
alter table disciplinas_cursadas add constraint fk_aluno foreign key(aluno_id) references aluno(id);

commit;
