@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Empleado RAP - Consumo'
@Metadata.allowExtensions: true
define root view entity ZC_EMP_RAP_001
  as projection on ZI_EMP_RAP_001
{
  key emp_id,
      first_name,
      last_name,
      email,
      hire_date,
      department,
      salary,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_EMP_STATUS_VH', element: 'Status' } }]
      status,
      created_by,
      created_at,
      last_changed_by,
      last_changed_at
}
