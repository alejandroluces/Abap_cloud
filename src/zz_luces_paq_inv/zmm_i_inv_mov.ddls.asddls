@AbapCatalog.sqlViewName: 'ZMMINVMOV01'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Inventario - Movimientos'
@Metadata.allowExtensions: true
define view ZMM_I_INV_MOV
  as select from zmm_inv_mov
  association [0..1] to ZMM_I_INV_MAT as _Mat
    on $projection.MatId = _Mat.MatId
{
  key mov_id   as MovId,
      mat_id   as MatId,
      mov_date as MovDate,
      mov_type as MovType,
      mov_qty  as MovQty,

      _Mat
}
