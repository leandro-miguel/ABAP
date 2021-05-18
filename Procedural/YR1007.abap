*&---------------------------------------------------------------------*
*& Report YR1007
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT YR1007.

DATA: f1 TYPE i,
      BEGIN OF s,
        c1 TYPE i VALUE 1,
        c2 TYPE i VALUE 2,
        c3 TYPE i VALUE 3,
        c4 TYPE i VALUE 4,
        c5 TYPE i VALUE 5,
        c6 TYPE i VALUE 6,
        END OF s.
   FIELD-SYMBOLS <f>.

   WRITE / ''.
   do 6 TIMES varying f1 from s-c1 next s-c2.
     IF sy-index = 6.
       s-c6 = 99.
     ELSE.
       f1 = f1 * 2.

     ENDIF.
     ASSIGN COMPONENT sy-index OF STRUCTURE s to <f>.

    WRITE <f>.
     ENDDO.

   WRITE / ''.
   DO 6 TIMES varying f1 FROM s-c1 next s-c2.
     WRITE f1.

   ENDDO.
