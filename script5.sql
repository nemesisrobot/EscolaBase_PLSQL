/*
Autor:Diego Silva
Data:14/04/2020
Descrição:Script para criação de nova funçção alteração de tabelas e procs
*/


alter table aluno MODIFY contato char(55);

/
alter table aluno ADD datamatricula date;
/
create or replace function datavalida
return ALUNO.DATAMATRICULA%type
is
  v_DATE date;
begin
  select sysdate into v_DATE from dual;
  return v_DATE;
end;

/
--alterando procedure insert_aluno colocando mais um campo para o insert usando a função datavalida
create or replace procedure insert_aluno(
  p_MATRICULA in aluno.matricula%type,
  p_NOME in aluno.nome%type,
  p_CONTATO in aluno.contato%type
)
is 
  v_ID NUMBER(3);
  v_DATAMATRICULA date;
begin
  select max(ID) into v_ID from aluno;
  select DATAVALIDA into v_DATAMATRICULA from dual;
  insert into aluno
  values((v_ID+1),upper(p_MATRICULA),upper(p_NOME),p_CONTATO,v_DATAMATRICULA);
  
  commit;
end;

/
create or replace procedure insert_disciplinas_cursadas(
  p_ID in DISCIPLINAS_CURSADAS.ID%type,
  p_DISCIPLINAS_ID  in DISCIPLINAS_CURSADAS.DISCIPLINAS_ID%type, 
  p_ALUNO_ID in DISCIPLINAS_CURSADAS.ALUNO_ID%type
)
is
begin
  insert into DISCIPLINAS_CURSADAS
  values(p_ID,p_DISCIPLINAS_ID,p_ALUNO_ID);
  
  commit;
end;




