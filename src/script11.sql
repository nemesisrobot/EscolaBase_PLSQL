/*
Autor:Diego Silva
Data:23/04/2020
Descrição:Script com criação de tabela de boletos escolares
*/

--criando tabela de dividas escolares
create table boletos(
	id number(3) primary key not null,
	aluno_id number(3) not null,
	numero_boleto number(3) not null,
	vencimento date not null,
	disciplinas_id number(3) not null,
	boleto_pago char(1)
);

--criando relacionamento
alter table boletos add constraint fk_boleto_aluno foreign key(aluno_id) references aluno(id);
alter table boletos add constraint fk_boleto_disciplinas foreign key(disciplinas_id) references disciplinas(id);

COMMIT;

/


create or replace procedure insert_boletos(
    p_ID in BOLETOS.ID%TYPE,
    p_ALUNO in BOLETOS.ALUNO_ID%TYPE,
    p_NUMEROBOLETO in BOLETOS.NUMERO_BOLETO%TYPE,
    p_DATAVENCI in BOLETOS.VENCIMENTO%TYPE,
    p_DISCIPLINA in BOLETOS.DISCIPLINAS_ID%TYPE
)
is
begin
  INSERT INTO BOLETOS(ID,ALUNO_ID,NUMERO_BOLETO,VENCIMENTO,DISCIPLINAS_ID) 
  VALUES(p_ID,p_ALUNO,p_NUMEROBOLETO,p_DATAVENCI,p_DISCIPLINA);
  COMMIT;
end;

COMMIT;
DELETE FROM VERSAO_SISTEMA;
INSERT INTO VERSAO_SISTEMA VALUES(1,0,0,9);
INSERT INTO SCRIPT_EXECUTADOS VALUES(1,0,0,9,SYSDATE);
COMMIT;
