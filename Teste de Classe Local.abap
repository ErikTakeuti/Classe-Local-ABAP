REPORT ZTESTE_CLASSE_LOCAL_02.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

PARAMETERS: p_n1 TYPE i,
            p_n2 TYPE i.

SELECTION-SCREEN END OF BLOCK a1.

CLASS  l_c1 DEFINITION.
  PUBLIC SECTION.
  METHODS: add IMPORTING im1 TYPE i
                         im2 TYPE i,
           display.
  PRIVATE SECTION.
  DATA: lv1 TYPE i,
        lv2 TYPE i,
        lv3 TYPE i.
  ENDCLASS.

CLASS l_c1 IMPLEMENTATION.
  METHOD add.
    lv1 = im1.
    lv2 = im2.
    lv3 = lv1 + lv2.
  ENDMETHOD.

  METHOD display.
    NEW-LINE.
    WRITE: lv1 , ' + ' , lv2 , ' = ' , lv3.
    ENDMETHOD.
  ENDCLASS.

  START-OF-SELECTION.
  DATA lo TYPE REF TO l_c1.
  CREATE OBJECT lo.
  lo->add(
  EXPORTING
    im1 = p_n1
    im2 = p_n2
  ).
  lo->display( ).