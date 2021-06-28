/*
Autor:Diego Silva
Data:17/04/2020
Descrição:Script para montar lista de pessoa que ainda não estão matriculadas
*/

--habilitando o uso
SET SERVEROUTPUT ON;

UPDATE ALUNO
SET DATAMATRICULA = DATAVALIDA()
WHERE ID=5;


--ATUALIZANDO  
 create global temporary table ALUNOS_NAO_MATRICULADOS(
      NOMES VARCHAR2(200),
      CODIGOS VARCHAR2(200)
);


declare
    CURSOR cur_ALUNO IS SELECT NOME, CONTATO, MATRICULA, NVL(DATAMATRICULA,'01/01/10') FROM ALUNO;
    v_NOME ALUNO.NOME%TYPE;
    v_CONTATO ALUNO.CONTATO%TYPE;
    v_MATRICULA ALUNO.MATRICULA%TYPE;
    v_DATA ALUNO.DATAMATRICULA%TYPE;
    v_QUANTIDADENULL NUMBER(10):=0;
   
begin
   
    
    OPEN cur_ALUNO;
    LOOP
        FETCH cur_ALUNO INTO v_NOME, v_CONTATO, v_MATRICULA, v_DATA;
    EXIT WHEN cur_ALUNO%NOTFOUND;
        IF v_DATA = '01/01/10' THEN
          v_QUANTIDADENULL:=v_QUANTIDADENULL+1;
          dbms_output.put_line('Nome:'||v_NOME);
          dbms_output.put_line('E-mail:'||v_CONTATO);
          dbms_output.put_line('Código'||v_MATRICULA);
          dbms_output.put_line('Código'||v_DATA);
          
          INSERT INTO ALUNOS_NAO_MATRICULADOS(NOMES,CODIGOS)
          VALUES(v_NOME,v_MATRICULA);
        END IF;
    END LOOP;
    
    CLOSE cur_ALUNO;
    
    dbms_output.put_line('Quantidade de campos null'||v_QUANTIDADENULL);
    
  --SELECT * FROM ALUNOS_NAO_MATRICULADOS;
end;



SELECT * FROM ALUNOS_NAO_MATRICULADOS;

DROP TABLE ALUNOS_NAO_MATRICULADOS;

commit;