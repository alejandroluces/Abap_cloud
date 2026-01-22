CLASS zmm_cl_inv_load_001 DEFINITION
  PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zmm_cl_inv_load_001 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA lt_mat TYPE STANDARD TABLE OF zmm_inv_mat WITH EMPTY KEY.
    DATA lt_mov TYPE STANDARD TABLE OF zmm_inv_mov WITH EMPTY KEY.

    lt_mat = VALUE #(
      ( mat_id = 'MAT0000001' mat_desc = 'CABLE HDMI'    mat_price = '15.00' stock_actual = 10 mat_url = 'https://ejemplo.com/hdmi' )
      ( mat_id = 'MAT0000002' mat_desc = 'MOUSE USB'     mat_price = '12.50' stock_actual = 3  mat_url = 'https://ejemplo.com/mouse' )
      ( mat_id = 'MAT0000003' mat_desc = 'TECLADO'       mat_price = '25.90' stock_actual = 0  mat_url = 'https://ejemplo.com/teclado' )
      ( mat_id = 'MAT0000004' mat_desc = 'MONITOR 24'    mat_price = '120.00' stock_actual = 6 mat_url = 'https://ejemplo.com/monitor' )
      ( mat_id = 'MAT0000005' mat_desc = 'WEBCAM'        mat_price = '35.00' stock_actual = 1 mat_url = 'https://ejemplo.com/webcam' )
    ).

    lt_mov = VALUE #(
      ( mov_id = 'MOV00000001' mat_id = 'MAT0000001' mov_date = sy-datum mov_type = 'E' mov_qty = 10 )
      ( mov_id = 'MOV00000002' mat_id = 'MAT0000002' mov_date = sy-datum mov_type = 'S' mov_qty = 2 )
      ( mov_id = 'MOV00000003' mat_id = 'MAT0000003' mov_date = sy-datum mov_type = 'E' mov_qty = 5 )
      ( mov_id = 'MOV00000004' mat_id = 'MAT0000004' mov_date = sy-datum mov_type = 'S' mov_qty = 1 )
      ( mov_id = 'MOV00000005' mat_id = 'MAT0000005' mov_date = sy-datum mov_type = 'S' mov_qty = 1 )
    ).

    TRY.
        DELETE FROM zmm_inv_mov.
        DELETE FROM zmm_inv_mat.

        INSERT zmm_inv_mat FROM TABLE @lt_mat.
        INSERT zmm_inv_mov FROM TABLE @lt_mov.

        COMMIT WORK.

        SELECT COUNT(*) FROM zmm_inv_mat INTO @DATA(lv_cnt_mat).
        SELECT COUNT(*) FROM zmm_inv_mov INTO @DATA(lv_cnt_mov).

        out->write( |MAT: { lv_cnt_mat } / MOV: { lv_cnt_mov }| ).

      CATCH cx_sy_open_sql_db INTO DATA(lx_sql).
        out->write( lx_sql->get_text( ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.

