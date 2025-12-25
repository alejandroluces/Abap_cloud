CLASS zmm_insert_mat_aluces DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmm_insert_mat_aluces IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " Limpiar tabla antes de insertar
    DELETE FROM zmm_aluces_mat.

    " Insertar datos usando sintaxis moderna VALUE
    INSERT zmm_aluces_mat FROM TABLE @( VALUE #(
      ( client = sy-mandt
        matnr  = '000000000000000001'
        maktx  = 'Tornillo M8 x 20mm'
        meins  = 'UN'
        mtart  = 'ROH'
        matkl  = 'TORN001'
        werks  = '1000'
        lgort  = '0001'
        labst  = '1500.000'
        precio = '0.50'
        waers  = 'CLP'
        ernam  = sy-uname
        erdat  = sy-datum )

      ( client = sy-mandt
        matnr  = '000000000000000002'
        maktx  = 'Tuerca Hexagonal M8'
        meins  = 'UN'
        mtart  = 'ROH'
        matkl  = 'TORN001'
        werks  = '1000'
        lgort  = '0001'
        labst  = '2000.000'
        precio = '0.30'
        waers  = 'CLP'
        ernam  = sy-uname
        erdat  = sy-datum )

      ( client = sy-mandt
        matnr  = '000000000000000003'
        maktx  = 'Cable Eléctrico 2.5mm'
        meins  = 'MT'
        mtart  = 'ROH'
        matkl  = 'ELEC001'
        werks  = '1000'
        lgort  = '0002'
        labst  = '500.000'
        precio = '150.00'
        waers  = 'CLP'
        ernam  = sy-uname
        erdat  = sy-datum )

      ( client = sy-mandt
        matnr  = '000000000000000004'
        maktx  = 'Perno Acero Inoxidable'
        meins  = 'UN'
        mtart  = 'ROH'
        matkl  = 'TORN002'
        werks  = '1000'
        lgort  = '0001'
        labst  = '800.000'
        precio = '1.20'
        waers  = 'CLP'
        ernam  = sy-uname
        erdat  = sy-datum )

      ( client = sy-mandt
        matnr  = '000000000000000005'
        maktx  = 'Arandela Plana M8'
        meins  = 'UN'
        mtart  = 'ROH'
        matkl  = 'TORN001'
        werks  = '1000'
        lgort  = '0001'
        labst  = '3000.000'
        precio = '0.15'
        waers  = 'CLP'
        ernam  = sy-uname
        erdat  = sy-datum )
    ) ).

    " Verificar resultado
    IF sy-subrc = 0.
      out->write( |✓ { sy-dbcnt } registros insertados correctamente| ).
    ELSE.
      out->write( |✗ Error al insertar datos: { sy-subrc }| ).
      RETURN.
    ENDIF.

    " Consultar y mostrar datos insertados
    SELECT FROM zmm_aluces_mat
      FIELDS matnr, maktx, meins, labst, precio, waers, werks
      ORDER BY matnr
      INTO TABLE @DATA(lt_materiales).

    IF sy-subrc = 0.
      out->write( |━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━| ).
      out->write( |MATERIALES REGISTRADOS ({ lines( lt_materiales ) })| ).
      out->write( |━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━| ).
      out->write( lt_materiales ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
