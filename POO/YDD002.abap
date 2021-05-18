@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Definindo a projeção de visualização'

@UI: {
headerInfo: {typeName: 'Revenda', typeNamePlural: 'Revendas',
title:{type: #STANDARD, value: 'RevendasID'}}}

//@Search.searchable: true

define root view entity ydd002
  as select from YDD001
{
      @UI.facet: [{ id: 'Revendas',
                    purpose: #STANDARD,
                    type: #IDENTIFICATION_REFERENCE,
                    label: 'Status',
                    position: 10 }]
      @UI.hidden: true

      @UI: {
      lineItem: [{position: 10, importance: #HIGH }],
      identification: [{position: 10, label: 'Cliente' }]}
      @Search.defaultSearchElement: true
      
      key Cliente       as RevendasID,

      @UI:{
      lineItem: [{position: 20, importance: #HIGH }],
      identification: [{position: 20, label: 'CPF' }]}
      @Search.defaultSearchElement: true
      
      Cpf        as cpfID,

      @UI:{
      lineItem: [{position: 30, importance: #HIGH }],
      identification: [{position: 30, label: 'Rua' }]}
      @Search.defaultSearchElement: true

      Rua        as ruaID,

      @UI:{
      lineItem: [{position: 40, importance: #HIGH }],
      identification: [{position: 40, label: 'Cidade' }]}
      @Search.defaultSearchElement: true

      Cidade     as cidadeID,

      @UI:{
      lineItem: [{position: 50, importance: #HIGH }],
      identification: [{position: 50, label: 'CEP' }]}
      @Search.defaultSearchElement: true

      Cep        as cepID,

      @UI:{
      lineItem: [{position: 60, importance: #HIGH }],
      identification: [{position: 60, label: 'Data de Nascimento' }]}
      @Search.defaultSearchElement: true

      Nascimento as nascimentoID,

      @UI:{
      lineItem: [{position: 70, importance: #HIGH }],
      identification: [{position: 70, label: 'Modelo' }]}
      @Search.defaultSearchElement: true

      Modelo     as modeloID,

      @UI:{
      lineItem: [{position: 80, importance: #HIGH }],
      identification: [{position: 80, label: 'Marca' }]}
      @Search.defaultSearchElement: true

      Marca      as marcaID,
      
      @UI:{
      lineItem: [{position: 90, importance: #HIGH }],
      identification: [{position: 90, label: 'Ano' }]}
      @Search.defaultSearchElement: true
      
      Ano as anoID,
      
      @UI:{
      lineItem: [{position: 100, importance: #HIGH }],
      identification: [{position: 100, label: 'Revenda' }]}
      @Search.defaultSearchElement: true
      
      Revenda as Revenda,
      
      @UI:{
      lineItem: [{position: 110, importance: #HIGH }],
      identification: [{position: 110, label: 'Preço' }]}
      @Search.defaultSearchElement: true
      
      Preco as precoID,
      
      @UI:{
      lineItem: [{position: 120, importance: #HIGH }],
      identification: [{position: 120, label: 'Currency' }]}
      @Search.defaultSearchElement: true
      
      Currency as currency,
      
      @UI:{
      lineItem: [{position: 130, importance: #HIGH }],
      identification: [{position: 130, label: 'Nome Revenda' }]}
      @Search.defaultSearchElement: true
      
      NomeRev as nomeRevID,
      
      @UI:{
      lineItem: [{position: 140, importance: #HIGH }],
      identification: [{position: 140, label: 'Cidade Revenda' }]}
      @Search.defaultSearchElement: true
      
      CidadeRev as cidadeRevID,
      
      @UI:{
      lineItem: [{position: 150, importance: #HIGH }],
      identification: [{position: 150, label: 'Rua Revenda' }]}
      @Search.defaultSearchElement: true
      
      RuaRev as ruaRevID,
      
      @UI:{
      lineItem: [{position: 160, importance: #HIGH }],
      identification: [{position: 160, label: 'CEP Revenda' }]}
      @Search.defaultSearchElement: true
      
      CepRev as cepRevID

}
