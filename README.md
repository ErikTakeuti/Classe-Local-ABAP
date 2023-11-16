# Classe-Local-ABAP

### CLASSE LOCAL COM ABAP

```abap

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

```
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### CONSTRUCTOR ESTATIC COM CLASSE LOCAL

```abap

REPORT ZTESTE_ESTATIC_CONS_02.

CLASS cll DEFINITION.
  PUBLIC SECTION.
  CLASS-METHODS: class_constructor, hello.

ENDCLASS.

CLASS cll IMPLEMENTATION.
  METHOD class_constructor.
    WRITE: / 'CLASSE CONSTRUCTOR ACIONADO'.
  ENDMETHOD.

  METHOD hello.
    WRITE: / 'MÉTODO HELLO ACIONADO'.
  ENDMETHOD.
  ENDCLASS.

  START-OF-SELECTION.
  cll=>hello( ).
  cll=>hello( ).

```
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### CONSTRUCTOR INSTANCE COM CLASSE LOCAL

```abap

REPORT ZTESTE_INSTANCIA_CONS_02.

CLASS teste DEFINITION.
  PUBLIC SECTION.
  METHODS: constructor IMPORTING v1 TYPE i
                       EXCEPTIONS ex1.
  PRIVATE SECTION.
  DATA: mv1 TYPE i.
  CLASS-DATA gv1 TYPE i.
  ENDCLASS.

  CLASS teste IMPLEMENTATION.
    METHOD constructor.
      gv1 = gv1 + 1.

      IF gv1 > 2.
        RAISE ex1.
      ENDIF.

      mv1 = v1.
      WRITE: / 'CONSTRUCTOR ACIONADO' , 'mv1=' , mv1 , 'gvl=' , gv1.
   ENDMETHOD.
   ENDCLASS.

   DATA: lo1 TYPE REF TO teste,
         lo2 TYPE REF TO teste,
         lo3 TYPE REF TO teste.

   START-OF-SELECTION.
   CREATE OBJECT lo1
   EXPORTING
     v1 = 10
   EXCEPTIONS
     ex1 = 1
     OTHERS = 2.

   IF sy-subrc <> 0.
     WRITE: / 'ULTRAPASSOU O VALOR'.
   ENDIF.

   CREATE OBJECT lo2
   EXPORTING
     v1 = 11
   EXCEPTIONS
     ex1 = 1
     OTHERS = 2.

   IF sy-subrc <> 0.
     WRITE: / 'ULTRAPASSOU O VALOR'.
   ENDIF.

   CREATE OBJECT lo3
   EXPORTING
     v1 = 12
   EXCEPTIONS
     ex1 = 1
     OTHERS = 2.

   IF sy-subrc <> 0.
     WRITE: / 'ULTRAPASSOU O VALOR'.
   ENDIF.

```
