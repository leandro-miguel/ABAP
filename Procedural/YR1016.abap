*&---------------------------------------------------------------------*
*& Report YR1016
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr1016 NO STANDARD PAGE HEADING.

INCLUDE YI0000.

*Tabela interna com a work área
DATA: t_ydados TYPE STANDARD TABLE OF ydados WITH HEADER LINE,
      t_ycidade TYPE STANDARD TABLE OF ycidade WITH HEADER LINE,
      t_ysaida TYPE STANDARD TABLE OF ysaida WITH HEADER LINE.

*Inserindo os dados
t_ydados-codigo = 0001.
t_ydados-nome = 'Leandro'.
t_ydados-idade = 29.
t_ydados-peso = '74.63'.

INSERT t_ydados INTO TABLE t_ydados.

t_ydados-codigo = 0002.
t_ydados-nome = 'Felipe'.
t_ydados-idade = 23.
t_ydados-peso = '75.30'.

INSERT t_ydados INTO TABLE t_ydados.

t_ydados-codigo = 0003.
t_ydados-nome = 'Marcos'.
t_ydados-idade = 20.
t_ydados-peso = '71.20'.

INSERT t_ydados INTO TABLE t_ydados.

t_ycidade-codigo = 0001.
t_ycidade-nome = 'Taubaté'.

INSERT t_ycidade INTO TABLE t_ycidade.

t_ycidade-codigo = 0002.
t_ycidade-nome = 'Lorena'.

INSERT t_ycidade INTO TABLE t_ycidade.

t_ycidade-codigo = 0003.
t_ycidade-nome = 'Pindamonhangaba'.

INSERT t_ycidade INTO TABLE t_ycidade.

*Imprimindo os dados
LOOP AT t_ydados.
  WRITE: / t_ydados-codigo,'|', t_ydados-nome,'|', t_ydados-idade,'anos','|', t_ydados-peso,'kg','|'.
ENDLOOP.

SELECT t_ydados~codigo t_ydados~nome t_ydados~idade t_ydados~peso t_ycidade~nome
  FROM t_ydados
  INNER JOIN t_ycidade
  ON t_ycidade~codigo = t_ydados~codigo
  INTO TABLE t_ysaida.

*Lendo a Tabela
*READ TABLE t_ydados WITH KEY nome = 'Marcos'.
*IF sy-subrc = 0.
*  t_ydados-nome = 'Bruno'.
*  MODIFY t_ydados from t_ydados INDEX sy-tabix.
*ENDIF.
*
*Imprimindo os dados
*LOOP AT t_ydados.
*  WRITE: / t_ydados-nome,'|', t_ydados-idade,'anos','|', t_ydados-peso,'kg','|'.
*ENDLOOP.
