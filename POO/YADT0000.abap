*&---------------------------------------------------------------------*
*& Report YR1024
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr1024 NO STANDARD PAGE HEADING.

CLASS lcl_main DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS create
      RETURNING
        VALUE(r_result) TYPE REF TO lcl_main.
        METHODS imprime_alv.
        DATA: r_salv TYPE REF TO cl_salv_table.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD create.

     CREATE OBJECT r_result.

  ENDMETHOD.

**********************************************************************
  METHOD imprime_alv.

    DATA(invoices) = NEW ycl000( ).
    DATA(invoice_items) = invoices->get_items_from_db( ).
    DATA: r_tpsalv TYPE REF TO cl_salv_selections,
          alv_columns TYPE REF TO cl_salv_columns_table,
          alv_column  TYPE REF TO cl_salv_column_table.

    "Criando a tabela alv em si
    cl_salv_table=>factory(
      EXPORTING
        list_display   = if_salv_c_bool_sap=>false
*        r_container    =
*        container_name =
      IMPORTING
        r_salv_table   = r_salv
      CHANGING
        t_table        = invoice_items
    ).
**********************************************************************
    "Criando um pop up
    CALL METHOD r_salv->set_screen_popup
      EXPORTING
        start_column = 121
        end_column   = 175
        start_line   = 01
        end_line     = 15
      .
**********************************************************************
    "Criando a coluna de seleção
    r_tpsalv = r_salv->get_selections( ).
    r_tpsalv->set_selection_mode( 3 ).
**********************************************************************
    "Sintaxa da qual me faz com que eu retire  uma coluna da visualização
    alv_columns = r_salv->get_columns( ).
    alv_column ?= alv_columns->Get_Column( 'CLIENT' ).
    alv_column->set_visible( abap_false ).
**********************************************************************
    "Inserindo os botões clássicos na table.
     DATA: lr_functions TYPE REF TO cl_salv_functions_list,
          l_text       TYPE string,
          l_icon       TYPE string.
    lr_functions = r_salv->get_functions( ).
    lr_functions->set_default( abap_true ).

*    "Inserindo dados especiais
*     r_salv->set_screen_status(
*      pfstatus      =  'SALV_STANDARD'
*      report        =  'SALV_DEMO_TABLE_SELECTIONS'
*      set_functions = r_salv->c_functions_all ).
**********************************************************************
    "Inserindo opções de layout
    DATA: lo_layout  TYPE REF TO cl_salv_layout,
          lf_variant TYPE slis_vari,
          ls_key    TYPE salv_s_layout_key.
*
*   get layout object
    lo_layout = r_salv->get_layout( ).
*
*   set Layout save restriction
*   1. Set Layout Key .. Unique key identifies the Differenet ALVs
    ls_key-report = sy-repid.
    lo_layout->set_key( ls_key ).
*   2. Remove Save layout the restriction.
    lo_layout->set_save_restriction( if_salv_c_layout=>restrict_none ).
*
*   set initial Layout
    lf_variant = 'DEFAULT'.
    lo_layout->set_initial_layout( lf_variant ).
**********************************************************************
    "Criando o cabeçalho
    DATA: lo_header  TYPE REF TO cl_salv_form_layout_grid,
          lo_h_label TYPE REF TO cl_salv_form_label,
          lo_h_flow  TYPE REF TO cl_salv_form_layout_flow.

*   footer object
    CREATE OBJECT lo_header.
*
*   information in bold
    lo_h_label = lo_header->create_label( row = 1 column = 1 ).
    lo_h_label->set_text( 'Tabela de Vendedores' ).
*
*   tabular information
    lo_h_flow = lo_header->create_flow( row = 2  column = 1 ).
    lo_h_flow->create_text( text = 'Grupo Zaragoza' ).
*
    lo_h_flow = lo_header->create_flow( row = 3  column = 1 ).
    lo_h_flow->create_text( text = 'Taubaté - SP' ).
*
    lo_h_flow = lo_header->create_flow( row = 3  column = 2 ).
    lo_h_flow->create_text( text = sy-datum ).
    lo_h_flow->create_text( text = sy-timlo ).

    r_salv->set_top_of_list( lo_header ).
*
    r_salv->set_top_of_list_print( lo_header ).
**********************************************************************
    "Imprimindo a ALV
    r_salv->display( ).

  ENDMETHOD.

ENDCLASS.

INITIALIZATION.

DATA: ti_table TYPE TABLE OF ytadt_001,
       w_table TYPE ytadt_001.

SELECTION-SCREEN BEGIN OF BLOCK part01 WITH FRAME TITLE TEXT-001.
PARAMETERS: p_id LIKE w_table-id OBLIGATORY,
            p_name LIKE w_table-nome,
            p_sobr LIKE w_table-sobrenome,
            p_city LIKE w_table-cidade.

SELECTION-SCREEN END OF BLOCK part01.

SELECTION-SCREEN BEGIN OF BLOCK part02 WITH FRAME TITLE TEXT-002.
PARAMETERS:
           insert RADIOBUTTON GROUP g1,
           update RADIOBUTTON GROUP g1,
           modify RADIOBUTTON GROUP g1,
           delete RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK part02.

*SELECTION-SCREEN COMMENT /35(50) test1.
*SELECTION-SCREEN COMMENT /35(30) test2.
*
*test1 = 'Escreva o mês pelo número correspondente'.
*test2 = '(Exemplo: Março = 3)'.
*
*AT SELECTION-SCREEN.
*AT SELECTION-SCREEN OUTPUT.

IF w_table-id IS INITIAL.
    lcl_main=>create( )->imprime_alv( ).
ENDIF.

**********************************************************************
"Script da manipulação da tabela
START-OF-SELECTION.

IF insert = 'X'.
   CLEAR w_table.
   w_table-id = p_id.
   w_table-nome = p_name.
   w_table-sobrenome = p_sobr.
   w_table-cidade = p_city.
   APPEND w_table TO ti_table.
   TRY.
    INSERT ytadt_001 FROM TABLE ti_table.
   CATCH cx_sy_open_sql_db.
    MESSAGE 'ID Inserido. Por favor, tente outro.' TYPE 'I'.
    ROLLBACK WORK.
ENDTRY.
ELSEIF update = 'X'.
   w_table-id = p_id.
   w_table-nome = p_name.
   w_table-sobrenome = p_sobr.
   w_table-cidade = p_city.
   APPEND w_table TO ti_table.
   UPDATE ytadt_001 FROM TABLE ti_table.
 ELSEIF modify = 'X'.
   w_table-id = p_id.
   w_table-nome = p_name.
   w_table-sobrenome = p_sobr.
   w_table-cidade = p_city.
   APPEND w_table TO ti_table.
   UPDATE ytadt_001 FROM TABLE ti_table.
 ELSEIF delete = 'X'.
   w_table-id = p_id.
   w_table-nome = p_name.
   w_table-sobrenome = p_sobr.
   w_table-cidade = p_city.
   APPEND w_table TO ti_table.
   DELETE ytadt_001 FROM TABLE ti_table.
ENDIF.