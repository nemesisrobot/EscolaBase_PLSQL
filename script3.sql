/*
Autor:Diego Silva
Data:13/04/2020
Descrição:Script de criação de procedure para insert de alunos
*/
create or replace procedure insert_aluno(
  p_ID in aluno.id%type,
  p_MATRICULA in aluno.matricula%type,
  p_NOME in aluno.nome%type,
  p_CONTATO in aluno.contato%type
)
is
begin
  insert into aluno
  values(p_ID,upper(p_MATRICULA),upper(p_NOME),p_CONTATO);
  
  commit;
end;
