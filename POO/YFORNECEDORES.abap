@EndUserText.label : 'Tabela de Fornecedores'
@AbapCatalog.enhancementCategory : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table yfornecedores {
  key client   : abap.clnt not null;
  key modelo   : ymodelo not null;
  key marca    : ymarca not null;
  key ano      : yano not null;
  key revenda  : abap.int1 not null;
  @Semantics.amount.currencyCode : 'yfornecedores.currency'
  key preco    : ypreco not null;
  key currency : abap.cuky not null;

}
