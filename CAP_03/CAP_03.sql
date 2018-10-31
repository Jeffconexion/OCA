/*[]-----------------------------------------------------------------[]*/
/*|                     CERTIFICAÇÃO OCA                              |*/
/*|*******************************************************************|*/
/*|  Book.......: OCA Oracle database       Data..: 31.10.2018	      |*/
/*|  Cap_02.....: Oracle	and	Structured	Query	Language (SQL)    |*/
/*|  @Author....: Jefferson                                           |*/
/*|  Info.......: No capítulo 1 mostrou uma abordagem                 |*/
/*|               geral do que será estudado no livro.                |*/
/*[]-----------------------------------------------------------------[]*/

--[ ]--> TRUNCATE	DATA <--[ ]--
TRUNCATE	TABLE	"aplicacao financeira";

--TABELA FILHO ORACLE 12C
TRUNCATE	TABLE	VENDORS	CASCADE;

CREATE TABLE PORTA(
    ID NUMBER PRIMARY KEY,
    NOME VARCHAR2(20),
    PAIS VARCHAR2(20)
);


CREATE TABLE CRUZEIRO(
    ID NUMBER,
    PORTA_ID NUMBER,
    NOME VARCHAR2(20),
    CONSTRAINT FK_PORTA FOREIGN KEY (PORTA_ID)
                        REFERENCES PORTA(ID)
                        ON DELETE CASCADE
);

CREATE TABLE TESTE(
    ID NUMBER,
    CONSTRAINT FK_TESTE FOREIGN KEY (ID) REFERENCES PORTA(ID)
);

-- FUNCIONA SOMENTE NO ORACLE 12C
TRUNCATE TABLE PORTA CASCADE ;


----->*******INSERT INTO TESTE VALUES(1)***********<-------;


INSERT INTO PORTA VALUES(1,'JE','BR');
INSERT INTO CRUZEIRO VALUES(10,1,'ATLANTICO');


SELECT * FROM PORTA;
SELECT * FROM CRUZEIRO;
SELECT * FROM TESTE;

DROP TABLE PORTA;


