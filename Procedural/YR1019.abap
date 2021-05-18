REPORT yr1019.

TYPE-POOLS: vrm.

DATA: it_list TYPE vrm_values,
      list_value TYPE vrm_value.

*Tabelas internas
DATA: BEGIN OF periodo OCCURS 0,
  mnom(9) TYPE c, "Nome mês
  mnum TYPE i, "Número mês
  END OF periodo.

*Parametros de seleção
SELECTION-SCREEN BEGIN OF BLOCK part01 WITH FRAME.
  PARAMETERS: p_per TYPE c AS LISTBOX VISIBLE LENGTH 12.
SELECTION-SCREEN END OF BLOCK part01.

*Inicialização.
INITIALIZATION.
  PERFORM move_dados.
  PERFORM carrega_combo.
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
    PERFORM insert_periodo USING: 'Janeiro' 01,
                                  'Fevereiro' 02,
                                  'Março' 03,
                                  'Abril' 04,
                                  'Maio' 05,
                                  'Junho' 06,
                                  'Julho' 07,
                                  'Agosto' 08,
                                  'Setembro' 09,
                                  'Outubro' 10,
                                  'Novembro' 11,
                                  'Dezembro' 12.
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
FORM insert_periodo  USING    VALUE(nome)
                              VALUE(numero).
  periodo-mnom = nome.
  periodo-mnum = numero.
  APPEND periodo.

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
  LOOP AT periodo.
    list_value-key = periodo-mnum.
    list_value-text = periodo-mnom.
    APPEND list_value to it_list.
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
