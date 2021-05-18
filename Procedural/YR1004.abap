*&---------------------------------------------------------------------*
*& Report YR1004
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT YR1004.

*Tabela Transparente
TABLES t005t. "Tabela de Países

*Tabela interna
DATA: t_t005t TYPE TABLE OF t005t WITH HEADER LINE.

*Tela de seleção
PARAMETERS p_spras LIKE t005t-spras DEFAULT 'PT'.

ULINE (30).

WRITE: /01 '|',
        02 'X',
        03 '|',
        08 'Dominaçâo',
        30 '|'.

ULINE /(30).

SELECT * FROM t005t INTO TABLE t_t005t WHERE spras = p_spras.

LOOP AT t_t005t .

  WRITE: /01 '|',
          02 t_t005t-land1,
          03 '|',
          08 t_t005t-landx,
          30 '|'.

  ULINE /(30).
ENDLOOP.
