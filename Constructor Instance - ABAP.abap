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