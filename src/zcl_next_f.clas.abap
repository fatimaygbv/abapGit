class ZCL_NEXT_F definition
  public
  final
  create public .

public section.

  interfaces IF_SERIALIZABLE_OBJECT .
  interfaces Z2UI5_IF_APP .

  data USER type STRING .
  data DATE type STRING.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_NEXT_F IMPLEMENTATION.


  METHOD z2ui5_if_app~main.

"event handling
   CASE client->get( )-event.
      WHEN 'BUTTON_POST'.
        client->popup_message_toast( |App executed on { date } by { user }| ).
    ENDCASE.

    "view rendering
    client->set_next( VALUE #( xml_main = z2ui5_cl_xml_view=>factory(
        )->page( title = 'abap2UI5 - First Example'
            )->simple_form( title = 'Form Title' editable = abap_true
                )->content( 'form'
                    )->title( 'Input'
                    )->label( 'User'
                    )->input( client->_bind( user )
                    )->label( 'Date'
                    )->input( client->_bind( date )
                    )->button( text  = 'post' press = client->_event( 'BUTTON_POST' )
         )->get_root( )->xml_get( ) ) ).


  ENDMETHOD.
ENDCLASS.
