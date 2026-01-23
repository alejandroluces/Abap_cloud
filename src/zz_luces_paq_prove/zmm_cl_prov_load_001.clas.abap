CLASS zmm_cl_prov_load_001 DEFINITION
  PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zmm_cl_prov_load_001 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA lt_prov TYPE STANDARD TABLE OF z_data_prov WITH EMPTY KEY.
    DATA lt_bank TYPE STANDARD TABLE OF z_data_lfbk WITH EMPTY KEY.

    lt_prov = VALUE #(
      ( prov_id = 'PROV00001' name1 = 'PROVEEDOR ABC SA'      country = 'CL' city = 'Santiago'    street = 'Av. Libertador 1000' created_on = sy-datum nif1 = '76123456-7' created_by = sy-uname )
      ( prov_id = 'PROV00002' name1 = 'COMERCIAL XYZ LTDA'    country = 'CL' city = 'Valparaiso'  street = 'Calle Principal 500'  created_on = sy-datum nif1 = '77234567-8' created_by = sy-uname )
      ( prov_id = 'PROV00003' name1 = 'DISTRIBUIDORA 123'     country = 'CL' city = 'Concepcion'  street = 'Av. Central 2000'     created_on = sy-datum nif1 = '78345678-9' created_by = sy-uname )
      ( prov_id = 'PROV00004' name1 = 'SUMINISTROS DEL SUR'   country = 'CL' city = 'Temuco'      street = 'Paseo Mall 100'       created_on = sy-datum nif1 = '79456789-0' created_by = sy-uname )
      ( prov_id = 'PROV00005' name1 = 'IMPORTADORA NORTE'     country = 'CL' city = 'Iquique'     street = 'Zona Franca 50'       created_on = sy-datum nif1 = '70567890-1' created_by = sy-uname )
    ).

    lt_bank = VALUE #(
      ( prov_id = 'PROV00001' bank_country = 'CL' bank_key = '001' bank_account = '1234567890' account_holder = 'PROVEEDOR ABC SA'    bank_cc = 'CLP' bank_type = 'CC' )
      ( prov_id = 'PROV00002' bank_country = 'CL' bank_key = '012' bank_account = '2345678901' account_holder = 'COMERCIAL XYZ LTDA'  bank_cc = 'CLP' bank_type = 'CC' )
      ( prov_id = 'PROV00003' bank_country = 'CL' bank_key = '016' bank_account = '3456789012' account_holder = 'DISTRIBUIDORA 123'   bank_cc = 'CLP' bank_type = 'CC' )
      ( prov_id = 'PROV00004' bank_country = 'CL' bank_key = '027' bank_account = '4567890123' account_holder = 'SUMINISTROS DEL SUR' bank_cc = 'CLP' bank_type = 'CC' )
      ( prov_id = 'PROV00005' bank_country = 'CL' bank_key = '037' bank_account = '5678901234' account_holder = 'IMPORTADORA NORTE'   bank_cc = 'CLP' bank_type = 'CC' )
    ).

    TRY.
        DELETE FROM z_data_lfbk.
        DELETE FROM z_data_prov.

        INSERT z_data_prov FROM TABLE @lt_prov.
        INSERT z_data_lfbk FROM TABLE @lt_bank.

        COMMIT WORK.

        SELECT COUNT(*) FROM z_data_prov INTO @DATA(lv_cnt_prov).
        SELECT COUNT(*) FROM z_data_lfbk INTO @DATA(lv_cnt_bank).

        out->write( |Proveedores cargados: { lv_cnt_prov } / Datos bancarios: { lv_cnt_bank }| ).

      CATCH cx_sy_open_sql_db INTO DATA(lx_sql).
        out->write( lx_sql->get_text( ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
