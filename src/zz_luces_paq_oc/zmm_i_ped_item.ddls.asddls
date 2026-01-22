@EndUserText.label: 'Pedidos - Items (CDS)'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZMM_I_PED_ITEM
  as select from zmm_ped_i
{
  key pedido_id                           as PedidoId,
  key pos                                 as Pos,

      material                            as Material,
      cantidad                            as Cantidad,
      precio                              as Precio,

      cast(
        cast( precio as abap.dec(15,2) )
        * cast( cantidad as abap.dec(13,3) )
        as abap.dec(16,2)
      )                                   as Subtotal
}
