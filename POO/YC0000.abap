CLASS yc0000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS create
      RETURNING
        VALUE(r_result) TYPE REF TO yc0000.
    METHODS run.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS yc0000 IMPLEMENTATION.

  METHOD create.

    r_result = NEW #( ).

  ENDMETHOD.
  METHOD run.
    DATA(invoices) = NEW yc0001( ).
    DATA(invoices_item) = invoices->run( ).

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    CALL METHOD run.
    out->write( 'Executado com Sucesso!' ).
  ENDMETHOD.

ENDCLASS.
