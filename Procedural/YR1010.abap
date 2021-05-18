*&---------------------------------------------------------------------*
*& Report YR1010
*&---------------------------------------------------------------------*
*& Nesse exemplo faremos com que aplicassemos o Inner Join
*&---------------------------------------------------------------------*
REPORT yr1010.

TABLES: yt0001,
        yt0005.

TYPES: BEGIN OF ytexit,
  tpmat TYPE yt0001-tpmat,
  denom TYPE yt0005-denom,
  denom2 TYPE yt0001-denom,
       END OF ytexit.

DATA: t_ytexit TYPE TABLE OF ytexit,
      t_yt0001 TYPE TABLE OF yt0001,
      t_yt0005 TYPE TABLE OF yt0005.

DATA: w_ytexit TYPE ytexit,
      w_yt0001 TYPE yt0001,
      w_yt0005 TYPE yt0005.

SELECT yt0005~tpmat yt0005~denom yt0001~denom
  FROM yt0005
  INNER JOIN yt0001
  ON yt0001~tpmat = yt0005~tpmat
  INTO TABLE t_ytexit.

LOOP AT t_ytexit INTO w_ytexit.
  CLEAR w_ytexit.
   w_ytexit-tpmat = w_yt0005-tpmat.
   w_ytexit-denom = w_yt0005-denom.
   w_ytexit-denom2 = w_yt0005-denom.

  APPEND w_ytexit TO t_ytexit.
ENDLOOP.
