@EndUserText.label: 'Pedidos - Header (CDS)'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZMM_I_PED_HEAD
  as select from zmm_ped_h as H
  association [0..1] to ZMM_I_PED_TOT  as _Tot on _Tot.PedidoId = H.pedido_id
  association [0..*] to ZMM_I_PED_ITEM as _Items on _Items.PedidoId = H.pedido_id
{
  key H.pedido_id        as PedidoId,
      H.proveedor        as Proveedor,
      H.fecha            as Fecha,

      cast( coalesce( _Tot.Total, 0 ) as abap.dec(16,2) ) as Total,

      /* Semáforo por Total:
         >=500 rojo(1), 200-499 amarillo(2), <200 verde(3)
      */
      cast(
        case
          when coalesce( _Tot.Total, 0 ) >= 500 then 1
          when coalesce( _Tot.Total, 0 ) >= 200 then 2
          else 3
        end
        as abap.int1
      ) as Criticality,

      _Items
}
