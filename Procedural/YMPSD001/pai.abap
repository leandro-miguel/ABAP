MODULE select_row.
 CALL METHOD go_alv_tm->get_selected_rows
    IMPORTING
      et_index_rows = lt_rows[]
*      et_row_no     =
      .
ENDMODULE.

*&---------------------------------------------------------------------*
*& Include          YMP002I01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  EXIT_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE exit_0100 INPUT.

  CALL SCREEN 0700.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  EXIT_0700  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE exit_0700 INPUT.

  LEAVE PROGRAM.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0700  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0700 INPUT.
  CASE sy-ucomm.
    WHEN 'EXECUTE'.
      PERFORM select_table_pdc.
    WHEN 'TIPOMAT.'.
      CALL SCREEN 0100. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'EMPRESA'.
      CALL SCREEN 0200. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'GR.COMPRAS'.
      CALL SCREEN 0300. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'FORNECEDOR'.
      CALL SCREEN 0400. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'MATERIAL'.
      CALL SCREEN 0500. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'C.P.COMPRA'.
      CALL SCREEN 0600. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'ITEM.P.C'.
      CALL SCREEN 0700. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0500  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0500 INPUT.
      CASE sy-ucomm.
    WHEN 'EXECUTE'.
      PERFORM select_table_ma.
    WHEN 'TIPOMAT.'.
      CALL SCREEN 0100. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'EMPRESA'.
      CALL SCREEN 0200. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'GR.COMPRAS'.
      CALL SCREEN 0300. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'FORNECEDOR'.
      CALL SCREEN 0400. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'MATERIAL'.
      CALL SCREEN 0500. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'C.P.COMPRA'.
      CALL SCREEN 0600. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'ITEM.P.C'.
      CALL SCREEN 0700. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
  ENDCASE.

  CLEAR sy-ucomm.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  EXIT_0500  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE exit_0500 INPUT.

  CALL SCREEN 0700.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  EXIT_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE exit_0200 INPUT.

  CALL SCREEN 0700.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  EXIT_0300  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE exit_0300 INPUT.

  CALL SCREEN 0700.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  EXIT_0400  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE exit_0400 INPUT.

  CALL SCREEN 0700.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  EXIT_0600  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE exit_0600 INPUT.

  CALL SCREEN 0700.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'EXECUTE'.
      PERFORM select_table_tm.
      v_dynnr = '0001'.
    WHEN 'ATUALIZA'.
      PERFORM select_table_tm.
    WHEN 'TIPOMAT.'.
      CALL SCREEN 0100. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'EMPRESA'.
      CALL SCREEN 0200. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'GR.COMPRAS'.
      CALL SCREEN 0300. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'FORNECEDOR'.
      CALL SCREEN 0400. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'MATERIAL'.
      CALL SCREEN 0500. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'C.P.COMPRA'.
      CALL SCREEN 0600. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'ITEM.P.C'.
      CALL SCREEN 0700. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'BOT_CTM'.
      v_dynnr = '0101'.
    WHEN 'BOT_OK'.
      IF r_insert = 'X'.
        INSERT INTO yt0001 VALUES w_yt0001.
        IF sy-subrc = 0.
           MESSAGE 'Dados inseridos com sucesso!' TYPE 'I'.
           PERFORM select_table_tm.
           CLEAR w_yt0001.
        ELSE.
          MESSAGE 'Dados não inseridos!' TYPE 'I'.
          CLEAR w_yt0001.
        ENDIF.
      ENDIF.
      IF r_modify = 'X'.
        UPDATE yt0001 FROM w_yt0001.
        IF sy-subrc = 0.
           MESSAGE 'Dados modificados com sucesso!' TYPE 'I'.
           PERFORM select_table_tm.
           CLEAR w_yt0001.
        ELSE.
          MESSAGE 'Dados não modificados!' TYPE 'I'.
          CLEAR w_yt0001.
        ENDIF.
      ENDIF.
      "IF r_delete = 'X'.
      IF lt_rows[] is INITIAL.
        delete yt0001 FROM ls_row.
      ENDIF.
*        DELETE yt0001 FROM w_yt0001.
*        IF sy-subrc = 0.
*           MESSAGE 'Dados deletados com sucesso!' TYPE 'I'.
*           PERFORM select_table_tm.
*        ELSE.
*          MESSAGE 'Dados não deletados!' TYPE 'I'.
*        ENDIF.
*      ENDIF.
  ENDCASE.
  CLEAR sy-ucomm.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.
    CASE sy-ucomm.
    WHEN 'EXECUTE'.
      PERFORM select_table_em.
      v_dynnr = '0001'.
    WHEN 'ATUALIZA'.
      PERFORM select_table_em.
    WHEN 'TIPOMAT.'.
      CALL SCREEN 0100. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'EMPRESA'.
      CALL SCREEN 0200. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'GR.COMPRAS'.
      CALL SCREEN 0300. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'FORNECEDOR'.
      CALL SCREEN 0400. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'MATERIAL'.
      CALL SCREEN 0500. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'C.P.COMPRA'.
      CALL SCREEN 0600. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'ITEM.P.C'.
      CALL SCREEN 0700. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'BOT_EE'.
      v_dynnr = '0201'.
    WHEN 'BOT_OK'.
      IF r_insert = 'X'.
        INSERT INTO yt0002 VALUES w_yt0002.
        IF sy-subrc = 0.
           MESSAGE 'Dados inseridos com sucesso!' TYPE 'I'.
           PERFORM select_table_em.
        ELSE.
          MESSAGE 'Dados não inseridos!' TYPE 'I'.
        ENDIF.
      ENDIF.
      IF r_modify = 'X'.
        UPDATE yt0002 FROM w_yt0002.
        IF sy-subrc = 0.
           MESSAGE 'Dados modificados com sucesso!' TYPE 'I'.
           PERFORM select_table_em.
        ELSE.
          MESSAGE 'Dados não modificados!' TYPE 'I'.
        ENDIF.
      ENDIF.
      IF r_delete = 'X'.
        "DELETE yt0002 from w_yt0002.
        IF sy-subrc = 0.
           MESSAGE 'Dados deletados com sucesso!' TYPE 'I'.
           PERFORM select_table_em.
        ELSE.
          MESSAGE 'Dados não deletados!' TYPE 'I'.
        ENDIF.
      ENDIF.
  ENDCASE.
  CLEAR sy-ucomm.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0300  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0300 INPUT.
   CASE sy-ucomm.
    WHEN 'EXECUTE'.
      PERFORM select_table_gc.
      v_dynnr = '0001'.
    WHEN 'ATUALIZA'.
      PERFORM select_table_gc.
    WHEN 'TIPOMAT.'.
      CALL SCREEN 0100. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'EMPRESA'.
      CALL SCREEN 0200. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'GR.COMPRAS'.
      CALL SCREEN 0300. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'FORNECEDOR'.
      CALL SCREEN 0400. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'MATERIAL'.
      CALL SCREEN 0500. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'C.P.COMPRA'.
      CALL SCREEN 0600. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'ITEM.P.C'.
      CALL SCREEN 0700. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'BOT_CTM'.
      v_dynnr = '0101'.
*    WHEN 'BOT_OK'.
*      IF r_insert = 'X'.
*        INSERT INTO yt0002 VALUES w_yt0002.
*        IF sy-subrc = 0.
*           MESSAGE 'Dados inseridos com sucesso!' TYPE 'I'.
*           PERFORM select_table_em.
*        ELSE.
*          MESSAGE 'Dados não inseridos!' TYPE 'I'.
*        ENDIF.
*      ENDIF.
*      IF r_modify = 'X'.
*        UPDATE yt0002 FROM w_yt0002.
*        IF sy-subrc = 0.
*           MESSAGE 'Dados modificados com sucesso!' TYPE 'I'.
*           PERFORM select_table_em.
*        ELSE.
*          MESSAGE 'Dados não modificados!' TYPE 'I'.
*        ENDIF.
*      ENDIF.
*      IF r_delete = 'X'.
*        DELETE yt0002 FROM w_yt0002.
*        IF sy-subrc = 0.
*           MESSAGE 'Dados deletados com sucesso!' TYPE 'I'.
*           PERFORM select_table_em.
*        ELSE.
*          MESSAGE 'Dados não deletados!' TYPE 'I'.
*        ENDIF.
*      ENDIF.
  ENDCASE.
  CLEAR sy-ucomm.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0400  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0400 INPUT.

    CASE sy-ucomm.
    WHEN 'EXECUTE'.
      "PERFORM select_table_pdc.
    WHEN 'TIPOMAT.'.
      CALL SCREEN 0100. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'EMPRESA'.
      CALL SCREEN 0200. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'GR.COMPRAS'.
      CALL SCREEN 0300. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'FORNECEDOR'.
      CALL SCREEN 0400. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'MATERIAL'.
      CALL SCREEN 0500. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'C.P.COMPRA'.
      CALL SCREEN 0600. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'ITEM.P.C'.
      CALL SCREEN 0700. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
  ENDCASE.

  CLEAR sy-ucomm.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0600  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0600 INPUT.

      CASE sy-ucomm.
    WHEN 'EXECUTE'.
      PERFORM select_table_pdc.
    WHEN 'TIPOMAT.'.
      CALL SCREEN 0100. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'EMPRESA'.
      CALL SCREEN 0200. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'GR.COMPRAS'.
      CALL SCREEN 0300. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'FORNECEDOR'.
      CALL SCREEN 0400. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'MATERIAL'.
      CALL SCREEN 0500. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'C.P.COMPRA'.
      CALL SCREEN 0600. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
    WHEN 'ITEM.P.C'.
      CALL SCREEN 0700. "STARTING AT 125 1 ENDING AT 222 30 .
      "STARTING AT 125 1 ENDING AT 222 31 .
  ENDCASE.

  CLEAR sy-ucomm.

ENDMODULE.