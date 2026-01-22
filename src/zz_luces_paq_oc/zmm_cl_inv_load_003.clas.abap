CLASS ZMM_CL_INV_LOAD_003 DEFINITION
  PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS ZMM_CL_INV_LOAD_003 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA lt_h TYPE STANDARD TABLE OF zmm_ped_h WITH EMPTY KEY.
    DATA lt_i TYPE STANDARD TABLE OF zmm_ped_i WITH EMPTY KEY.

    "Headers - 10 pedidos
    lt_h = VALUE #(
      ( pedido_id = 'PED0000001' proveedor = 'Proveedor A' fecha = sy-datum )
      ( pedido_id = 'PED0000002' proveedor = 'Proveedor B' fecha = sy-datum )
      ( pedido_id = 'PED0000003' proveedor = 'Proveedor C' fecha = sy-datum - 1 )
      ( pedido_id = 'PED0000004' proveedor = 'Proveedor D' fecha = sy-datum - 2 )
      ( pedido_id = 'PED0000005' proveedor = 'Proveedor E' fecha = sy-datum - 3 )
      ( pedido_id = 'PED0000006' proveedor = 'Proveedor F' fecha = sy-datum - 5 )
      ( pedido_id = 'PED0000007' proveedor = 'Proveedor G' fecha = sy-datum - 7 )
      ( pedido_id = 'PED0000008' proveedor = 'Proveedor H' fecha = sy-datum - 10 )
      ( pedido_id = 'PED0000009' proveedor = 'Proveedor I' fecha = sy-datum - 15 )
      ( pedido_id = 'PED0000010' proveedor = 'Proveedor J' fecha = sy-datum - 20 )
    ).

    "Items - 2 items por pedido = 20 items totales
    lt_i = VALUE #(
      " Pedido 1 - Total: 250 (amarillo)
      ( pedido_id = 'PED0000001' pos = '00001' material = 'Cable HDMI'     cantidad = '2'  precio = '50.00' )
      ( pedido_id = 'PED0000001' pos = '00002' material = 'Mouse USB'      cantidad = '5'  precio = '30.00' )

      " Pedido 2 - Total: 620 (rojo)
      ( pedido_id = 'PED0000002' pos = '00001' material = 'Teclado'        cantidad = '1'  precio = '120.00' )
      ( pedido_id = 'PED0000002' pos = '00002' material = 'Monitor 24'     cantidad = '2'  precio = '250.00' )

      " Pedido 3 - Total: 180 (verde)
      ( pedido_id = 'PED0000003' pos = '00001' material = 'WebCam HD'      cantidad = '3'  precio = '40.00' )
      ( pedido_id = 'PED0000003' pos = '00002' material = 'Audífonos'      cantidad = '2'  precio = '30.00' )

      " Pedido 4 - Total: 850 (rojo)
      ( pedido_id = 'PED0000004' pos = '00001' material = 'Laptop Dell'    cantidad = '1'  precio = '650.00' )
      ( pedido_id = 'PED0000004' pos = '00002' material = 'Mouse Pad'      cantidad = '10' precio = '20.00' )

      " Pedido 5 - Total: 95 (verde)
      ( pedido_id = 'PED0000005' pos = '00001' material = 'USB 32GB'       cantidad = '5'  precio = '15.00' )
      ( pedido_id = 'PED0000005' pos = '00002' material = 'Cable USB-C'    cantidad = '2'  precio = '10.00' )

      " Pedido 6 - Total: 420 (amarillo)
      ( pedido_id = 'PED0000006' pos = '00001' material = 'Impresora HP'   cantidad = '1'  precio = '350.00' )
      ( pedido_id = 'PED0000006' pos = '00002' material = 'Tinta Negra'    cantidad = '2'  precio = '35.00' )

      " Pedido 7 - Total: 1150 (rojo)
      ( pedido_id = 'PED0000007' pos = '00001' material = 'Tablet Samsung' cantidad = '2'  precio = '450.00' )
      ( pedido_id = 'PED0000007' pos = '00002' material = 'Funda Tablet'   cantidad = '5'  precio = '50.00' )

      " Pedido 8 - Total: 160 (verde)
      ( pedido_id = 'PED0000008' pos = '00001' material = 'Hub USB 4 Port' cantidad = '4'  precio = '25.00' )
      ( pedido_id = 'PED0000008' pos = '00002' material = 'Cable HDMI 2m'  cantidad = '3'  precio = '20.00' )

      " Pedido 9 - Total: 305 (amarillo)
      ( pedido_id = 'PED0000009' pos = '00001' material = 'Router WiFi'    cantidad = '1'  precio = '180.00' )
      ( pedido_id = 'PED0000009' pos = '00002' material = 'Cable Ethernet' cantidad = '5'  precio = '25.00' )

      " Pedido 10 - Total: 575 (rojo)
      ( pedido_id = 'PED0000010' pos = '00001' material = 'Disco SSD 1TB'  cantidad = '1'  precio = '450.00' )
      ( pedido_id = 'PED0000010' pos = '00002' material = 'Gabinete HD'    cantidad = '5'  precio = '25.00' )
    ).

    TRY.
        DELETE FROM zmm_ped_i.
        DELETE FROM zmm_ped_h.

        INSERT zmm_ped_h FROM TABLE @lt_h.
        INSERT zmm_ped_i FROM TABLE @lt_i.

        COMMIT WORK.

        SELECT COUNT(*) FROM zmm_ped_h INTO @DATA(lv_h).
        SELECT COUNT(*) FROM zmm_ped_i INTO @DATA(lv_i).

        out->write( |Cargado OK. Headers: { lv_h } / Items: { lv_i }| ).

      CATCH cx_sy_open_sql_db INTO DATA(lx).
        out->write( lx->get_text( ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
