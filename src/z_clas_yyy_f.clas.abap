CLASS z_clas_yyy_f DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_clas_yyy_f IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
out->write( 'Hello F!' ).
ENDMETHOD.
ENDCLASS.