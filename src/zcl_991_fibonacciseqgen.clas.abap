CLASS zcl_991_fibonacciseqgen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES
      if_oo_adt_classrun.
    ALIASES
        main FOR if_oo_adt_classrun~main.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_991_fibonacciSeqGen IMPLEMENTATION.
  METHOD main.
    CONSTANTS: BEGIN OF initialList,
                 start  TYPE p VALUE 0,
                 second TYPE p VALUE 1,
               END OF initialList.
    DATA fibonacciSequency TYPE SORTED TABLE OF p WITH NON-UNIQUE  KEY table_line.
    DATA qdeTimes TYPE int4 VALUE 60.
    DATA counter TYPE int4 VALUE 1.
    APPEND initiallist-start TO fibonaccisequency.
    APPEND initiallist-second TO fibonaccisequency.
    DO qdeTimes TIMES.
      READ TABLE fibonaccisequency INDEX ( counter ) INTO DATA(line1).
      IF sy-subrc IS INITIAL.
        READ TABLE fibonaccisequency INDEX ( counter + 1 ) INTO DATA(line2).
        IF sy-subrc IS INITIAL.
          line2 = line1 + line2.
          APPEND line2 TO fibonaccisequency.
        ENDIF.
      ENDIF.
      counter += 1.
    ENDDO.
    out->write( |The first { qdeTimes } numbers of Fibonatti sequence are: | ).
    out->write( fibonaccisequency ).
  ENDMETHOD.

ENDCLASS.
