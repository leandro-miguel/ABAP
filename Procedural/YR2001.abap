*&---------------------------------------------------------------------*
*& Report YR2001
*&---------------------------------------------------------------------*
*& Fazer com RadioButtom as escolhas das cores.
*& Observação eu fiz os tratamentos de erros com as condições de controle. O certo seria fazer com try catch.
*&---------------------------------------------------------------------*
REPORT yr2001.

TABLES: yt2020,
        yt2021,
        yt2022.

DATA: variavel like yt2022-ycor.

DATA t_yt2022 TYPE TABLE OF yt2022 WITH HEADER LINE.

DATA: saida1 TYPE string,
      saida2 TYPE string,
      saida3 TYPE string,
      saida4 TYPE string.

SELECTION-SCREEN BEGIN OF BLOCK part01 WITH FRAME TITLE TEXT-001.
PARAMETERS:
           p_dia LIKE yt2021-ydia OBLIGATORY,
           p_mes LIKE yt2020-ymes OBLIGATORY.
SELECTION-SCREEN END OF BLOCK part01.

SELECTION-SCREEN BEGIN OF BLOCK part02 WITH FRAME TITLE TEXT-002.
PARAMETERS:
           "Inserir as cores que possuir na tabela com o parametro de radiobutton
           amarelo RADIOBUTTON GROUP g1 DEFAULT 'X',
           azul RADIOBUTTON GROUP g1,
           branco RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK part02.

PERFORM:
         executa_comandos,
         imprime_dados.
*&---------------------------------------------------------------------*
*& Form executa_comandos
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM executa_comandos .

SELECT * FROM yt2021.
  IF p_dia = yt2021-ydia.
    saida2 = yt2021-yfrase.
  ENDIF.
    IF p_dia > 31 .
      MESSAGE 'Insira um dia válido' TYPE 'S'.
      STOP.
    ELSE.
      MESSAGE 'OK' TYPE 'S'.
    ENDIF.
ENDSELECT.

SELECT * FROM yt2020.
  IF p_mes = yt2020-ymes.
    saida1 = yt2020-yfrase.
   ENDIF.
   IF p_mes > 12 .
    MESSAGE 'Insira um mês válido' TYPE 'S'.
    STOP.
   ELSE.
    MESSAGE 'OK' TYPE 'S'.
   ENDIF.
ENDSELECT.

SELECT * FROM yt2022 INTO t_yt2022.
  APPEND T_YT2022.
  ENDSELECT.
 LOOP AT t_yt2022.
    READ TABLE t_yt2022 into t_yt2022 with key ycor = t_yt2022-ycor.
    IF sy-subrc = 0.
      variavel = t_yt2022-ycor.
      IF variavel = 'AMARELO' and amarelo = 'X'.
        saida3 = t_yt2022-yfrases.
      ELSEIF variavel = 'AZUL' and azul = 'X'.
        saida3 = t_yt2022-yfrases.
      ELSEIF variavel = 'BRANCO' and branco = 'X'.
        saida3 = t_YT2022-yfrases.
      ENDIF.
    ENDIF.
  ENDLOOP.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form imprime_dados
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM imprime_dados .
  CONCATENATE saida1 saida2 saida3 INTO saida4 SEPARATED BY space.
  MESSAGE saida4 TYPE 'S'.
ENDFORM.
