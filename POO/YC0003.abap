CLASS yc0003 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

PUBLIC SECTION.
  CLASS-METHODS create
    RETURNING
      VALUE(r_result) TYPE REF TO yc0003.
      INTERFACES if_oo_adt_classrun.
      TYPES: ty_table_of_yt4001 TYPE STANDARD TABLE OF yt4001 WITH DEFAULT KEY.
      METHODS: insert_table
                 RETURNING
                   VALUE(lti_table) TYPE ty_table_of_yt4001.
PROTECTED SECTION.
PRIVATE SECTION.
ENDCLASS.

CLASS yc0003 IMPLEMENTATION.

  METHOD create.

    r_result = NEW #( ).

  ENDMETHOD.

  METHOD insert_table.

        SELECT 
            yt001~id,
            yt001~empresa,
            yt001~cidade,
            yt001~estado,
            yt001~moeda,
            yt4000~ccusto,
            yt4000~rua,
            yt4000~cep
         FROM
          yt001
         JOIN
          yt4000
         ON
          yt001~cidade = yt4000~cidade
         INTO TABLE @lti_table.

            DELETE FROM yt4001.
            INSERT yt4001 FROM TABLE lti_table.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    CALL METHOD insert_table.
    out->write( 'inserido' ).

  ENDMETHOD.



ENDCLASS.
