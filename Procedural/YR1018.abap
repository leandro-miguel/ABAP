*&---------------------------------------------------------------------*
*& Report YR1002
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT YR1018.

*Tabelas transparentes

TABLES: ytem0001,
        ytem0002,
        ytem0003,
        ytem0004,
        ytem0005.

*Tela de seleção
PARAMETERS: p_ynomec LIKE ytem0005-ynomec OBLIGATORY,
            p_yvalor LIKE ytem0005-yvalor OBLIGATORY,
            p_waers LIKE ytem0005-waers OBLIGATORY,
            p_insert RADIOBUTTON GROUP gr1,
            p_update RADIOBUTTON GROUP gr1,
            p_modify RADIOBUTTON GROUP gr1,
            p_delete RADIOBUTTON GROUP gr1.

*Exemplo de comando INSERT
IF p_insert = 'X'.
  CLEAR ytem0005.
  ytem0005-ynomec = p_ynomec.
  ytem0005-yvalor = p_yvalor.
  ytem0005-waers = p_waers.
  INSERT ytem0005.

  IF sy-subrc = 0."Se o campo estiver retornado algum valor
  MESSAGE 'Campo inserido com sucesso!' TYPE 'S'. "Avisará uma mensagem do qual nao troco de tela no displa
  ELSE.
    ROLLBACK WORK.
    MESSAGE 'Erro de cadastro' TYPE 'I'.
  ENDIF.

*Exemplo de comando UPDATE
ELSEIF p_update = 'X'.
  UPDATE ytem0005 "Atualiza a tabela
  SET YVALOR = p_yvalor "Insere o parametro nome na variavel nome onde codigo seja limitado pelo parametro where
  WHERE YNOMEC = p_ynomec.

  IF sy-subrc = 0.
  MESSAGE 'Campo atualizado com sucesso!' TYPE 'S'.
  ELSE.
    ROLLBACK WORK. "Caso nao satisfazer a condicao, o programa volta e tenta de novo
    MESSAGE 'Erro de cadastro' TYPE 'I'.
  ENDIF.

*Exemplo de comando MODIFY
ELSEIF p_modify = 'X'.
  CLEAR ytem0005.
  ytem0005-ynomec = p_ynomec.
  ytem0005-yvalor = p_yvalor.
  ytem0005-waers = p_waers.
  MODIFY ytem0005.

  IF sy-subrc = 0.
  MESSAGE 'Campo modificado com sucesso!' TYPE 'S'.
  ELSE.
    ROLLBACK WORK.
    MESSAGE 'Erro de cadastro' TYPE 'I'.
  ENDIF.

*Exemplo de comando DELETE
ELSEIF p_delete = 'X'.
  CLEAR ytem0005.
  ytem0005-ynomec = p_ynomec.
  ytem0005-yvalor = p_yvalor.
  ytem0005-waers = p_waers.
  DELETE ytem0005.

  IF sy-subrc = 0.
  MESSAGE 'Campo deletado com sucesso!' TYPE 'S'.
  ELSE.
    ROLLBACK WORK.
    MESSAGE 'Erro de cadastro' TYPE 'I'.
  ENDIF.
ENDIF.
