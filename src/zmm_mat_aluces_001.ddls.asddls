@AbapCatalog.sqlViewName: 'ZMMALUCESV01'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'VISTA LUCES'
define view ZMM_MAT_ALUCES_001
  as select from zmm_aluces_tab
{
  key aluces_id      as AlucesId,
      aluces_color   as AlucesColor,
      aluces_descrip as AlucesDescrip,
      aluces_prec    as AlucesPrec,
      aluces_qty     as AlucesQty,
      aluces_url     as AlucesUrl,

  ( aluces_prec * cast( aluces_qty as abap.dec(15,0) ) ) as PrecioTotal,

  /* Criticality por stock:
     >=5  Verde (3)
     1-4  Amarillo (2)
     0    Rojo (1)
  */
  cast(
    case
      when aluces_qty >= 5 then 3
      when aluces_qty >= 1 then 2
      else 1
    end
    as abap.int1
  ) as Criticality
}
