CLASS zmm_clase_luces DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.

CLASS zmm_clase_luces IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write( |Hola Mundo| ).
  ENDMETHOD.

ENDCLASS.

