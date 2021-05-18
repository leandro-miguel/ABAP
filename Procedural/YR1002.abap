*&---------------------------------------------------------------------*
*& Report YR1002
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT YR1002.

*Tabelas transparentes

TABLES: ytem0001,
        ytem0002,
        ytem0003,
        ytem0005.

*Tela de seleção
PARAMETERS: p_ycodc LIKE ytem0003-ycodc OBLIGATORY,
            p_ynome LIKE ytem0003-ynome OBLIGATORY,
            p_insert RADIOBUTTON GROUP gr1,
            p_update RADIOBUTTON GROUP gr1,
            p_modify RADIOBUTTON GROUP gr1,
            p_delete RADIOBUTTON GROUP gr1.

*Exemplo de comando INSERT
IF p_insert = 'X'.
  CLEAR ytem0003.
  ytem0003-ycodc = p_ycodc.
  ytem0003-ynome = p_ynome.
  INSERT ytem0003.

  IF sy-subrc = 0."Se o campo estiver retornado algum valor
  MESSAGE 'Campo inserido com sucesso!' TYPE 'S'. "Avisará uma mensagem do qual nao troco de tela no displa
  ELSE.
    ROLLBACK WORK.
    MESSAGE 'Erro de cadastro' TYPE 'I'.
  ENDIF.

*Exemplo de comando UPDATE
ELSEIF p_update = 'X'.
  UPDATE ytem0003 "Atualiza a tabela
  SET YNOME = p_ynome "Insere o parametro nome na variavel nome onde codigo seja limitado pelo parametro where
  WHERE YCODC = p_ycodc.

  IF sy-subrc = 0.
  MESSAGE 'Campo atualizado com sucesso!' TYPE 'S'.
  ELSE.
    ROLLBACK WORK. "Caso nao satisfazer a condicao, o programa volta e tenta de novo
    MESSAGE 'Erro de cadastro' TYPE 'I'.
  ENDIF.

*Exemplo de comando MODIFY
ELSEIF p_modify = 'X'.
  CLEAR ytem0003.
  ytem0003-ycodc = p_ycodc.
  ytem0003-ynome = p_ynome.
  MODIFY ytem0003.

  IF sy-subrc = 0.
  MESSAGE 'Campo modificado com sucesso!' TYPE 'S'.
  ELSE.
    ROLLBACK WORK.
    MESSAGE 'Erro de cadastro' TYPE 'I'.
  ENDIF.

*Exemplo de comando DELETE
ELSEIF p_delete = 'X'.
  CLEAR ytem0003.
  ytem0003-ycodc = p_ycodc.
  ytem0003-ynome = p_ynome.
  DELETE ytem0003.

  IF sy-subrc = 0.
  MESSAGE 'Campo deletado com sucesso!' TYPE 'S'.
  ELSE.
    ROLLBACK WORK.
    MESSAGE 'Erro de cadastro' TYPE 'I'.
  ENDIF.
ENDIF.
