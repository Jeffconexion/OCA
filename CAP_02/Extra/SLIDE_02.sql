/*[]-----------------------------------------------------------------[]*/
/*|                     CERTIFICA��O OCA                              |*/
/*|*******************************************************************|*/
/*|  BOOK.......: OCA ORACLE DATABASE       DATA..: 19.10.2018	      |*/
/*|  CAP_02.....: ORACLE	AND	STRUCTURED	QUERY	LANGUAGE (SQL)    |*/
/*|  @AUTHOR....: JEFFERSON                                           |*/
/*|  INFO.......: SLIDE 02 PROFESSOR ANDRE VIN�CUOS                   |*/
/*[]-----------------------------------------------------------------[]*/

/***************************************************************************
*----------------->SQL ORACLE: TABELAS E RESTRI��ES <----------------------
****************************************************************************/

--[ ]--> CRIANDO TABELAS <--[ ]--
CREATE TABLE PROPRIETARIO (
    CD_PROPRIETARIO   NUMBER(9),
    NM_PROPRIETARIO   VARCHAR2(50),
    DT_NASCIMENTO     DATE
)

--[ ]--> S�O CASE SENSITIVE QUANDO SOMENTE COLOCADO ENTRE ASPA DUPLA <--[ ]--

CREATE TABLE "APLICACAO FINANCEIRA"(
    CD_PROPRIETARIO   NUMBER(9),
    NM_PROPRIETARIO   VARCHAR2(50),
    DT_NASCIMENTO     DATE
);

SELECT * FROM "APLICACAO FINANCEIRA" ;

--ERRO POIS � CASE SENSITIVE QUANDO DENTRO DE ASPA DUPLA
SELECT * FROM "APLICACAO FINANCEIRA" ; 

--[ ]--> RESTRI��ES NULL OU NOT NULL <--[ ]--

CREATE TABLE TIPO_CAO (
    CD_RACA          NUMBER(9) NOT NULL,
    NM_RACA          VARCHAR2(50) NOT NULL,
    PORTE            VARCHAR2(10) NULL,
    PAIS_DE_ORIGEM   VARCHAR2(40) NULL
)

--[ ]--> ALTERANDO TABELAS  <--[ ]--
--*ADICIONAR UMA COLUNA 

CREATE TABLE EMPREGADO (
    CD_EMPREGADO   NUMBER(9)
);

ALTER TABLE EMPREGADO ADD TESTE VARCHAR2(20);

ALTER TABLE EMPREGADO ADD (
    NOME   VARCHAR2(50)
);

ALTER TABLE EMPREGADO ADD (
    NOME       VARCHAR2(50),
    TELEFONE   NUMBER(10)
);

SELECT * FROM EMPREGADO;
DESCRIBE EMPREGADO;

--*REMOVER UMA COLUNA 
ALTER TABLE EMPREGADO DROP COLUMN NOME;

ALTER TABLE EMPREGADO DROP ( NOME,
                             TELEFONE );
 
ALTER TABLE EMPREGADO SET UNUSED COLUMN NOME;

ALTER TABLE EMPREGADO SET UNUSED ( NOME,
                                   TELEFONE ); 
                                   
ALTER TABLE EMPREGADO DROP UNUSED COLUMNS ;

--*MODIFICA AS CARACTERISTICAS DE UMA COLUNA.
ALTER TABLE EMPREGADO MODIFY (
    CD_EMPREGADO NUMBER(20)
);

--OU
ALTER TABLE EMPREGADO MODIFY CD_EMPREGADO NUMBER(20);

ALTER TABLE EMPREGADO MODIFY (
    CD_EMPREADO NUMBER(15),
    NOME VARCHAR2(60)
);

--[ ]--> REMOVER TABELA  <--[ ]--
DROP TABLE EMPREGADO;

DROP TABLE EMPREGADO CASCADE CONSTRAINTS;

--[ ]--> RESTRI��ES DE CHAVE <--[ ]--
CREATE TABLE EMPREGADO (
    CD_EMPREGADO   NUMBER(9) PRIMARY KEY,
    NOME           VARCHAR2(50),
    TELEFONE       NUMBER(10)
)

CREATE TABLE EMPREGADO (
    CD_EMPREGADO   NUMBER(9)
        CONSTRAINT PK_EMPREGADO PRIMARY KEY,
    NOME           VARCHAR2(50),
    TELEFONE       NUMBER(10)
) 

CREATE TABLE EMPREGADO (
    CD_EMPREGADO   NUMBER(9),
    NOME           VARCHAR2(50),
    TELEFONE       NUMBER(10),
    CONSTRAINT PK_EMPREGADO PRIMARY KEY ( CD_EMPREGADO )
)

CREATE TABLE EMPREGADO (
    CD_EMPREGADO   NUMBER(9),
    NOME           VARCHAR2(50),
    TELEFONE       NUMBER(10),
    CONSTRAINT PK_EMPREGADO PRIMARY KEY ( CD_EMPREGADO,
                                          NOME )
)
ALTER TABLE EMPREGADO ADD CONSTRAINT PK_EMPREGADO PRIMARY KEY ( CD_EMPREGADO );

ALTER TABLE EMPREGADO ADD CONSTRAINT PK_EMPREGADO PRIMARY KEY ( CD_EMPREGADO,
                                                                NOME );
                                                                
ALTER TABLE EMPREGADO ADD PRIMARY KEY (CD_EMPREGADO); 
 
ALTER TABLE EMPREGADO MODIFY CD_EMPREGADO CONSTRAINT PK_EMPREGADO PRIMARY KEY;     

CREATE TABLE EMPREGADO (
    CD_EMPREGADO      NUMBER(9) PRIMARY KEY,
    NOME              VARCHAR2(50),
    CD_DEPARTAMENTO   NUMBER(9),
    CONSTRAINT FK_EMPREGADO FOREIGN KEY ( CD_DEPARTAMENTO )
        REFERENCES DEPARTAMENTO ( CD_DEPARTAMENTO )
)

CREATE TABLE EMPREGADO (
    CD_EMPREGADO      NUMBER(9) PRIMARY KEY,
    NOME              VARCHAR2(50),
    CD_DEPARTAMENTO   NUMBER(9)
        REFERENCES DEPARTAMENTO(CD_DEPARTAMENTO)
)

ALTER TABLE EMPREGADO
    ADD CONSTRAINT FK_EMPREGADO FOREIGN KEY ( CD_DEPARTAMENTO )
        REFERENCES DEPARTAMENTO ( CD_DEPARTAMENTO );

--[ ]--> NULL E NOT NULL   <--[ ]--
CREATE TABLE EMPREGADO (
    CD_EMPREGADO   NUMBER(9) PRIMARY KEY,
    NOME           VARCHAR2(50) NOT NULL
);

CREATE TABLE EMPREGADO (
    CD_EMPREGADO   NUMBER(9) PRIMARY KEY,
    NOME           VARCHAR2(50) NOT NULL,
    ESTADO         CHAR(2) DEFAULT ( 'SE' )
);

CREATE TABLE EMPREGADO (
    CD_EMPREGADO   NUMBER(9) PRIMARY KEY,
    NOME           VARCHAR2(50) NOT NULL,
    SEXO           CHAR(1) CHECK ( SEXO = 'M'
                         OR SEXO = 'F' )
);

ALTER TABLE EMPREGADO
    ADD CONSTRAINT CK_EMPREGADO CHECK ( ( SEXO = 'M'
                                          OR SEXO = 'F' )
                                        AND ( ESTADO = 'SE'
                                              OR ESTADO = 'AL' ) );
--[ ]--> EXCLUINDO REGRA DE NEGOCIOS <--[ ]--

ALTER TABLE EMPREGADO DROP CONSTRAINT PK_EMPREGADO;

/***************************************************************************
*----------------->SQL ORACLE:  MANIPULA��O DE DADOS  <----------------------
****************************************************************************/

INSERT INTO empregado (
    matricula,
    nome,
    sexo,
    salario,
    departamento
) VALUES (
    96345,
    'DAVID AUGUSTO',
    'M',
    1200.00,
    'TI'
);
    
--INSERT ... SELECT 
INSERT INTO EMPREGADO_FILIAL_SUL SELECT * FROM EMPREGADO WHERE SEXO = 'F'; 
 
INSERT INTO EMPREGADO_FILIAL_NORTE (MATRICULA, NOME) SELECT MATRICULA, NOME FROM EMPREGADO; 

UPDATE EMPREGADO SET SALARIO = 1500 WHERE MATRICULA = 94234;

UPDATE EMPREGADO SET SALARIO = 1500, DEPARTAMENTO = 'FI' WHERE MATRICULA = 96765;

DELETE FROM EMPREGADO WHERE SEXO = 'M' ;
 
DELETE EMPREGADO  WHERE SEXO = 'M' ;-- FROM OPCIONAL

--[ ]--> CONTROLE TRANSACIONAL <--[ ]--
--COMMIT EXPL�CITO
COMMIT;
COMMIT WORK; -- WORK � OPCIONAL. 

ROLLBACK;

/*
REPRESENTA UMA MARCA��O EM UMA TRANSA��O QUE PERMITE QUE O 
COMANDO ROLLBACK DESFA�A MODIFICA��ES DESDE A MARCA��O. 
*/

SAVEPOINT MARCA_01; 
 
ROLLBACK WORK TO MARCA_O1; 

COMMIT;

UPDATE TB_FUNCIONARIO
SET
    SALARIO = SALARIO * 1.1;

SAVEPOINT SP_1;

UPDATE TB_FUNCIONARIO
SET
    SALARIO = SALARIO * 1.2;

ROLLBACK WORK TO SP_1;

COMMIT;













