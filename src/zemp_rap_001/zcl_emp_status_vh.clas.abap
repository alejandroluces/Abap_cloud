CLASS zcl_emp_status_vh DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_emp_status_vh IMPLEMENTATION.
  METHOD if_rap_query_provider~select.
    DATA: lt_data TYPE TABLE OF zi_emp_status_vh.

    IF io_request->is_data_requested( ).
      lt_data = VALUE #( 
        ( Status = 'ACTIVO'    Description = 'Activo' )
        ( Status = 'INACTIVO'  Description = 'Inactivo' )
        ( Status = 'BLOQUEADO' Description = 'Bloqueado' )
      ).

      io_response->set_data( lt_data ).
      io_response->set_total_number_of_records( lines( lt_data ) ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.