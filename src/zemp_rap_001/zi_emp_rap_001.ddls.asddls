@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Empleado RAP - Interface'
@Metadata.allowExtensions: true
define root view entity ZI_EMP_RAP_001
  as select from zemp_rap_001
{
  key emp_id,
      first_name,
      last_name,
      email,
      hire_date,
      department,
      salary,
      status,
      created_by,
      created_at,
      last_changed_by,
      last_changed_at,
      local_last_changed_at
}
