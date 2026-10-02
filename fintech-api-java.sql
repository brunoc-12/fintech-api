
--CRIANDO ESTRUTURA DO SQL DA FINTECH.

--criando a tabela que iniciará a tabela da fintech.
CREATE TABLE T_USUARIO
(

id_usuario  NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
cd_nome VARCHAR2(100 CHAR) NOT NULL,
cd_email VARCHAR2(50 CHAR) NOT NULL,
cd_telefone VARCHAR2 (15)


);

COMMIT;

-- Tabela de conta com foreign key
CREATE TABLE T_CONTAFINTECH
(
 id_conta NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 nm_conta VARCHAR2(50 CHAR) NOT NULL,
 cd_emailconta VARCHAR2(100 CHAR) NOT NULL,
 cd_telefoneconta VARCHAR2(100) NOT NULL,
 id_usuario NUMBER NOT NULL,
 CONSTRAINT fk_usuario FOREIGN KEY (id_usuario)
    REFERENCES t_usuario (id_usuario)
);
    
    
COMMIT;





CREATE TABLE T_CATEGORIA_FINTECH
(
id_categoria NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
cd_conta  VARCHAR2(50 CHAR)NOT NULL,
cd_categoria VARCHAR2(50 CHAR)NOT NULL,
nm_usuariocat VARCHAR2(50 CHAR) NOT NULL,
 st_categoria CHAR(1) DEFAULT 's' NOT NULL,
 dt_categoria VARCHAR2(50),
  id_usuario NUMBER NOT NULL,
  CONSTRAINT usuario_fk FOREIGN KEY (id_usuario)
    REFERENCES t_usuario (id_usuario)
    );
    
    
    COMMIT;
    
    CREATE TABLE T_TRANSACAO_FINTECH
    (
    id_transacoa  NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    id_conta NUMBER NOT NULL,
     id_categoria  NUMBER NOT NULL,
    ct_transacao VARCHAR2 (100 CHAR) NOT NULL,
    vl_transacao NUMBER(20,2) NOT NULL,
    tp_transacao VARCHAR2 (30 CHAR) NOT NULL,
    ds_transacao VARCHAR2 (100 CHAR) NOT NULL,
    dt_transacao DATE NOT NULL,
    dt_registro DATE NOT NULL,
    st_transacao CHAR(1) DEFAULT 's' NOT NULL,
      CONSTRAINT fk_transacao_conta FOREIGN KEY (id_conta)
    REFERENCES t_contafintech (id_conta),
 CONSTRAINT fk_transacao_categoria FOREIGN KEY (id_categoria)
    REFERENCES t_categoria_fintech (id_categoria)
    );


COMMIT;
 

