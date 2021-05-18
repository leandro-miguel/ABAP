*&---------------------------------------------------------------------*
*& Report YR1022
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr1022.

TABLES: yt0002.

SELECTION-SCREEN BEGIN OF BLOCK part1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_denom LIKE yt0002-denom OBLIGATORY,
              p_bukrs LIKE yt0002-bukrs.
SELECTION-SCREEN END OF BLOCK part1.

SELECTION-SCREEN BEGIN OF BLOCK part2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_insert RADIOBUTTON GROUP r1 DEFAULT 'X',
              p_update RADIOBUTTON GROUP r1,
              p_modify RADIOBUTTON GROUP r1,
              p_delete RADIOBUTTON GROUP r1.
SELECTION-SCREEN END OF BLOCK part2.

IF p_insert = 'X'.
  CLEAR yt0002.
  yt0002-denom = p_denom.
  yt0002-bukrs = p_bukrs.
  INSERT yt0002.
  IF sy-subrc = 0.
    MESSAGE 'Campo inserido com sucesso' TYPE 'I'.
  ELSEIF yt0002-denom = p_denom.
    MESSAGE 'Empresa já cadastrada' TYPE 'I'.
  ELSE.
    ROLLBACK WORK.
    MESSAGE 'Erro de cadastro' TYPE 'I'.
  ENDIF.
  ELSEIF p_update = 'X'.
    UPDATE yt0002
    SET denom = p_denom
    WHERE bukrs = p_bukrs.
  IF sy-subrc = 0.
    MESSAGE 'Campo atualizado com sucesso' TYPE 'I'.
  ELSE.
    ROLLBACK WORK.
    MESSAGE 'Erro de cadastro' TYPE 'I'.
  ENDIF.
  ELSEIF p_modify = 'X'.
     yt0002-denom = p_denom.
     yt0002-bukrs = p_bukrs.
     MODIFY yt0002.
  IF sy-subrc = 0.
    MESSAGE 'Campo atualizado com sucesso' TYPE 'I'.
    ELSE.
      ROLLBACK WORK.
      MESSAGE 'Erro na modificação' TYPE 'I'.
   ENDIF.
   ELSEIF p_delete = 'X'.
     yt0002-denom = p_denom.
     yt0002-bukrs = p_bukrs.
     DELETE yt0002.
    IF sy-subrc = 0.
     MESSAGE 'Campo deletado com sucesso' TYPE 'I'.
    ELSE.
      ROLLBACK WORK.
      MESSAGE 'Erro na exclusão' TYPE 'I'.
   ENDIF.
  ENDIF.
