/*[]-----------------------------------------------------------------[]*/
/*|                     CERTIFICAÇÃO OCA                              |*/
/*|*******************************************************************|*/
/*|  Book.......: OCA Oracle database       Data..: 14.10.2018	      |*/
/*|  Cap_02.....: Oracle	and	Structured	Query	Language (SQL)        |*/
/*|  @Author....: Jefferson                                           |*/
/*|  Info.......: No capítulo 1 mostrou uma abordagem                 |*/
/*|               geral do que será estudado no livro.                |*/
/*[]-----------------------------------------------------------------[]*/

-- ALTERANDO TABELAS
SELECT * FROM TESTE_PORTA;

--DROP COLUNA
ALTER TABLE TESTE_PORTA DROP COLUMN CAPACIDADE;
ALTER TABLE TESTE_PORTA DROP (CAPACIDADE,QUANTIDADE);

--QUANDO TIVER CHAVE ESTRANGEIRA
ALTER TABLE PORTA DROP COLUMN PORTA_ID CASCADE CONSTRAINTS;

CREATE TABLE PESSOA(
  RG NUMBER,
  DATA DATE,
  NOME VARCHAR2(20),
  CONSTRAINT PK_PESSOA PRIMARY KEY (RG, DATA)
);

CREATE TABLE DOCUMENTO(
  ID_DOCUMENTO NUMBER,
  FK_RG NUMBER,
  FK_DATA DATE,
  CONSTRAINT FK_DOCUMENTO FOREIGN KEY (FK_RG,FK_DATA) REFERENCES PESSOA(RG,DATA)
);
ALTER TABLE PESSOA DROP COLUMN RG CASCADE CONSTRAINTS;

