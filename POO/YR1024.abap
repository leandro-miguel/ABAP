*&---------------------------------------------------------------------*
*& Report YR1024
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr1024.

CLASS lcl_main DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS create
      RETURNING
        VALUE(r_result) TYPE REF TO lcl_main.
        METHODS imprime.
        DATA: r_salv TYPE REF TO cl_salv_table.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD create.

     CREATE OBJECT r_result.

  ENDMETHOD.

  METHOD imprime.

    DATA(invoices) = NEW yclass_teste( ).
    DATA(invoice_items) = invoices->get_items_from_db( ).
    DATA: r_tpsalv TYPE REF TO cl_salv_selections.

    cl_salv_table=>factory(
*      EXPORTING
*        list_display   = if_salv_c_bool_sap=>false
*        r_container    =
*        container_name =
      IMPORTING
        r_salv_table   = r_salv
      CHANGING
        t_table        = invoice_items
    ).

    CALL METHOD r_salv->set_screen_popup
      EXPORTING
        start_column = 10
        end_column   = 73
        start_line   = 01
        end_line     = 15
      .

    r_tpsalv = r_salv->get_selections( ).
    r_tpsalv->set_selection_mode( 3 ).


    r_salv->display( ).
*    CATCH cx_salv_msg.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
lcl_main=>create( )->imprime( ).
