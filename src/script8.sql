/*
Autor:Diego Silva
Data:16/04/2020
Descrição:Script para criação de função para dias futuros e alterações na tabela disciplinas_cursadas
*/

CREATE OR REPLACE FUNCTION DIAS_PRA_FRENTE(
  P_DIASTRAS NUMBER
)
RETURN ALUNO.DATAMATRICULA%TYPE
IS
  v_DATE DATE;
BEGIN
    SELECT SYSDATE + P_DIASTRAS INTO v_DATE FROM DUAL;
    RETURN v_DATE;
END;

/
ALTER TABLE DISCIPLINAS_CURSADAS ADD DATA_INICIO DATE;
/
ALTER TABLE DISCIPLINAS_CURSADAS ADD DATA_FIM DATE;

/
commit;
delete from versao_sistema;
insert into versao_sistema values(1,0,0,7);
insert into script_executados values(1,0,0,7, sysdate);
commit;