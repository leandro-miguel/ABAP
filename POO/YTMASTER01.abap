@EndUserText.label : 'Tabela que recebe os valores das tres tabelas'
@AbapCatalog.enhancementCategory : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #ALLOWED
define table ytmaster01 {
  key cliente : ynome not null;
  cpf         : ycpf;
  rua         : yrua;
  cidade      : ycidade;
  cep         : ycep;
  nascimento  : abap.dats;
  modelo      : ymodelo;
  marca       : ymarca;
  ano         : yano;
  revenda     : abap.int1;
  @Semantics.amount.currencyCode : 'ytmaster01.currency'
  preco       : ypreco;
  currency    : abap.cuky;
  nome_rev    : ynome;
  cidade_rev  : ycidade;
  rua_rev     : yrua;
  cep_rev     : ycep;

}
