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

    lt_data = VALUE #(
      ( Status = 'ACTIVO'    Description = 'Activo' )
      ( Status = 'INACTIVO'  Description = 'Inactivo' )
      ( Status = 'BLOQUEADO' Description = 'Bloqueado' )
    ).

    " Llamada obligatoria para satisfacer al framework RAP y evitar dumps en Fiori V4
    TRY.
        io_request->get_paging( ).
      CATCH cx_root.
    ENDTRY.

    TRY.
        io_request->get_filter( ).
      CATCH cx_root.
    ENDTRY.

    TRY.
        io_request->get_sort_elements( ).
      CATCH cx_root.
    ENDTRY.

    TRY.
        io_request->get_search_expression( ).
      CATCH cx_root.
    ENDTRY.

    " Respuesta de conteo total (necesario para el No data que veías antes)
    IF io_request->is_total_numb_of_rec_requested( ).
      io_response->set_total_number_of_records( lines( lt_data ) ).
    ENDIF.

    " Respuesta de datos reales
    IF io_request->is_data_requested( ).
      io_response->set_data( lt_data ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.

