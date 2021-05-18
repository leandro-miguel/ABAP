REPORT YR1002.

*Tabelas transparentes

TABLES: yt0001. "Tabela Tipo de Material

*Tela de seleção
PARAMETERS: p_tpmat LIKE yt0001-tpmat OBLIGATORY,
            p_denom LIKE yt0001-denom OBLIGATORY,
            p_insert RADIOBUTTON GROUP gr1,
            p_update RADIOBUTTON GROUP gr1,
            p_modify RADIOBUTTON GROUP gr1,
            p_delete RADIOBUTTON GROUP gr1.

*Exemplo de comando INSERT
IF p_insert = 'X'.
  CLEAR yt0001.
  yt0001-tpmat = p_tpmat.
  yt0001-denom = p_denom.
  INSERT yt0001.

  IF sy-subrc = 0.
  MESSAGE 'Campo inserido com sucesso!' TYPE 'S'.
  ELSE.
    ROLLBACK WORK.
    MESSAGE 'Erro de cadastro' TYPE 'I'.
  ENDIF.
*
**Exemplo de comando UPDATE
*ELSEIF p_update = 'X'.
*  CLEAR ytem0001.
*  ytem0001-ycodc = p_ycodc.
*  ytem0001-ynome = p_ynome.
*  UPDATE ytem0001.
*
*  IF sy-subrc = 0.
*  MESSAGE 'Campo atualizado com sucesso!' TYPE 'S'.
*  ELSE.
*    ROLLBACK WORK.
*    MESSAGE 'Erro de cadastro' TYPE 'I'.
*  ENDIF.
*
**Exemplo de comando MODIFY
*ELSEIF p_modify = 'X'.
*  CLEAR ytem0001.
*  ytem0001-ycodc = p_ycodc.
*  ytem0001-ynome = p_ynome.
*  MODIFY ytem0001.
*
*  IF sy-subrc = 0.
*  MESSAGE 'Campo modificado com sucesso!' TYPE 'S'.
*  ELSE.
*    ROLLBACK WORK.
*    MESSAGE 'Erro de cadastro' TYPE 'I'.
*  ENDIF.
*
**Exemplo de comando DELETE
*ELSEIF p_delete = 'X'.
*  CLEAR ytem0001.
*  ytem0001-ycodc = p_ycodc.
*  ytem0001-ynome = p_ynome.
*  DELETE ytem0001.
*
*  IF sy-subrc = 0.
*  MESSAGE 'Campo deletado com sucesso!' TYPE 'S'.
*  ELSE.
*    ROLLBACK WORK.
*    MESSAGE 'Erro de cadastro' TYPE 'I'.
*  ENDIF.
ENDIF.
