@EndUserText.label: 'Pedidos - Totales (CDS)'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZMM_I_PED_TOT
  as select from ZMM_I_PED_ITEM
{
  PedidoId,
  sum( Subtotal ) as Total
}
group by PedidoId
