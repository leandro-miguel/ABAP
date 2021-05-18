*&---------------------------------------------------------------------*
*& Report YR1100
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr1100.

TABLES: yfvt005.

TYPES: BEGIN OF tysaida,
  land1 LIKE yfvt005-land1,
  END OF tysaida.

DATA t_yfvt005 TYPE TABLE OF yfvt005 WITH HEADER LINE.
DATA t_saida TYPE TABLE OF tysaida WITH HEADER LINE.

SELECT * FROM yfvt005 INTO TABLE t_yfvt005.

LOOP AT t_yfvt005.
  CLEAR t_saida.
  t_saida-land1 = t_yfvt005-land1.
  APPEND t_saida.
  WRITE: / t_saida-land1, '|'.
ENDLOOP.
