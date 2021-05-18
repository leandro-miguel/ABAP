*&---------------------------------------------------------------------*
*& Report YR1006
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr1012.

*Tipos globais para módulos de lista genérica
TYPE-POOLS slis. "Um grupo de constante e estruturas.

*1-Tabela transparente
TABLES: yt0005. "Tabela de Material

*2-Tabelas Interna
DATA: t_yt0005 TYPE TABLE OF yt0005 WITH HEADER LINE,
      t_yt0001 TYPE TABLE OF yt0001 WITH HEADER LINE,
      t_saida  TYPE TABLE OF yst0001 WITH HEADER LINE,
      t_fieldcat TYPE slis_t_fieldcat_alv,
      t_sort TYPE slis_t_sortinfo_alv,
      t_header TYPE slis_t_listheader.

*3-Work Área
DATA: w_fieldcat TYPE slis_fieldcat_alv,
      w_sort TYPE slis_sortinfo_alv,
      w_layout TYPE slis_layout_alv,
      w_header TYPE slis_listheader,
      w_variant TYPE disvariant.

*4-Tela de seleçao
SELECTION-SCREEN BEGIN OF BLOCK bc01 WITH FRAME TITLE TEXT-001.
SELECT-OPTIONS: s_tpmat FOR yt0005-tpmat.
SELECTION-SCREEN END OF BLOCK bc01.

SELECTION-SCREEN BEGIN OF BLOCK bc02 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_varian TYPE slis_vari.
SELECTION-SCREEN END OF BLOCK bc02.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_varian.
  PERFORM f_variant_f4 CHANGING p_varian.

*5-Início da execução
START-OF-SELECTION.

*6-Criação de Performs
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

*6.1 - Selecionar os dados
FORM f_seleciona_dados .
  SELECT * FROM yt0005 INTO TABLE t_yt0005
    WHERE tpmat IN s_tpmat.
   IF sy-subrc IS INITIAL.
      SELECT * FROM yt0001 INTO TABLE t_yt0001
        FOR ALL ENTRIES IN t_yt0005
        WHERE tpmat = t_yt0005-tpmat.
    ELSE.
      MESSAGE TEXT-003 TYPE 'I'.
      STOP.
   ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_monata_tabela_saida
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*

*6.2 - Montar a tabela de saída
FORM  f_monta_tabela_saida .
  LOOP AT t_yt0005.
    CLEAR t_saida.
    t_saida-mater = t_yt0005-mater.
    t_saida-denom = t_yt0005-denom.
    t_saida-brgew = t_yt0005-brgew.
    t_saida-ntgew = t_yt0005-ntgew.
    t_saida-gewei = t_yt0005-gewei.
    t_saida-status = t_yt0005-status.
    t_saida-tpmat = t_yt0005-tpmat.
   READ TABLE t_yt0001 WITH KEY tpmat = t_yt0005-tpmat.
   IF sy-subrc IS INITIAL.
     t_saida-denom_tp = t_yt0001-denom.
   ENDIF.
   APPEND t_saida.
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

*6.3 - Imprimindo a tabela
FORM f_monta_alv .

PERFORM: f_define_fieldcat,
         f_ordena,
         f_layout,
         f_imprime_ALV,
         f_cabecalho.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form f_define_fieldcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*

*6.3.1 - Definindo a estrutura da Tabela, da qual é YST0001
FORM f_define_fieldcat .

CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
 EXPORTING
   i_program_name               = sy-repid
   i_internal_tabname           = 'T_SAIDA'
   i_structure_name             = 'YST0001'
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
      WHEN 'BRGEW'.
        w_fieldcat-seltext_s = w_fieldcat-seltext_m = w_fieldcat-seltext_l = w_fieldcat-reptext_ddic = TEXT-004.
      WHEN 'NTGEW'.
        w_fieldcat-seltext_s = w_fieldcat-seltext_m = w_fieldcat-seltext_l = w_fieldcat-reptext_ddic = TEXT-005.
      WHEN 'MATER'.
        w_fieldcat-hotspot = 'X'.
      WHEN 'DENOM'.
        w_fieldcat-edit = 'X'.
    ENDCASE.
    MODIFY t_fieldcat FROM w_fieldcat INDEX sy-tabix TRANSPORTING seltext_s seltext_m seltext_l reptext_ddic hotspot.
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

*6.3.2 -
FORM f_ordena .
*Se atentar as letras maiúsculas da string
CLEAR w_sort.
  w_sort-spos = 1.
  w_sort-fieldname = 'MATER'.
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

*6.3.3 - Definindo o Layout
FORM f_layout .
w_layout-zebra = 'X'. "Cor sim e cor nao
w_layout-colwidth_optimize = 'X'. "Otimizando as colunas
ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_imprime_ALV
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*

*6.3.4 - Criando o Display, isso é como se fosse o write da tabela
FORM f_imprime_ALV .
w_variant-variant = p_varian.
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
   it_sort                           = t_sort
*   IT_FILTER                         =
*   IS_SEL_HIDE                       =
*   I_DEFAULT                         = 'X'
   i_save                            = 'X'
   is_variant                        = w_variant
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

*&---------------------------------------------------------------------*
*& Form f_cabecalho
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*

*6.3.5 - Criando o Cabeçalho da AVL
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
*& Form f_variant_f4
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      <-- P_VARIAN
*&---------------------------------------------------------------------*

FORM f_variant_f4 CHANGING p_p_varian.
  DATA: vl_variant TYPE disvariant.
  vl_variant-report = sy-repid.
  CALL FUNCTION 'REUSE_ALV_VARIANT_F4'
    EXPORTING
      is_variant                = vl_variant
*     I_TABNAME_HEADER          =
*     I_TABNAME_ITEM            =
*     IT_DEFAULT_FIELDCAT       =
     i_save                    = 'A'
*     I_DISPLAY_VIA_GRID        = ' '
   IMPORTING
*     e_exit                    = vl_variant
     es_variant                = vl_variant
   EXCEPTIONS
     not_found                 = 1
     program_error             = 2
     OTHERS                    = 3
            .
  IF sy-subrc = 0.
* Implement suitable error handling here
    p_p_varian = vl_variant-variant.
  ENDIF.
ENDFORM.
*6.3.7 - Linkando outra tabela a partir de um campo da AVL  e Alterando os dados da coluna indicado na AVL
FORM user_command USING r_ucomm LIKE sy-ucomm
                        rs_selfield TYPE slis_selfield.
DATA: tl_vimsellist TYPE STANDARD TABLE OF vimsellist,
      wl_vimsellist TYPE vimsellist.
 wl_vimsellist-viewfield = 'MATER'.
 wl_vimsellist-operator = 'EQ'.
 wl_vimsellist-value = rs_selfield-value.
 APPEND wl_vimsellist TO tl_vimsellist.
IF rs_selfield-sel_tab_field = 'T_SAIDA-MATER'.
  CALL FUNCTION 'VIEW_MAINTENANCE_CALL'
    EXPORTING
      action                               = 'S'
*     CORR_NUMBER                          = '          '
*     GENERATE_MAINT_TOOL_IF_MISSING       = ' '
*     SHOW_SELECTION_POPUP                 = ' '
      view_name                            = 'YT0005'
*     NO_WARNING_FOR_CLIENTINDEP           = ' '
*     RFC_DESTINATION_FOR_UPGRADE          = ' '
*     CLIENT_FOR_UPGRADE                   = ' '
*     VARIANT_FOR_SELECTION                = ' '
*     COMPLEX_SELCONDS_USED                = ' '
*     CHECK_DDIC_MAINFLAG                  = ' '
*     SUPPRESS_WA_POPUP                    = ' '
   TABLES
     dba_sellist                          = tl_vimsellist
*     EXCL_CUA_FUNCT                       =
    EXCEPTIONS
     client_reference                     = 1
     foreign_lock                         = 2
     invalid_action                       = 3
     no_clientindependent_auth            = 4
     no_database_function                 = 5
     no_editor_function                   = 6
     no_show_auth                         = 7
     no_tvdir_entry                       = 8
     no_upd_auth                          = 9
     only_show_allowed                    = 10
     system_failure                       = 11
     unknown_field_in_dba_sellist         = 12
     view_not_found                       = 13
     maintenance_prohibited               = 14
     OTHERS                               = 15
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
ENDIF.
ENDFORM.
