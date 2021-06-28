/*
Autor:Diego Silva
Data:13/04/2020
Descrição:Script de criação de procedure para insert de disciplinas
*/
create or replace procedure insert_disciplina(
    p_ID in disciplinas.id%type,
    p_DESCRICAO in disciplinas.descricao%type
)
is
begin
  insert into disciplinas
  values(p_ID,p_DESCRICAO);
  commit;
end;