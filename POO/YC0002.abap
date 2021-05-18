CLASS yc0002 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

PUBLIC SECTION.
  CLASS-METHODS create
    RETURNING
      VALUE(r_result) TYPE REF TO yc0002.

      INTERFACES if_oo_adt_classrun.

      TYPES: ty_table_of_yt4000 TYPE TABLE OF yt4000 WITH DEFAULT KEY.
      data: wi_table type yt4000.
      METHODS: create_table
                 RETURNING
                   VALUE(ti_table2) TYPE ty_table_of_yt4000.
PROTECTED SECTION.
PRIVATE SECTION.
ENDCLASS.

CLASS yc0002 IMPLEMENTATION.

  METHOD create.

*    r_result = NEW #( ).
    CREATE OBJECT r_result.

  ENDMETHOD.

  METHOD create_table.

  SELECT
   t001w~name1,
   t001w~stras,
   t001w~pstlz,
   t001w~ort01
  FROM
   t001w
  into @wi_table.

  APPEND wi_table to ti_table2.

  DELETE FROM yt4000.

  INSERT yt4000 FROM TABLE @ti_table2.

    ENDSELECT.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

  CALL METHOD create_table.

  out->write( 'Executado' ).

  ENDMETHOD.

ENDCLASS.
