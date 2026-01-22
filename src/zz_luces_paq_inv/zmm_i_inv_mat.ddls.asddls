@AbapCatalog.sqlViewName: 'ZMMINVMAT01'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Inventario - Materiales'
@Metadata.allowExtensions: true

define view ZMM_I_INV_MAT
  as select from zmm_inv_mat
{
  key mat_id       as MatId,
      mat_desc     as MatDesc,
      mat_price    as MatPrice,
      stock_actual as StockActual,
      mat_url      as MatUrl,

  ( mat_price * cast( stock_actual as abap.dec(15,0) ) ) as ValorStock,

  cast(
    case
      when stock_actual >= 5 then 3
      when stock_actual >= 1 then 2
      else 1
    end
    as abap.int1
  ) as Criticality
}


