CLASS zcl_emp_load_data_001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_emp_load_data_001 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_empleados TYPE TABLE OF zemp_rap_001.

    " Limpiar datos anteriores si se desea (opcional)
    " DELETE FROM zemp_rap_001.

    lt_empleados = VALUE #(
      ( emp_id = '1000000001' first_name = 'Juan'     last_name = 'Pérez'      email = 'juan.perez@empresa.com'       hire_date = '20230115' department = 'IT'          salary = '3500.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000002' first_name = 'María'    last_name = 'Gómez'      email = 'maria.gomez@empresa.com'      hire_date = '20230220' department = 'HR'          salary = '3200.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000003' first_name = 'Carlos'   last_name = 'López'      email = 'carlos.lopez@empresa.com'     hire_date = '20221105' department = 'Finance'     salary = '4000.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000004' first_name = 'Ana'      last_name = 'Martínez'   email = 'ana.martinez@empresa.com'     hire_date = '20210810' department = 'Marketing'   salary = '3100.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000005' first_name = 'Luis'     last_name = 'Rodríguez'  email = 'luis.rodriguez@empresa.com'   hire_date = '20240105' department = 'Sales'       salary = '2900.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000006' first_name = 'Laura'    last_name = 'Fernández'  email = 'laura.fernandez@empresa.com'  hire_date = '20200512' department = 'IT'          salary = '3800.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000007' first_name = 'David'    last_name = 'García'     email = 'david.garcia@empresa.com'     hire_date = '20230718' department = 'Operations'  salary = '2800.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000008' first_name = 'Sofía'    last_name = 'Sánchez'    email = 'sofia.sanchez@empresa.com'    hire_date = '20220325' department = 'HR'          salary = '3300.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000009' first_name = 'Diego'    last_name = 'Romero'     email = 'diego.romero@empresa.com'     hire_date = '20211130' department = 'Finance'     salary = '4200.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000010' first_name = 'Elena'    last_name = 'Suárez'     email = 'elena.suarez@empresa.com'     hire_date = '20240214' department = 'Marketing'   salary = '3000.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000011' first_name = 'Javier'   last_name = 'Díaz'       email = 'javier.diaz@empresa.com'      hire_date = '20190901' department = 'Sales'       salary = '3100.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000012' first_name = 'Carmen'   last_name = 'Torres'     email = 'carmen.torres@empresa.com'    hire_date = '20230410' department = 'IT'          salary = '3600.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000013' first_name = 'Miguel'   last_name = 'Ruiz'       email = 'miguel.ruiz@empresa.com'      hire_date = '20201022' department = 'Operations'  salary = '2900.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000014' first_name = 'Patricia' last_name = 'Alonso'     email = 'patricia.alonso@empresa.com'  hire_date = '20220615' department = 'HR'          salary = '3400.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000015' first_name = 'Roberto'  last_name = 'Gutiérrez'  email = 'roberto.gutierrez@empresa.com' hire_date = '20210228' department = 'Finance'     salary = '4100.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000016' first_name = 'Silvia'   last_name = 'Navarro'    email = 'silvia.navarro@empresa.com'   hire_date = '20231105' department = 'Marketing'   salary = '3200.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000017' first_name = 'Alejandro' last_name = 'Domínguez' email = 'alejandro.dom@empresa.com'    hire_date = '20180719' department = 'Sales'       salary = '3300.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000018' first_name = 'Rosa'     last_name = 'Ramos'      email = 'rosa.ramos@empresa.com'       hire_date = '20240301' department = 'IT'          salary = '3400.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000019' first_name = 'Pablo'    last_name = 'Gil'        email = 'pablo.gil@empresa.com'        hire_date = '20220912' department = 'Operations'  salary = '2700.00' currency_code = 'USD' status = 'ACTIVO' )
      ( emp_id = '1000000020' first_name = 'Lucía'    last_name = 'Blanco'     email = 'lucia.blanco@empresa.com'     hire_date = '20210408' department = 'HR'          salary = '3500.00' currency_code = 'USD' status = 'ACTIVO' )
    ).

    MODIFY zemp_rap_001 FROM TABLE @lt_empleados.

    IF sy-subrc = 0.
      out->write( '¡Éxito! Se han insertado 20 empleados ficticios correctamente.' ).
    ELSE.
      out->write( 'Hubo un error al insertar los datos.' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
