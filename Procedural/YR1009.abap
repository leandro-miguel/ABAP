*&---------------------------------------------------------------------*
*& Report YR1009
*&---------------------------------------------------------------------*
*&Foi dado apenas um Select simples
*&---------------------------------------------------------------------*
REPORT yr1009.

*Criação das tabelas transparentes
TABLES: yt0001.

TYPES: BEGIN OF ytsaida,
  tpmat TYPE yt0001-tpmat,
  denom TYPE yt0001-denom,
  END OF ytsaida.

DATA: t_yt0001 TYPE TABLE OF yt0001,
      t_ytsaida TYPE TABLE OF ytsaida.

DATA: w_yt0001 TYPE yt0001,
      w_ytsaida TYPE ytsaida.

SELECT * FROM yt0001 INTO TABLE t_yt0001.

LOOP AT t_yt0001 INTO w_yt0001.
  CLEAR w_ytsaida.
  w_ytsaida-tpmat = w_yt0001-tpmat.
  w_ytsaida-denom = w_yt0001-denom.
  APPEND w_ytsaida TO t_ytsaida.
  WRITE: / w_ytsaida-tpmat, w_ytsaida-denom, '|'.
ENDLOOP.
