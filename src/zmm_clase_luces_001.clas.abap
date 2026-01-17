CLASS zmm_clase_luces_001 DEFINITION
  PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zmm_clase_luces_001 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA lt_luces TYPE STANDARD TABLE OF zmm_aluces_tab WITH EMPTY KEY.

    lt_luces = VALUE #(
      ( aluces_id = '00001' aluces_color = 'VERDE'
        aluces_descrip = 'LUZ VERDE'    aluces_prec = '10.50' aluces_qty = 5
        aluces_url = 'https://ejemplo.com/verde' )

      ( aluces_id = '00002' aluces_color = 'AMARILLO'
        aluces_descrip = 'LUZ AMARILLA' aluces_prec = '12.00' aluces_qty = 3
        aluces_url = 'https://ejemplo.com/amarillo' )

      ( aluces_id = '00003' aluces_color = 'ROJO'
        aluces_descrip = 'LUZ ROJA'     aluces_prec = '15.75' aluces_qty = 2
        aluces_url = 'https://ejemplo.com/rojo' )
    ).

    TRY.
        DELETE FROM zmm_aluces_tab.
        INSERT zmm_aluces_tab FROM TABLE @lt_luces.
        COMMIT WORK.

        SELECT COUNT(*) FROM zmm_aluces_tab INTO @DATA(lv_cnt).

        out->write( |Insertados: { lines( lt_luces ) } / En tabla: { lv_cnt }| ).

      CATCH cx_sy_open_sql_db INTO DATA(lx_sql).
        out->write( |Error SQL: { lx_sql->get_text( ) }| ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.

