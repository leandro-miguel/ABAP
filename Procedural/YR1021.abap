*&---------------------------------------------------------------------*
*& Report YR1021
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr1021.

TYPE-POOLS: vrm.

TABLES: ytem0001.

DATA: it_list TYPE vrm_values,
      list_value TYPE vrm_value,
      variavel type n.

TYPES: BEGIN OF tabela,
        text(10) TYPE c,
        key TYPE n,
  END OF tabela.

DATA: ti_tabela TYPE TABLE OF tabela WITH HEADER LINE,
      ti_saida TYPE TABLE OF yet0001 WITH HEADER LINE.

PARAMETERS: p_ycodc LIKE ytem0003-ycodc,
            p_ynome LIKE ytem0003-ynome.

*Parametros de seleção
SELECTION-SCREEN BEGIN OF BLOCK part01 WITH FRAME.
  PARAMETERS: p_per TYPE c AS LISTBOX VISIBLE LENGTH 10.
SELECTION-SCREEN END OF BLOCK part01.

*Inicialização.
INITIALIZATION.
  PERFORM: move_dados,
           carrega_combo,
           executa_comandos.
*&---------------------------------------------------------------------*
*& Form move_dados
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM move_dados .
  IF p_per IS INITIAL.
    PERFORM insert_saida USING: 'Insert' 1,
                                'Update' 2,
                                'Modify' 3,
                                'Delete' 4.
    ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form insert_periodo
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> P_
*&      --> P_01
*&---------------------------------------------------------------------*

FORM insert_saida  USING    VALUE(nome)
                            VALUE(numero).
  ti_saida-ymnom = nome.
  ti_saida-ymnum = numero.
  APPEND ti_saida.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form carrega_combo
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*

FORM carrega_combo .
  LOOP AT ti_saida.
    list_value-key = ti_saida-ymnum.
    list_value-text = ti_saida-ymnom.
    APPEND list_value TO it_list.
  ENDLOOP.

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id                    = 'P_PER'
      values                = it_list
*   EXCEPTIONS
*     ID_ILLEGAL_NAME       = 1
*     OTHERS                = 2
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form executa_comandos
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM executa_comandos .
* READ TABLE it_list INTO ti_saida WITH KEY key = ti_saida-ymnum.
*    IF p_per = ti_saida-ymnum.
*      MESSAGE 'OK' TYPE 'S'.
*    ELSE.
*      MESSAGE 'FAIL' TYPE 'S'.
*    ENDIF.
  LOOP AT ti_saida.
    CLEAR ti_tabela.
    ti_tabela-text = ti_saida-ymnom.
    ti_tabela-key = ti_saida-ymnum.
    APPEND ti_tabela.
  ENDLOOP.

  LOOP AT ti_tabela.
  READ TABLE ti_tabela INTO ti_saida WITH KEY key = ti_tabela-key.
  IF sy-subrc = 0.
    variavel = ti_tabela-key.
  ENDIF.
  ENDLOOP.

  IF variavel = p_per.
    MESSAGE 'OK' TYPE 'S'.
  ELSE.
    MESSAGE 'FAIL' TYPE 'S'.
  ENDIF.
ENDFORM.
