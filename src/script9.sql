/*
Autor:Diego Silva
Data:16/04/2020
Descrição:Alteração na procedure de insert_disciplinas_cursadas e criando procedure para atualziar das null
*/

--removido parâmetro ID e coloca parâmetro para dias pra frente
create or replace procedure insert_disciplinas_cursadas(
  p_DISCIPLINAS_ID  in DISCIPLINAS_CURSADAS.DISCIPLINAS_ID%type, 
  p_ALUNO_ID in DISCIPLINAS_CURSADAS.ALUNO_ID%type,
  p_DIAS_FRENTE in number
)
is
  --criando variaveis para campos de ID, data inicio e fim das displinas cursadas
  v_ID DISCIPLINAS_CURSADAS.ID%TYPE;
  v_dateinit DISCIPLINAS_CURSADAS.DATA_INICIO%TYPE;
  v_datefim DISCIPLINAS_CURSADAS.DATA_FIM%TYPE;
begin
  --INICIALZIANDO VARIAVEIS COM SELECT'S
  SELECT MAX(ID) INTO v_ID FROM DISCIPLINAS_CURSADAS;
  SELECT DIAS_PRA_FRENTE(0) into v_dateinit from dual;
  SELECT DIAS_PRA_FRENTE(p_DIAS_FRENTE) into v_datefim from dual;
  
  --FAZENDO INSERT TABELA
  insert into DISCIPLINAS_CURSADAS
  values((v_ID+1),p_DISCIPLINAS_ID,p_ALUNO_ID,v_dateinit,v_datefim);
  
  commit;
end;

/
--criando procedure para atualziar datas
CREATE OR REPLACE PROCEDURE CORRIGI_NULL_DATA
IS
  v_DATAMATRICULA ALUNO.MATRICULA%TYPE;
  v_DATAINI DISCIPLINAS_CURSADAS.DATA_INICIO%TYPE;
  v_DATAFIM DISCIPLINAS_CURSADAS.DATA_FIM%TYPE;
BEGIN
    --SETANDO VALOR DAS VARIAVEIS
    v_DATAMATRICULA:=DATAVALIDA();
    v_DATAINI:=v_DATAMATRICULA;
    v_DATAFIM:= DIAS_PRA_FRENTE(10);
    
    --ATUALIZANDO DATAS DE MATRICULA
    UPDATE ALUNO
    SET DATAMATRICULA=v_DATAMATRICULA
    WHERE DATAMATRICULA IS NULL;
    
    --ATUALIZANDO DA INICIO DAS DISCIPLINAS CURSADAS
    UPDATE DISCIPLINAS_CURSADAS
    SET DATA_INICIO=v_DATAINI
    WHERE DATA_INICIO IS NULL;
    
    
    --ATUALIZANDO DA INICIO DAS DISCIPLINAS CURSADAS
    UPDATE DISCIPLINAS_CURSADAS
    SET DATA_FIM=v_DATAFIM
    WHERE DATA_FIM IS NULL;
    
    COMMIT;
END;

/

--craindo campo valor para as disciplinas
alter table disciplinas add valor decimal(10,2);

/

--atualizando valor das disciplinas
update disciplinas
set valor = 1250.50
where id = 1;

update disciplinas
set valor = 780.85
where id = 2;

update disciplinas
set valor = 2500.99
where id = 3;

update disciplinas
set valor = 2000
where id = 4;

commit;
delete from versao_sistema;
insert into versao_sistema values(1,0,0,8);
insert into script_executados values(1,0,0,8, sysdate);
commit;