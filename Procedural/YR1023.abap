*&---------------------------------------------------------------------*
*& Report YR1023
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr1023.

TYPE-POOLS:
          slis.

TABLES: csks,
        t001,
        t001w.

**********************************************************************
*                       Tabelas Internas
**********************************************************************
DATA: ti_csks TYPE TABLE OF csks,
      ti_t001 TYPE TABLE OF t001,
      ti_t001w TYPE TABLE OF t001w,
      ti_saida TYPE TABLE OF yetcc_01,
      ti_fieldcat TYPE slis_t_fieldcat_alv,
      ti_sort TYPE slis_t_sortinfo_alv,
      ti_header TYPE slis_t_listheader.

**********************************************************************
*                       Works Áreas
**********************************************************************
DATA: w_csks TYPE csks,
      w_t001 TYPE t001,
      w_t001w TYPE t001w,
      w_saida TYPE yetcc_01,
      w_fieldcat TYPE slis_fieldcat_alv,
      w_sort TYPE slis_sortinfo_alv,
      w_layout TYPE slis_layout_alv,
      w_header TYPE slis_listheader.

**********************************************************************
*              Início da Execução e criação dos performs
**********************************************************************

START-OF-SELECTION.

PERFORM: f_seleciona_dados,
         f_monta_tabela_saida,
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
  SELECT * FROM csks INTO TABLE ti_csks.
  SELECT * FROM t001 INTO TABLE ti_t001.
  SELECT * FROM t001w INTO TABLE ti_t001w.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_monta_tabela_saida
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_monta_tabela_saida .
  LOOP AT ti_csks INTO w_csks.
    CLEAR w_saida.
    w_saida-ykostl = w_csks-kostl.
    w_saida-yprctr = w_csks-prctr.
    w_saida-yersda = w_csks-ersda.
    w_saida-ybukrs = w_csks-bukrs.
*   SELECT SINGLE * FROM t001 INTO w_t001 WHERE bukrs = w_csks-bukrs.
    READ TABLE ti_t001 INTO w_t001 WITH KEY bukrs = w_csks-bukrs.
    w_saida-ybutxt = w_t001-butxt.
    w_saida-ylan1 = w_t001-land1.
    w_saida-yort1 = w_t001-ort01.
    TRANSLATE w_t001-ort01 TO UPPER CASE.
*    SELECT SINGLE * FROM t001w INTO w_t001w WHERE ort01 = w_csks-ort01.
    READ TABLE ti_t001w INTO w_t001w WITH KEY ort01 = w_t001-ort01.
    w_saida-ycep = w_t001w-pstlz.
    w_saida-yrua = w_t001w-stras.
    APPEND w_saida TO ti_saida.
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
FORM f_monta_alv .
  PERFORM:
          f_define_fieldcat,
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
     i_internal_tabname           = 'TI_SAIDA'
     i_structure_name             = 'YETCC_01'
*     I_CLIENT_NEVER_DISPLAY       = 'X'
*     I_INCLNAME                   =
*     I_BYPASSING_BUFFER           =
*     I_BUFFER_ACTIVE              =
    CHANGING
      ct_fieldcat                  = ti_fieldcat
*   EXCEPTIONS
*     INCONSISTENT_INTERFACE       = 1
*     PROGRAM_ERROR                = 2
*     OTHERS                       = 3
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
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
  CLEAR w_sort.
    w_sort-spos = 1.
    w_sort-fieldname = 'YBUKRS'.
    w_sort-tabname = 'TI_SAIDA'.
    w_sort-up = 'X'.
   APPEND w_sort TO ti_sort.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_layout
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_layout.
  w_layout-zebra = 'X'.
  w_layout-colwidth_optimize = 'X'.
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
  REFRESH ti_header.

  w_header-typ = 'H'.
  w_header-info = TEXT-001. "Relatorio de Alunos
  APPEND w_header TO ti_header.

  w_header-typ = 'S'.
  w_header-key = TEXT-002. "Data.:
  WRITE sy-datum TO w_header-info.
  APPEND w_header TO ti_header.

  w_header-typ = 'S'.
  w_header-key = TEXT-003. "Hora.:
  WRITE sy-uzeit  TO w_header-info.
  APPEND w_header TO ti_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary       = ti_header
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
*     I_INTERFACE_CHECK                 = ' '
*     I_BYPASSING_BUFFER                = ' '
*     I_BUFFER_ACTIVE                   = ' '
     i_callback_program                = sy-repid
*     I_CALLBACK_PF_STATUS_SET          = ' '
     i_callback_user_command           = 'USER_COMMAND'
     i_callback_top_of_page            = 'F_CABECALHO'
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME                  =
*     I_BACKGROUND_ID                   = ' '
*     I_GRID_TITLE                      =
*     I_GRID_SETTINGS                   =
     is_layout                         = w_layout
     it_fieldcat                       = ti_fieldcat
*     IT_EXCLUDING                      =
*     IT_SPECIAL_GROUPS                 =
*     IT_SORT                           = ti_sort
*     IT_FILTER                         =
*     IS_SEL_HIDE                       =
*     I_DEFAULT                         = 'X'
*     I_SAVE                            = ' '
*     IS_VARIANT                        =
*     IT_EVENTS                         =
*     IT_EVENT_EXIT                     =
*     IS_PRINT                          =
*     IS_REPREP_ID                      =
*     I_SCREEN_START_COLUMN             = 0
*     I_SCREEN_START_LINE               = 0
*     I_SCREEN_END_COLUMN               = 0
*     I_SCREEN_END_LINE                 = 0
*     I_HTML_HEIGHT_TOP                 = 0
*     I_HTML_HEIGHT_END                 = 0
*     IT_ALV_GRAPHICS                   =
*     IT_HYPERLINK                      =
*     IT_ADD_FIELDCAT                   =
*     IT_EXCEPT_QINFO                   =
*     IR_SALV_FULLSCREEN_ADAPTER        =
*     O_PREVIOUS_SRAL_HANDLER           =
*   IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           =
*     ES_EXIT_CAUSED_BY_USER            =
    TABLES
      t_outtab                          = ti_saida
*   EXCEPTIONS
*     PROGRAM_ERROR                     = 1
*     OTHERS                            = 2
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


ENDFORM.
