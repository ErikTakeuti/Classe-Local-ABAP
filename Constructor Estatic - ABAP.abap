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