CLASS yclass_1024 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

PUBLIC SECTION.
    TYPES: ty_table TYPE STANDARD TABLE OF yetcc_02 WITH DEFAULT KEY.
    METHODS get_items_from_db
    RETURNING
    VALUE(it_result) TYPE ty_table.
PROTECTED SECTION.
PRIVATE SECTION.
ENDCLASS.

CLASS yclass_1024 IMPLEMENTATION.
  METHOD get_items_from_db.
  SELECT
   csks~kostl,
   csks~bukrs,
   csks~ersda,
   t001~butxt,
   t001~land1
  FROM
  csks
  JOIN
  t001
  ON
  csks~bukrs = t001~bukrs
  INTO TABLE @it_result.

  ENDMETHOD.
ENDCLASS.
