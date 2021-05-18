*&---------------------------------------------------------------------*
*& Report YR1101
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr1101.

DATA: BEGIN OF line,
  col1 TYPE i,
  col2 TYPE i,
  END OF line.

DATA: itab LIKE STANDARD TABLE OF line,
      jtab LIKE SORTED TABLE OF line WITH NON-UNIQUE KEY col1 col2.

DO 3 TIMES.
  line-col1 = sy-index.
  line-col2 = sy-index ** 2.
  APPEND line TO itab.

  line-col1 = sy-index.
  line-col2 = sy-index ** 3.
  APPEND line TO jtab.
ENDDO.

INSERT LINES OF itab INTO TABLE jtab.

LOOP AT jtab INTO line.
  WRITE: / sy-tabix, line-col1, line-col2.

ENDLOOP.
