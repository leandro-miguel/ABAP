@EndUserText.label : 'Tabela de Clientes'
@AbapCatalog.enhancementCategory : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table ytclientes {
  key client     : abap.clnt not null;
  key cliente    : ynome not null;
  key cpf        : ycpf not null;
  key rua        : yrua not null;
  key cidade     : ycidade not null;
  key cep        : ycep not null;
  key nascimento : abap.dats not null;
  key modelo     : ymodelo not null;

}
