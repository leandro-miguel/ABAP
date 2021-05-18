*&---------------------------------------------------------------------*
*& Report YR1011
*&---------------------------------------------------------------------*
*& Selecionar a Tabela Alunos com a Tabela Professores
*&---------------------------------------------------------------------*
REPORT yr1011.

*Chamando a tabela transparente
TABLES: ytem0003.

*Declarando a tabela de saída
TYPES: BEGIN OF ytsaida,
  ynome LIKE ytem0003-ynome,
  ynomec LIKE ytem0003-ynomec,
  ycser LIKE ytem0003-ycser,
  yctur LIKE ytem0003-yctur,
  ynomep LIKE ytem0004-nomep,
  END OF ytsaida.

*Tabela Interna de saída
 data t_ytsaida TYPE TABLE OF ytsaida WITH HEADER LINE.

*Inicio do Processamento
 START-OF-SELECTION.

 PERFORM: f_selection_dados,
          f_imprime_dados.
*&---------------------------------------------------------------------*
*& Form f_selection_dados
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_selection_dados .
  SELECT ytem0003~ynome ytem0003~ynomec ytem0003~ycser ytem0003~yctur ytem0004~nomep
    from ytem0003
    INNER JOIN ytem0004
    on ytem0004~ycser = ytem0003~ycser
    into table t_ytsaida.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_imprime_dados
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_imprime_dados .
  LOOP AT t_ytsaida.
     WRITE: / t_ytsaida-ynome, t_ytsaida-ynomec, t_ytsaida-ycser, t_ytsaida-yctur, t_ytsaida-ynomep.
  ENDLOOP.
ENDFORM.
