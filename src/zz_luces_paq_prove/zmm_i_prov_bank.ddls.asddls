@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View - Datos Bancarios Proveedor'
@Metadata.allowExtensions: true
define view entity ZMM_I_PROV_BANK
  as select from zdatalfbk
  association to parent ZMM_I_PROV as _Provider on $projection.ProvId = _Provider.ProvId
{
  key prov_id         as ProvId,
  key bank_country    as BankCountry,
  key bank_key        as BankKey,
  key bank_account    as BankAccount,
      account_holder  as AccountHolder,
      bank_cc         as BankCc,
      bank_type       as BankType,
      
      _Provider
}
