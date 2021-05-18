*&---------------------------------------------------------------------*
*& Report YR1020
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr1020.
*----------------------------------------------------------------------*
*Chamando a Tabela Transparente                                                                      *
*----------------------------------------------------------------------*
TABLES: t005.

*----------------------------------------------------------------------*
*Criando a tabela interna                                                                      *
*----------------------------------------------------------------------*
DATA: ti_005 TYPE TABLE OF t005,
      t_saida type table of ystravel,
      t_header TYPE slis_t_listheader,
      t_fieldcat TYPE slis_t_fieldcat_alv,
      t_sort TYPE slis_t_sortinfo_alv.

*----------------------------------------------------------------------*
*Criando a work área                                                                      *
*----------------------------------------------------------------------*
DATA: w_005 TYPE t005,
      w_saida type ystravel,
      w_layout TYPE slis_layout_alv,
      w_header TYPE slis_listheader,
      w_fieldcat TYPE slis_fieldcat_alv,
      w_sort TYPE slis_sortinfo_alv.

**********************************************************************
*Tela de seleção
**********************************************************************

*SELECTION-SCREEN BEGIN OF BLOCK bc02 WITH FRAME TITLE TEXT-002.
*  PARAMETERS:
*            p_nome LIKE ytadt_001-nome,
*            p_sob LIKE ytadt_001-sobrenome,
*            p_cidade LIKE ytadt_001-cidade.
*  SELECTION-SCREEN END OF BLOCK bc02.

  START-OF-SELECTION.

**********************************************************************
*Performs
**********************************************************************
PERFORM:
         f_seleciona_dados,
         f_monta_tabela_alv,
         f_monta_alv.
*&---------------------------------------------------------------------*
*& Form f_seleciona_dados
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_seleciona_dados .
  SELECT * FROM t005 INTO TABLE ti_005.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_monta_tabela_alv
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_monta_tabela_alv .
    LOOP AT ti_005 INTO w_005.
    CLEAR w_saida.
    w_saida-pais = w_005-lkvrz.
    w_saida-moeda = w_005-waers.
    APPEND w_saida TO t_saida.
  ENDLOOP.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_monta_alv
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_monta_alv.
  PERFORM: f_define_fieldcat,
           f_ordena,
           f_layout,
           f_cabecalho,
           f_imprime_alv.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_define_fieldcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_define_fieldcat .
  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
  EXPORTING
   i_program_name               = sy-repid
   i_internal_tabname           = 'T_SAIDA'
   i_structure_name             = 'YSTRAVEL'
*   I_CLIENT_NEVER_DISPLAY       = 'X'
*   I_INCLNAME                   =
*   I_BYPASSING_BUFFER           =
*   I_BUFFER_ACTIVE              =
  CHANGING
    ct_fieldcat                  = t_fieldcat
 EXCEPTIONS
   inconsistent_interface       = 1
   program_error                = 2
   OTHERS                       = 3
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
  MESSAGE TEXT-006 TYPE 'I'.
  STOP.

ELSE.

  LOOP AT t_fieldcat INTO w_fieldcat.
    CASE w_fieldcat-fieldname .
      WHEN 'LKVRZ'.
        w_fieldcat-seltext_s = w_fieldcat-seltext_m = w_fieldcat-seltext_l = w_fieldcat-reptext_ddic = TEXT-004.
      WHEN 'WAERS'.
        w_fieldcat-seltext_s = w_fieldcat-seltext_m = w_fieldcat-seltext_l = w_fieldcat-reptext_ddic = TEXT-005.
    ENDCASE.
    MODIFY t_fieldcat FROM w_fieldcat INDEX sy-tabix TRANSPORTING seltext_s seltext_m seltext_l reptext_ddic.
   ENDLOOP.
ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_ordena
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_ordena .
*Se atentar as letras maiúsculas da string
CLEAR w_sort.
w_sort-spos = 1.
w_sort-fieldname = 'LKVRZ'.
w_sort-tabname = 'T_SAIDA'.
w_sort-up = 'X'.
APPEND w_sort TO t_sort.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_layout
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_layout .
  w_layout-zebra = 'X'. "Cor sim e cor nao
  "w_layout-colwidth_optimize = 'X'. "Otimizando as colunas
ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_cabecalho
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_cabecalho .
CLEAR w_header.
  REFRESH t_header.

  w_header-typ = 'H'.
  w_header-info = TEXT-007. "Relatorio de materiais
  APPEND w_header TO t_header.

  w_header-typ = 'S'.
  w_header-key = TEXT-008. "Data.:
  WRITE sy-datum TO w_header-info.
  APPEND w_header TO t_header.

  w_header-typ = 'S'.
  w_header-key = TEXT-009. "Hora.:
  WRITE sy-uzeit  TO w_header-info.
  APPEND w_header TO t_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary       = t_header
      i_logo                   = 'ENJOYSAP_LOGO'
*     I_END_OF_LIST_GRID       =
*     I_ALV_FORM               =
            .
ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_imprime_alv
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_imprime_alv .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
*   I_BUFFER_ACTIVE                   = ' '
   i_callback_program                = sy-repid
*   I_CALLBACK_PF_STATUS_SET          = ' '
   i_callback_user_command           = 'USER_COMMAND'
   i_callback_top_of_page            = 'F_CABECALHO'
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
*   I_STRUCTURE_NAME                  =
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
   is_layout                         = w_layout
   it_fieldcat                       = t_fieldcat
*   IT_EXCLUDING                      =
*   IT_SPECIAL_GROUPS                 =
*   it_sort                           = t_sort
*   IT_FILTER                         =
*   IS_SEL_HIDE                       =
*   I_DEFAULT                         = 'X'
*   i_save                            = 'X'
*   is_variant                        = w_variant
*   IT_EVENTS                         =
*   IT_EVENT_EXIT                     =
*   IS_PRINT                          =
*   IS_REPREP_ID                      =
*   I_SCREEN_START_COLUMN             = 0
*   I_SCREEN_START_LINE               = 0
*   I_SCREEN_END_COLUMN               = 0
*   I_SCREEN_END_LINE                 = 0
*   I_HTML_HEIGHT_TOP                 = 0
*   I_HTML_HEIGHT_END                 = 0
*   IT_ALV_GRAPHICS                   =
*   IT_HYPERLINK                      =
*   IT_ADD_FIELDCAT                   =
*   IT_EXCEPT_QINFO                   =
*   IR_SALV_FULLSCREEN_ADAPTER        =
*   O_PREVIOUS_SRAL_HANDLER           =
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  TABLES
    t_outtab                          = t_saida
 EXCEPTIONS
   program_error                     = 1
   OTHERS                            = 2
                .

ENDFORM.
