@AbapCatalog.sqlViewName: 'ZMM_MAT_ALUCES_L'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'MAT ALUCES'
@Metadata.ignorePropagatedAnnotations: true
define view ZMM_MAT_ALUCES_001 as select from zmm_aluces_mat
{
    key matnr as Matnr,
    maktx as Maktx,
    meins as Meins,
    mtart as Mtart,
    matkl as Matkl,
    werks as Werks,
    lgort as Lgort,
    labst as Labst,
    precio as Precio,
    waers as Waers,
    ernam as Ernam,
    erdat as Erdat,
    aenam as Aenam,
    aedat as Aedat
    
}
