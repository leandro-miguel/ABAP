*&---------------------------------------------------------------------*
*& Report y_abap_adt
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT y_abap_adt NO STANDARD PAGE HEADING.

CLASS lcl_main DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS create
      RETURNING
        VALUE(valor) TYPE REF TO lcl_main.
        METHODS imprime.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

INITIALIZATION.
 SELECTION-SCREEN BEGIN OF BLOCK part1 WITH FRAME TITLE texto1.
    PARAMETERS: Carro AS CHECKBOX USER-COMMAND flag,
                Moto AS CHECKBOX DEFAULT 'X' USER-COMMAND flag.
    SELECTION-SCREEN END OF BLOCK part1.

CLASS lcl_main IMPLEMENTATION.

  METHOD create.

    valor = NEW #( ).

  ENDMETHOD.

  METHOD imprime.
        IF Carro = 'X'.
            MESSAGE 'Você está utilizando Carro!' TYPE 'S'.
        ELSEIF Moto = 'X'.
            MESSAGE 'Você está utilizando Moto!' TYPE 'S'.
        else.
            MESSAGE 'Escolha algo' TYPE 'S'.
        ENDIF.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
lcl_main=>create( )->imprime( ).
