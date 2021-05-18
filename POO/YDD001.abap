@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Definindo os dados'
define root view entity YDD001 as select from ytmaster01 {
    key cliente as Cliente,
        cpf as Cpf,
        rua as Rua,
        cidade as Cidade,
        cep as Cep,
        nascimento as Nascimento,
        modelo as Modelo,
        marca as Marca,
        ano as Ano,
        revenda as Revenda,
        preco as Preco,
        currency as Currency,
        nome_rev as NomeRev,
        cidade_rev as CidadeRev,
        rua_rev as RuaRev,
        cep_rev as CepRev
        }
