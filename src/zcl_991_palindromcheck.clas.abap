CLASS zcl_991_palindromcheck DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    ALIASES main FOR if_oo_adt_classrun~main.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_991_palindromcheck IMPLEMENTATION.
  METHOD main.
    CONSTANTS: BEGIN OF parameters,
                 p1 TYPE string VALUE '111111111111',
               END OF parameters.
    DATA(lenWord) = strlen( parameters-p1 ).
    DATA(halfLen) = lenword DIV 2.
    DATA i TYPE i VALUE 0.
    WHILE i <= halfLen - 1.
      DATA(pos) = lenWord - ( i + 1 ).
      IF parameters-p1+i(1) = parameters-p1+pos(1).
        IF i = halflen - 1.
          out->write( |The word { parameters-p1 } is a palindrom!| ).
        ENDIF.
        i += 1.
        CONTINUE.
      ELSE.
        i += 1.
        out->write( |The word { parameters-p1 } isn´t a palindrom!| ).
      ENDIF.
    ENDWHILE.
  ENDMETHOD.
ENDCLASS.
