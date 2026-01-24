@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View - Proveedores'
define root view entity ZMM_I_PROV
  as select from zdataprov
{
  key prov_id      as ProvId,
      name1        as Name1,
      country      as Country,
      city         as City,
      street       as Street,
      created_on   as CreatedOn,
      nif1         as Nif1,
      created_by   as CreatedBy
}
