CLASS zcl_991_anagramcheck DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES
      if_oo_adt_classrun.

    ALIASES  main FOR if_oo_adt_classrun~main.
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES: BEGIN OF matrizType,
             letter TYPE c LENGTH 1,
             qtd    TYPE i,
           END OF matrizType.
    TYPES matrizTab TYPE STANDARD TABLE OF matrizType WITH DEFAULT KEY.
    METHODS criarMatriz
      IMPORTING word          TYPE string
      RETURNING VALUE(matriz) TYPE matrizTab.
ENDCLASS.

CLASS zcl_991_anagramcheck IMPLEMENTATION.
  METHOD main.
    CONSTANTS: BEGIN OF params,
                 param1 TYPE string VALUE 'RUMO',
                 param2 TYPE string VALUE 'MIRO',
               END OF params.
    DATA(matriz1) = me->criarmatriz( params-param1 ).
    DATA(matriz2) = me->criarmatriz( params-param2 ).
    IF matriz1 = matriz2.
      out->write( |The words { params-param1 } and { params-param2 } are anagrams!| ).
    ELSE.
      out->write( |The words { params-param1 } and { params-param2 } aren´t anagrams!| ).
    ENDIF.
  ENDMETHOD.

  METHOD criarmatriz.
    DATA wordLen TYPE i VALUE 1.
    DATA i TYPE i.
    wordLen = strLen( word ).
    WHILE i < wordLen.
      READ TABLE matriz WITH KEY letter = word+i(1) INTO DATA(line) .
      IF sy-subrc IS INITIAL.
        line-qtd += 1.
        MODIFY TABLE matriz FROM line.
      ELSE.
        line-letter = word+i(1).
        line-qtd = 1.
        APPEND line TO matriz.
      ENDIF.
      i += 1.
    ENDWHILE.
    SORT matriz BY letter.
  ENDMETHOD.

ENDCLASS.
