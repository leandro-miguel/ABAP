*&---------------------------------------------------------------------*
*& Report YR1008
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT YR1008.

DATA: l TYPE c,
      t TYPE c,
      done.

PARAMETERS: p(25) DEFAULT 'Vendor Number'.

WHILE done = ' '
 vary l from p(1) next p+1(1) RANGE p

vary t from p+24(1) next p+23(1) RANGE p.

IF l = ' ' and t = ' '.
  l = t = '-'.
ELSE.
  done = 'X'.
ENDIF.

ENDWHILE.

WRITE: / p.
