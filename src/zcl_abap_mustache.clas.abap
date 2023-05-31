CLASS zcl_abap_mustache DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    TYPES:
      BEGIN OF ty_worker,
        name TYPE string,
        age  TYPE i,
        city TYPE string,
      END OF ty_worker,

      ty_worker_tt TYPE STANDARD TABLE OF ty_worker WITH DEFAULT KEY,

      BEGIN OF ty_department,
        department_name TYPE string,
        workers         TYPE ty_worker_tt,
      END OF ty_department.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_abap_mustache IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA : lo_mustache TYPE REF TO zcl_mustache,
           lt_my_data  TYPE STANDARD TABLE OF ty_department WITH DEFAULT KEY,
           lr_data     TYPE REF TO ty_department.

    APPEND INITIAL LINE TO lt_my_data REFERENCE INTO lr_data.
    lr_data->department_name = 'IT department'.
    lr_data->workers = VALUE ty_worker_tt( ( name = 'Arzu Aliyeva'     age = '26' city = 'Baku' )
                                           ( name = 'Toghrul Mammadov' age = '34' city = 'Sumqayit')
                                           ( name = 'Murad Azizov'     age = '30' city = 'Baku' ) ).

    APPEND INITIAL LINE TO lt_my_data REFERENCE INTO lr_data.
    lr_data->department_name = 'HR department'.
    lr_data->workers = VALUE ty_worker_tt( ( name = 'Gulnara Babayeva' age = '23' city = 'Baku' )
                                           ( name = 'Ali Hajiyev'      age = '36' city = 'Sumqayit')
                                           ( name = 'Gunel Tagiyeva'   age = '31' city = 'Sumqayit' ) ).
    TRY.
        lo_mustache = zcl_mustache=>create(

        'Welcome to {{department_name}}!' && cl_abap_char_utilities=>newline &&
        '{{#workers}}'                    && cl_abap_char_utilities=>newline &&
        '* {{name}} - {{age}} - {{city}}' && cl_abap_char_utilities=>newline &&
        '{{/workers}}'
        ).
        out->write( lo_mustache->render( lt_my_data ) ).

      CATCH zcx_mustache_error.

        out->write( 'error' ).

    ENDTRY.

  ENDMETHOD.
ENDCLASS.
