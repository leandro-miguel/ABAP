CLASS y_2000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS create
      RETURNING
        VALUE(r_result) TYPE REF TO y_2000.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS y_2000 IMPLEMENTATION.

  METHOD create.

    CREATE OBJECT r_result.

  ENDMETHOD.
  METHOD if_oo_adt_classrun~main.
    DATA: ti_table TYPE TABLE OF yfornecedores.
    DATA: w_table TYPE yfornecedores.

    ti_table  = VALUE #(
    ( client = sy-uname modelo = 'KA' marca = 'FORD' ano = '2020' revenda = 1 preco = '35340.49' currency = 'BRL' )
    ( client = sy-uname modelo = 'FIESTA' marca = 'FORD' ano = '2018' revenda = 1 preco = '43678.13' currency = 'BRL' )
    ( client = sy-uname modelo = 'GOL' marca = 'VOLKSWAGEN' ano = '2010' revenda = 2 preco = '54345.50' currency = 'BRL' )
    ( client = sy-uname modelo = 'UNO' marca = 'FIAT' ano = '2016' revenda = 3 preco = '23435.11' currency = 'BRL' )
    ( client = sy-uname modelo = 'A3' marca = 'AUDI' ano = '2015' revenda = 2 preco = '65334.98' currency = 'BRL' )
    ( client = sy-uname modelo = 'LOGAN' marca = 'CITROEN' ano = '2016' revenda = 4 preco = '56124.58' currency = 'BRL' )
    ( client = sy-uname modelo = 'FOCUS' marca = 'FORD' ano = '2019' revenda = 1 preco = '64126.91' currency = 'BRL' )
    ( client = sy-uname modelo = 'ASTRA' marca = 'CHEVROLET' ano = '2013' revenda = 5 preco = '54129.34' currency = 'BRL' )
    ( client = sy-uname modelo = 'VECTRA' marca = 'CHEVROLET' ano = '2017' revenda = 5 preco = '62746.15' currency = 'BRL' )
    ( client = sy-uname modelo = 'PASSAT' marca = 'VOLKSWAGEN' ano = '2020' revenda = 2 preco = '264879.53' currency = 'BRL' )
    ).

    DELETE FROM yfornecedores.

    INSERT yfornecedores FROM TABLE @ti_table.

    out->write( ti_table ).
    out->write( 'Dados inseridos com sucesso!' ).

  ENDMETHOD.

ENDCLASS.
