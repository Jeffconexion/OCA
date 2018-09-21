/*[]-----------------------------------------------------------------[]*/
/*|                     CERTIFICAÇÃO OCA                              |*/
/*|*******************************************************************|*/
/*|  Book.......: OCA Oracle database       Data..: 21.09.2018	      |*/
/*|  Cap_01.....: Oracle	and	Structured	Query	Language (SQL)        |*/
/*|  @Author....: Jefferson                                           |*/
/*|  Info.......: No capítulo 1 mostrou uma abordagem                 |*/
/*|               geral do que será estudado no livro.                |*/
/*[]-----------------------------------------------------------------[]*/

-- CRIANDO TABELA
CREATE TABLE NAVIOS(
  NAVIO_ID NUMBER,
  NAVIO_NOME VARCHAR2(20),
  CAPACIDADE NUMBER,
  COMPRIMENTO NUMBER
);

-- INSERINDO
INSERT INTO NAVIOS(NAVIO_ID,NAVIO_NOME,CAPACIDADE,COMPRIMENTO)VALUES(1, 'CODD CRISTAL',2052, 855);

-- CRIANDO UMA CONSULTA
SELECT NAVIO_NOME,CAPACIDADE,COMPRIMENTO FROM NAVIOS;