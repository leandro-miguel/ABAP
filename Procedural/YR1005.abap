*&---------------------------------------------------------------------*
*& Report YR1005
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr1005.

*Tabela transparente
TABLES: t005u,
        t005.

*Tabela Interna
DATA: BEGIN OF t_t005u OCCURS 0,
  land1 LIKE t005u-land1,
  bland LIKE t005u-bland,
  bezei LIKE t005u-bezei,
END OF t_t005u.

*Tela de seleção
SELECTION-SCREEN BEGIN OF BLOCK b01 WITH FRAME TITLE TEXT-001.
SELECT-OPTIONS: s_LAND1 FOR t005U-land1.
SELECTION-SCREEN END OF BLOCK b01.

SELECTION-SCREEN BEGIN OF BLOCK b02 WITH FRAME TITLE TEXT-002.
SELECT-OPTIONS: s_bland FOR t005u-bland.
SELECTION-SCREEN END OF BLOCK b02.

SELECTION-SCREEN BEGIN OF BLOCK b03 WITH FRAME TITLE TEXT-003.
PARAMETERS: p_spras LIKE t005u-spras.
SELECTION-SCREEN END OF BLOCK b03.

INITIALIZATION.
s_land1-low = 'BR'.
s_land1-sign = 'I'.
s_land1-option = 'EQ'.
APPEND s_land1. CLEAR s_land1.

TOP-OF-PAGE.
PERFORM imprime_cabecalho.

START-OF-SELECTION.
PERFORM seleciona_dados.

PERFORM imprime_dados.

*&---------------------------------------------------------------------*
*& Form seleciona_dados
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM seleciona_dados .

SELECT land1 bland bezei
  FROM t005u
  INTO CORRESPONDING FIELDS OF TABLE t_t005u
  WHERE land1 IN s_land1
  AND bland IN s_bland
  AND spras = p_spras
  ORDER BY land1.

  IF sy-subrc <> 0.
    MESSAGE TEXT-003 TYPE 'I'.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form imprime_cabecalho
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM imprime_cabecalho .

    FORMAT COLOR 1.
    ULINE /(35).
    WRITE: /1 '|',
            2 'Pais',
            7 '|',
            8 'Região',
            14 '|',
            15 'Denominação',
            35 '|'.
    ULINE /(35).
    FORMAT RESET.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form imprime_dados
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM imprime_dados .
  LOOP AT t_t005u.
    WRITE: /1 '|',
            2 t_t005u-land1,
            7 '|',
            8 t_t005u-bland,
            14 '|',
            15 t_t005u-bezei,
            35 '|'.
   ULINE /(35).
  ENDLOOP.


ENDFORM.
