CLASS y_2001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS create
      RETURNING
        value(r_result) TYPE REF TO y_2001.
        INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS y_2001 IMPLEMENTATION.

  METHOD create.

    create OBJECT r_result.

  ENDMETHOD.
  METHOD if_oo_adt_classrun~main.
  DATA: ti_table type table of ytrevenda.

        ti_table = VALUE #(
        ( client = sy-uname revenda = 1 nome_rev = 'FORD CIA' cidade_rev = 'Taubaté' rua_rev = 'AVENIDA DR PEREIRA BARBOSA, 932' cep_rev = '12060-670')
        ( client = sy-uname revenda = 2 nome_rev = 'VOLKSWAGEN E AMIGOS' cidade_rev = 'Lorena' rua_rev = 'RUA AROLDO DE AZEVEDO, 1098' cep_rev = '12298-345')
        ( client = sy-uname revenda = 3 nome_rev = 'A LA ITALIANA' cidade_rev = 'Jacareí' rua_rev = 'AVENIDA ITÁLIA, 008' cep_rev = '12234-568')
        ( client = sy-uname revenda = 4 nome_rev = 'FRANCIS' cidade_rev = 'São José dos Campos' rua_rev = 'AVENIDA D. PEDRO I, 9242' cep_rev = '12754-683')
        ( client = sy-uname revenda = 5 nome_rev = 'TEXAS MOTORS' cidade_rev = 'Guaratinguetá' rua_rev = 'RUA DOS MOICANOS, 231' cep_rev = '12871-241')
        ).

        DELETE from ytrevenda.

        INSERT ytrevenda FROM TABLE @ti_table.

        out->write( ti_table ).

  ENDMETHOD.

ENDCLASS.
