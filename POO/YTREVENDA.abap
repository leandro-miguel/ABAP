@EndUserText.label : 'Tabela de Revenda'
@AbapCatalog.enhancementCategory : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table ytrevenda {
  key client     : abap.clnt not null;
  key revenda    : abap.int1 not null;
  key nome_rev   : ynome not null;
  key cidade_rev : ycidade not null;
  key rua_rev    : yrua not null;
  key cep_rev    : ycep not null;

}
