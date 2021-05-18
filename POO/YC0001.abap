CLASS yc0001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS create
      RETURNING
        VALUE(r_result) TYPE REF TO yc0001.
    TYPES: ty_table_of_ytmaster01 TYPE STANDARD TABLE OF ytmaster01 WITH DEFAULT KEY.
    DATA: w_table TYPE ytmaster01.
    DATA: ti_table TYPE SORTED TABLE OF ytmaster01 WITH UNIQUE KEY cliente.
    METHODS run
      RETURNING
        VALUE(lt_result) TYPE ty_table_of_ytmaster01.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS yc0001 IMPLEMENTATION.

  METHOD create.

*    r_result = NEW #( ). or

    CREATE OBJECT r_result.

  ENDMETHOD.

  METHOD run.

    SELECT
*   ytclientes~client,
    ytclientes~cliente,
    ytclientes~cpf,
    ytclientes~rua,
    ytclientes~cidade,
    ytclientes~cep,
    ytclientes~nascimento,
    ytclientes~modelo,
    yfornecedores~marca,
    yfornecedores~ano,
    yfornecedores~revenda,
    yfornecedores~preco,
    yfornecedores~currency,
    ytrevenda~nome_rev,
    ytrevenda~cidade_rev,
    ytrevenda~rua_rev,
    ytrevenda~cep_rev
    FROM
    ytclientes
    JOIN
    yfornecedores
    ON
    ytclientes~modelo = yfornecedores~modelo
    JOIN
    ytrevenda
    ON
    yfornecedores~revenda = ytrevenda~revenda
    INTO TABLE @lt_result.

    DELETE FROM ytmaster01.

    INSERT ytmaster01 from table @lt_result.

  ENDMETHOD.
ENDCLASS.
