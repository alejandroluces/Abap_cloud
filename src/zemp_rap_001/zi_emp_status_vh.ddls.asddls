@EndUserText.label: 'Status Value Help'
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.query.implementedBy: 'ABAP:ZCL_EMP_STATUS_VH'
define custom entity ZI_EMP_STATUS_VH
{
  key Status : abap.char(10);
  Description : abap.char(20);
}