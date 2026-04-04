CLASS lhc_Employee DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Employee
      RESULT result.

    METHODS set_default_status FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Employee~set_default_status.

    METHODS validate_employee FOR VALIDATE ON SAVE
      IMPORTING keys FOR Employee~validate_employee.

ENDCLASS.

CLASS lhc_Employee IMPLEMENTATION.

  METHOD get_global_authorizations.

    result-%create = if_abap_behv=>auth-allowed.
    result-%update = if_abap_behv=>auth-allowed.
    result-%delete = if_abap_behv=>auth-allowed.

  ENDMETHOD.

  METHOD set_default_status.

    READ ENTITIES OF zi_emp_rap_001 IN LOCAL MODE
      ENTITY Employee
      FIELDS ( status )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_employee).

    LOOP AT lt_employee ASSIGNING FIELD-SYMBOL(<ls_employee>).
      IF <ls_employee>-status IS INITIAL.
        MODIFY ENTITIES OF zi_emp_rap_001 IN LOCAL MODE
          ENTITY Employee
          UPDATE FIELDS ( status )
          WITH VALUE #(
            ( %tky   = <ls_employee>-%tky
              status = 'ACTIVO' )
          ).
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD validate_employee.

    READ ENTITIES OF zi_emp_rap_001 IN LOCAL MODE
      ENTITY Employee
      FIELDS ( emp_id first_name last_name email hire_date department salary )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_employee).

    LOOP AT lt_employee INTO DATA(ls_employee).

      IF ls_employee-first_name IS INITIAL.
        APPEND VALUE #(
          %tky = ls_employee-%tky
          %msg = new_message_with_text(
                   severity = if_abap_behv_message=>severity-error
                   text     = 'El nombre es obligatorio' )
          %element-first_name = if_abap_behv=>mk-on
        ) TO reported-employee.
        APPEND VALUE #( %tky = ls_employee-%tky ) TO failed-employee.
      ENDIF.

      IF ls_employee-last_name IS INITIAL.
        APPEND VALUE #(
          %tky = ls_employee-%tky
          %msg = new_message_with_text(
                   severity = if_abap_behv_message=>severity-error
                   text     = 'El apellido es obligatorio' )
          %element-last_name = if_abap_behv=>mk-on
        ) TO reported-employee.
        APPEND VALUE #( %tky = ls_employee-%tky ) TO failed-employee.
      ENDIF.

      IF ls_employee-email IS INITIAL.
        APPEND VALUE #(
          %tky = ls_employee-%tky
          %msg = new_message_with_text(
                   severity = if_abap_behv_message=>severity-error
                   text     = 'El email es obligatorio' )
          %element-email = if_abap_behv=>mk-on
        ) TO reported-employee.
        APPEND VALUE #( %tky = ls_employee-%tky ) TO failed-employee.
      ENDIF.

      IF ls_employee-department IS INITIAL.
        APPEND VALUE #(
          %tky = ls_employee-%tky
          %msg = new_message_with_text(
                   severity = if_abap_behv_message=>severity-error
                   text     = 'El área es obligatoria' )
          %element-department = if_abap_behv=>mk-on
        ) TO reported-employee.
        APPEND VALUE #( %tky = ls_employee-%tky ) TO failed-employee.
      ENDIF.

      IF ls_employee-salary <= 0.
        APPEND VALUE #(
          %tky = ls_employee-%tky
          %msg = new_message_with_text(
                   severity = if_abap_behv_message=>severity-error
                   text     = 'El salario debe ser mayor a 0' )
          %element-salary = if_abap_behv=>mk-on
        ) TO reported-employee.
        APPEND VALUE #( %tky = ls_employee-%tky ) TO failed-employee.
      ENDIF.

      IF ls_employee-hire_date > cl_abap_context_info=>get_system_date( ).
        APPEND VALUE #(
          %tky = ls_employee-%tky
          %msg = new_message_with_text(
                   severity = if_abap_behv_message=>severity-error
                   text     = 'La fecha de ingreso no puede ser futura' )
          %element-hire_date = if_abap_behv=>mk-on
        ) TO reported-employee.
        APPEND VALUE #( %tky = ls_employee-%tky ) TO failed-employee.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
