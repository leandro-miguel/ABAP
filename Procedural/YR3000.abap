*&---------------------------------------------------------------------*
*& Report YR3000
*&---------------------------------------------------------------------*
*& Autor: Leandro Pereira
*& Title: Programa RPG
*&---------------------------------------------------------------------*

REPORT yr3000.

TYPE-POOLS: vrm.

*----------------------------------------------------------------------*
* Tabelas Transparentes, Internas, Works Áreas e Variáveis
*----------------------------------------------------------------------*
TABLES: yt3000, "Raças - Herois
        yt3001, "Raças - Inimigos
        yt3002. "Classes

*Tabelas internas
DATA: ti_yt3000 TYPE TABLE OF yt3000,
      ti_yt3001 TYPE TABLE OF yt3001,
      ti_yt3002 TYPE TABLE OF yt3002.

DATA: w_yt3000 TYPE yt3000,
      w_yt3001 TYPE yt3001,
      w_yt3002 TYPE yt3002.

DATA: name TYPE vrm_id,
      list TYPE vrm_values,
      value LIKE LINE OF list.

DATA: v_raca LIKE yt3000-yraca,

*----------------------------------------------------------------------*
* Variáveis dos Atributos Da Raça dos Herois                                                               *
*----------------------------------------------------------------------*
"Anao.
      v_foran LIKE w_yt3000-yforca,
      v_desan LIKE w_yt3000-ydestr,
      v_conan LIKE w_yt3000-yconst,
"Elfo.
      v_forel LIKE w_yt3000-yforca,
      v_desel LIKE w_yt3000-ydestr,
      v_conel LIKE w_yt3000-yconst,
 "Humano
      v_forhu LIKE w_yt3000-yforca,
      v_deshu LIKE w_yt3000-ydestr,
      v_conhu LIKE w_yt3000-yconst,

*----------------------------------------------------------------------*
* Variáveis dos Atributos Das Classes                                                              *
*----------------------------------------------------------------------*
"Guerreiro.
      v_forgu LIKE w_yt3002-yforca,
      v_desgu LIKE w_yt3002-ydestr,
      v_congu LIKE w_yt3002-yconst,
"Barbaro.
      v_forba LIKE w_yt3002-yforca,
      v_desba LIKE w_yt3002-ydestr,
      v_conba LIKE w_yt3002-yconst,
 "Arqueiro
      v_forar LIKE w_yt3002-yforca,
      v_desar LIKE w_yt3002-ydestr,
      v_conar LIKE w_yt3002-yconst,

*----------------------------------------------------------------------*
* Variáveis dos Atributos Dos Inimigos                                                         *
*----------------------------------------------------------------------*
"Bugbear.
      v_forbu LIKE w_yt3001-yforca,
      v_desbu LIKE w_yt3001-ydestr,
      v_conbu LIKE w_yt3001-yconst,
"Orc.
      v_foror LIKE w_yt3001-yforca,
      v_desor LIKE w_yt3001-ydestr,
      v_conor LIKE w_yt3001-yconst,
 "Troll.
      v_fortr LIKE w_yt3001-yforca,
      v_destr LIKE w_yt3001-ydestr,
      v_contr LIKE w_yt3001-yconst,

*----------------------------------------------------------------------*
* Variáveis do sistema de batalha                                                        *
*----------------------------------------------------------------------*
      v_ataq TYPE i,
      v_atk  TYPE i,
      v_defe TYPE i,
      v_def  TYPE i,
      v_d10  TYPE i.

*----------------------------------------------------------------------*
*    *Entrada de dados com telas de seleção
*----------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK part01 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_nome TYPE c LENGTH 10,
              p_idade TYPE p LENGTH 2.
 SELECTION-SCREEN END OF BLOCK part01.

*Seleção de dados através de listbox.
 SELECTION-SCREEN BEGIN OF BLOCK part02 WITH FRAME TITLE TEXT-002.
   PARAMETERS: p_raca(10) AS LISTBOX VISIBLE LENGTH 10 OBLIGATORY,
               p_clas(15) AS LISTBOX VISIBLE LENGTH 12 OBLIGATORY.
 SELECTION-SCREEN END OF BLOCK part02.

 SELECTION-SCREEN BEGIN OF BLOCK part03 WITH FRAME TITLE TEXT-003.
   PARAMETERS: p_racaI(10) AS LISTBOX VISIBLE LENGTH 10 OBLIGATORY,
               p_clasI(15) AS LISTBOX VISIBLE LENGTH 12 OBLIGATORY.
 SELECTION-SCREEN END OF BLOCK part03.

 INITIALIZATION.

*----------------------------------------------------------------------*
* Selecionando a Raça do Herói
*----------------------------------------------------------------------*
"AT SELECTION-SCREEN OUTPUT.
  SELECT yraca
    FROM yt3000
    INTO w_yt3000-yraca.

    IF sy-subrc = 0.
      APPEND w_yt3000-yraca TO ti_yt3000.
    ENDIF.
  ENDSELECT.

  LOOP AT ti_yt3000 INTO w_yt3000-yraca.
    value-key = w_yt3000-yraca.
    value-text = w_yt3000-yraca.
    APPEND value TO list.
  ENDLOOP.

  name = 'P_RACA'.

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id                    = 'P_RACA'
      values                = list
*   EXCEPTIONS
*     ID_ILLEGAL_NAME       = 1
*     OTHERS                = 2
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
  REFRESH list.
*----------------------------------------------------------------------*
* Selecionando a Classe do herói
*----------------------------------------------------------------------*
  SELECT yclas
    FROM yt3002
    INTO w_yt3002-yclas.

    IF sy-subrc = 0.
      APPEND  w_yt3002-yclas TO ti_yt3002.
    ENDIF.
  ENDSELECT.

  LOOP AT ti_yt3002 INTO w_yt3002-yclas.
    value-key = w_yt3002-yclas.
    value-text = w_yt3002-yclas.
    APPEND value TO list.
  ENDLOOP.

  name = 'P_CLAS'.

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id                    = 'P_CLAS'
      values                = list
*   EXCEPTIONS
*     ID_ILLEGAL_NAME       = 1
*     OTHERS                = 2
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
  REFRESH list.
*----------------------------------------------------------------------*
*    Selecionando a raça do inimigo
*-----------------------------------------------------------------------
  SELECT yraca
    FROM yt3001
    INTO w_yt3001-yraca.

    IF sy-subrc = 0.
      APPEND  w_yt3001-yraca TO ti_yt3001.
    ENDIF.
  ENDSELECT.

  LOOP AT ti_yt3001 INTO w_yt3001-yraca.
    value-key = w_yt3001-yraca.
    value-text = w_yt3001-yraca.
    APPEND value TO list.
  ENDLOOP.

  name = 'P_RACAI'.

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id                    = 'P_RACAI'
      values                = list
*   EXCEPTIONS
*     ID_ILLEGAL_NAME       = 1
*     OTHERS                = 2
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
  REFRESH list.
*----------------------------------------------------------------------*
* Selecionando a Classe do Inimigo
*----------------------------------------------------------------------*
*  SELECT yclas
*    FROM yt3002
*    INTO w_yt3002-yclas.
*
*    IF sy-subrc = 0.
*      APPEND w_yt3002-yclas TO ti_yt3002.
*    ENDIF.
*  ENDSELECT.
"Obs.: Nao precisei fazer o select novamente na mesma lista de classes.

  LOOP AT ti_yt3002 INTO w_yt3002-yclas.
    value-key = w_yt3002-yclas.
    value-text = w_yt3002-yclas.
    APPEND value TO list.
  ENDLOOP.

  name = 'P_CLASI'.

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id                    = 'P_CLASI'
      values                = list
*   EXCEPTIONS
*     ID_ILLEGAL_NAME       = 1
*     OTHERS                = 2
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
  REFRESH list.


START-OF-SELECTION.
*----------------------------------------------------------------------*
* Extraindo os valores dos atributos dos herois
*----------------------------------------------------------------------*
*ANAO
"Força
IF p_raca IS NOT INITIAL AND p_raca = 'ANAO'.
  SELECT * FROM yt3000 INTO TABLE ti_yt3000.
    LOOP AT ti_yt3000 INTO w_yt3000.
      READ TABLE ti_yt3000 INTO w_yt3000 WITH KEY yraca = p_raca.
      IF sy-subrc = 0.
         v_foran = w_yt3000-yforca.
      ENDIF.
    ENDLOOP.
ENDIF.

"Destreza
IF p_raca IS NOT INITIAL AND p_raca = 'ANAO'.
  SELECT * FROM yt3000 INTO TABLE ti_yt3000.
    LOOP AT ti_yt3000 INTO w_yt3000.
      READ TABLE ti_yt3000 INTO w_yt3002 WITH KEY yraca = p_raca.
      IF sy-subrc = 0.
         v_desan = w_yt3000-ydestr.
      ENDIF.
    ENDLOOP.
ENDIF.

"Constituição
IF p_raca IS NOT INITIAL AND p_raca = 'ANAO'.
  SELECT * FROM yt3000 INTO TABLE ti_yt3000.
    LOOP AT ti_yt3000 INTO w_yt3000.
      READ TABLE ti_yt3000 INTO w_yt3002 WITH KEY yraca = p_raca.
      IF sy-subrc = 0.
         v_conan = w_yt3000-yconst.
      ENDIF.
    ENDLOOP.
ENDIF.

"ELFO
"Força
IF p_raca IS NOT INITIAL AND p_raca = 'ELFO'.
  SELECT * FROM yt3000 INTO TABLE ti_yt3000.
    LOOP AT ti_yt3000 INTO w_yt3000.
      READ TABLE ti_yt3000 INTO w_yt3000 WITH KEY yraca = p_raca.
      IF sy-subrc = 0.
         v_forel = w_yt3000-yforca.
      ENDIF.
    ENDLOOP.
ENDIF.

"Destreza
IF p_raca IS NOT INITIAL AND p_raca = 'ELFO'.
  SELECT * FROM yt3000 INTO TABLE ti_yt3000.
    LOOP AT ti_yt3000 INTO w_yt3000.
      READ TABLE ti_yt3000 INTO w_yt3002 WITH KEY yraca = p_raca.
      IF sy-subrc = 0.
         v_desel = w_yt3000-ydestr.
      ENDIF.
    ENDLOOP.
ENDIF.

"Constituição
IF p_raca IS NOT INITIAL AND p_raca = 'ELFO'.
  SELECT * FROM yt3000 INTO TABLE ti_yt3000.
    LOOP AT ti_yt3000 INTO w_yt3000.
      READ TABLE ti_yt3000 INTO w_yt3002 WITH KEY yraca = p_raca.
      IF sy-subrc = 0.
         v_conel = w_yt3000-yconst.
      ENDIF.
    ENDLOOP.
ENDIF.

"HUMANO
"Força
IF p_raca IS NOT INITIAL AND p_raca = 'HUMANO'.
  SELECT * FROM yt3000 INTO TABLE ti_yt3000.
    LOOP AT ti_yt3000 INTO w_yt3000.
      READ TABLE ti_yt3000 INTO w_yt3000 WITH KEY yraca = p_raca.
      IF sy-subrc = 0.
         v_forhu = w_yt3000-yforca.
      ENDIF.
    ENDLOOP.
ENDIF.

"Destreza
IF p_raca IS NOT INITIAL AND p_raca = 'HUMANO'.
  SELECT * FROM yt3000 INTO TABLE ti_yt3000.
    LOOP AT ti_yt3000 INTO w_yt3000.
      READ TABLE ti_yt3000 INTO w_yt3002 WITH KEY yraca = p_raca.
      IF sy-subrc = 0.
         v_deshu = w_yt3000-ydestr.
      ENDIF.
    ENDLOOP.
ENDIF.

"Constituição
IF p_raca IS NOT INITIAL AND p_raca = 'HUMANO'.
  SELECT * FROM yt3000 INTO TABLE ti_yt3000.
    LOOP AT ti_yt3000 INTO w_yt3000.
      READ TABLE ti_yt3000 INTO w_yt3002 WITH KEY yraca = p_raca.
      IF sy-subrc = 0.
         v_conhu = w_yt3000-yconst.
      ENDIF.
    ENDLOOP.
ENDIF.

*----------------------------------------------------------------------*
* Extraindo os valores dos atributos das classes
*----------------------------------------------------------------------*
*Guerreiro
"Força
IF p_clas IS NOT INITIAL AND p_clas = 'GUERREIRO'.
  SELECT * FROM yt3002 INTO TABLE ti_yt3002.
    LOOP AT ti_yt3002 INTO w_yt3002.
      READ TABLE ti_yt3002 INTO w_yt3002 WITH KEY yclas = p_clas.
      IF sy-subrc = 0.
         v_forgu = w_yt3002-yforca.
      ENDIF.
    ENDLOOP.
ENDIF.
"Destreza
IF p_clas IS NOT INITIAL AND p_clas = 'GUERREIRO'.
  SELECT * FROM yt3002 INTO TABLE ti_yt3002.
    LOOP AT ti_yt3002 INTO w_yt3002.
      READ TABLE ti_yt3002 INTO w_yt3002 WITH KEY yclas = p_clas.
      IF sy-subrc = 0.
         v_desgu = w_yt3002-ydestr.
      ENDIF.
    ENDLOOP.
ENDIF.
"Constituição
IF p_clas IS NOT INITIAL AND p_clas = 'GUERREIRO'.
  SELECT * FROM yt3002 INTO TABLE ti_yt3002.
    LOOP AT ti_yt3002 INTO w_yt3002.
      READ TABLE ti_yt3002 INTO w_yt3002 WITH KEY yclas = p_clas.
      IF sy-subrc = 0.
         v_congu = w_yt3002-yconst.
      ENDIF.
    ENDLOOP.
ENDIF.

*Arqueiro
"Força
IF p_clas IS NOT INITIAL AND p_clas = 'ARQUEIRO'.
  SELECT * FROM yt3002 INTO TABLE ti_yt3002.
    LOOP AT ti_yt3002 INTO w_yt3002.
      READ TABLE ti_yt3002 INTO w_yt3002 WITH KEY yclas = p_clas.
      IF sy-subrc = 0.
         v_forar = w_yt3002-yforca.
      ENDIF.
    ENDLOOP.
ENDIF.
"Destreza
IF p_clas IS NOT INITIAL AND p_clas = 'ARQUEIRO'.
  SELECT * FROM yt3002 INTO TABLE ti_yt3002.
    LOOP AT ti_yt3002 INTO w_yt3002.
      READ TABLE ti_yt3002 INTO w_yt3002 WITH KEY yclas = p_clas.
      IF sy-subrc = 0.
         v_desar = w_yt3002-ydestr.
      ENDIF.
    ENDLOOP.
ENDIF.
"Constituição
IF p_clas IS NOT INITIAL AND p_clas = 'ARQUEIRO'.
  SELECT * FROM yt3002 INTO TABLE ti_yt3002.
    LOOP AT ti_yt3002 INTO w_yt3002.
      READ TABLE ti_yt3002 INTO w_yt3002 WITH KEY yclas = p_clas.
      IF sy-subrc = 0.
         v_conar = w_yt3002-yconst.
      ENDIF.
    ENDLOOP.
ENDIF.

*Barbaro
"Força
IF p_clas IS NOT INITIAL AND p_clas = 'BARBARO'.
  SELECT * FROM yt3002 INTO TABLE ti_yt3002.
    LOOP AT ti_yt3002 INTO w_yt3002.
      READ TABLE ti_yt3002 INTO w_yt3002 WITH KEY yclas = p_clas.
      IF sy-subrc = 0.
         v_forba = w_yt3002-yforca.
      ENDIF.
    ENDLOOP.
ENDIF.
"Destreza
IF p_clas IS NOT INITIAL AND p_clas = 'BARBARO'.
  SELECT * FROM yt3002 INTO TABLE ti_yt3002.
    LOOP AT ti_yt3002 INTO w_yt3002.
      READ TABLE ti_yt3002 INTO w_yt3002 WITH KEY yclas = p_clas.
      IF sy-subrc = 0.
         v_desba = w_yt3002-ydestr.
      ENDIF.
    ENDLOOP.
ENDIF.
"Constituição
IF p_clas IS NOT INITIAL AND p_clas = 'BARBARO'.
  SELECT * FROM yt3002 INTO TABLE ti_yt3002.
    LOOP AT ti_yt3002 INTO w_yt3002.
      READ TABLE ti_yt3002 INTO w_yt3002 WITH KEY yclas = p_clas.
      IF sy-subrc = 0.
         v_conba = w_yt3002-yconst.
      ENDIF.
    ENDLOOP.
ENDIF.

*----------------------------------------------------------------------*
* Extraindo os valores dos atributos dos inimigos
*----------------------------------------------------------------------*
*BUGBEAR
"Força
IF p_racai IS NOT INITIAL AND p_racai = 'BUGBEAR'.
  SELECT * FROM yt3001 INTO TABLE ti_yt3001.
    LOOP AT ti_yt3001 INTO w_yt3001.
      READ TABLE ti_yt3001 INTO w_yt3001 WITH KEY yraca = p_racai.
      IF sy-subrc = 0.
         v_forbu = w_yt3001-yforca.
      ENDIF.
    ENDLOOP.
ENDIF.
"Destreza
IF p_racai IS NOT INITIAL AND p_racai = 'BUGBEAR'.
  SELECT * FROM yt3001 INTO TABLE ti_yt3001.
    LOOP AT ti_yt3001 INTO w_yt3001.
      READ TABLE ti_yt3001 INTO w_yt3001 WITH KEY yraca = p_racai.
      IF sy-subrc = 0.
         v_desbu = w_yt3001-ydestr.
      ENDIF.
    ENDLOOP.
ENDIF.
"Constituição
IF p_racai IS NOT INITIAL AND p_racai = 'BUGBEAR'.
  SELECT * FROM yt3001 INTO TABLE ti_yt3001.
    LOOP AT ti_yt3001 INTO w_yt3001.
      READ TABLE ti_yt3001 INTO w_yt3001 WITH KEY yraca = p_racai.
      IF sy-subrc = 0.
         v_conbu = w_yt3001-yconst.
      ENDIF.
    ENDLOOP.
ENDIF.
*ORC
"Força
IF p_racai IS NOT INITIAL AND p_racai = 'ORC'.
  SELECT * FROM yt3001 INTO TABLE ti_yt3001.
    LOOP AT ti_yt3001 INTO w_yt3001.
      READ TABLE ti_yt3001 INTO w_yt3001 WITH KEY yraca = p_racai.
      IF sy-subrc = 0.
         v_foror = w_yt3001-yforca.
      ENDIF.
    ENDLOOP.
ENDIF.
"Destreza
IF p_racai IS NOT INITIAL AND p_racai = 'ORC'.
  SELECT * FROM yt3001 INTO TABLE ti_yt3001.
    LOOP AT ti_yt3001 INTO w_yt3001.
      READ TABLE ti_yt3001 INTO w_yt3001 WITH KEY yraca = p_racai.
      IF sy-subrc = 0.
         v_desor = w_yt3001-ydestr.
      ENDIF.
    ENDLOOP.
ENDIF.
"Constituição
IF p_racai IS NOT INITIAL AND p_racai = 'ORC'.
  SELECT * FROM yt3001 INTO TABLE ti_yt3001.
    LOOP AT ti_yt3001 INTO w_yt3001.
      READ TABLE ti_yt3001 INTO w_yt3001 WITH KEY yraca = p_racai.
      IF sy-subrc = 0.
         v_conor = w_yt3001-yconst.
      ENDIF.
    ENDLOOP.
ENDIF.
*TROLL
"Força
IF p_racai IS NOT INITIAL AND p_racai = 'TROLL'.
  SELECT * FROM yt3001 INTO TABLE ti_yt3001.
    LOOP AT ti_yt3001 INTO w_yt3001.
      READ TABLE ti_yt3001 INTO w_yt3001 WITH KEY yraca = p_racai.
      IF sy-subrc = 0.
         v_fortr = w_yt3001-yforca.
      ENDIF.
    ENDLOOP.
ENDIF.
"Destreza
IF p_racai IS NOT INITIAL AND p_racai = 'TROLL'.
  SELECT * FROM yt3001 INTO TABLE ti_yt3001.
    LOOP AT ti_yt3001 INTO w_yt3001.
      READ TABLE ti_yt3001 INTO w_yt3001 WITH KEY yraca = p_racai.
      IF sy-subrc = 0.
         v_destr = w_yt3001-ydestr.
      ENDIF.
    ENDLOOP.
ENDIF.
"Constituição
IF p_racai IS NOT INITIAL AND p_racai = 'TROLL'.
  SELECT * FROM yt3001 INTO TABLE ti_yt3001.
    LOOP AT ti_yt3001 INTO w_yt3001.
      READ TABLE ti_yt3001 INTO w_yt3001 WITH KEY yraca = p_racai.
      IF sy-subrc = 0.
         v_contr = w_yt3001-yconst.
      ENDIF.
    ENDLOOP.
ENDIF.

*----------------------------------------------------------------------*
* Sistema de Batalha
*----------------------------------------------------------------------*
*ATAQUE DOS HEROIS


*-------------------------------------------------------------------------
*Gerador de um número aleatório do qual simula um dado de 10 lados
CALL FUNCTION 'GENERAL_GET_RANDOM_INT'
  EXPORTING
    range         = 10
 IMPORTING
   RANDOM        = V_D10
          .
*----------------------------------------------------------------------------

*ANAO + CLASSE
IF p_raca IS NOT INITIAL AND p_raca = 'ANAO' AND p_clas = 'ARQUEIRO'.
  v_ataq = v_desan + v_desar.
  ELSEIF p_raca IS NOT INITIAL AND p_raca = 'ANAO' AND p_clas = 'GUERREIRO'.
    v_ataq = v_foran + v_forgu.
  ELSEIF p_raca IS NOT INITIAL AND p_raca = 'ANAO' AND p_clas = 'BARBARO'.
    v_ataq = v_foran + v_forba.
ENDIF.

*ELFO + CLASSE
IF p_raca IS NOT INITIAL AND p_raca = 'ELFO' AND p_clas = 'ARQUEIRO'.
  v_ataq = v_desel + v_desar.
  ELSEIF p_raca IS NOT INITIAL AND p_raca = 'ELFO' AND p_clas = 'GUERREIRO'.
    v_ataq = v_forel + v_forgu.
  ELSEIF p_raca IS NOT INITIAL AND p_raca = 'ELFO' AND p_clas = 'BARBARO'.
    v_ataq = v_forel + v_forba.
ENDIF.

*HUMANO + CLASSE
IF p_raca IS NOT INITIAL AND p_raca = 'HUMANO' AND p_clas = 'ARQUEIRO'.
  v_ataq = v_deshu + v_desar.
  ELSEIF p_raca IS NOT INITIAL AND p_raca = 'HUMANO' AND p_clas = 'GUERREIRO'.
    v_ataq = v_forhu + v_forgu.
  ELSEIF p_raca IS NOT INITIAL AND p_raca = 'HUMANO' AND p_clas = 'BARBARO'.
    v_ataq = v_forhu + v_forba.
ENDIF.

*ATAQUE
 v_atk = v_ataq + v_d10.

*DEFESA DOS INIMIGOS
*BUGBEAR + CLASSE + 10
IF p_racai IS NOT INITIAL AND p_racai = 'BUGBEAR' AND p_clasi = 'ARQUEIRO'.
  v_defe = v_desbu + v_desar + 10.
  ELSEIF p_racai IS NOT INITIAL AND p_racai = 'BUGBEAR' AND p_clasi = 'GUERREIRO'.
    v_defe = v_desbu + v_desgu + 10.
  ELSEIF p_racai IS NOT INITIAL AND p_racai = 'BUGBEAR' AND p_clasi = 'BARBARO'.
    v_defe = v_desbu + v_desba + 10.
ENDIF.

*ORC + CLASSE
IF p_racai IS NOT INITIAL AND p_racai = 'ORC' AND p_clasi = 'ARQUEIRO'.
  v_defe = v_desor + v_desar + 10.
  ELSEIF p_racai IS NOT INITIAL AND p_racai = 'ORC' AND p_clasi = 'GUERREIRO'.
    v_defe = v_desor + v_desgu + 10.
  ELSEIF p_racai IS NOT INITIAL AND p_racai = 'ORC' AND p_clasi = 'BARBARO'.
    v_defe = v_desor + v_desba + 10.
ENDIF.

*TROLL + CLASSE
IF p_racai IS NOT INITIAL AND p_racai = 'TROLL' AND p_clasi = 'ARQUEIRO'.
  v_defe = v_destr + v_desar + 10.
  ELSEIF p_racai IS NOT INITIAL AND p_racai = 'TROLL' AND p_clasi = 'GUERREIRO'.
    v_defe = v_destr + v_desgu + 10.
  ELSEIF p_racai IS NOT INITIAL AND p_racai = 'TROLL' AND p_clasi = 'BARBARO'.
    v_defe = v_destr + v_desba + 10.
ENDIF.

*----------------------------------------------------------------------*
* Imprimindo Valores
*----------------------------------------------------------------------*

IF v_atk > v_defe.
  WRITE: / 'Nome: ', p_nome,
         / 'Idade: ', p_idade,
         / 'Raça e Classe: ', p_raca, p_clas,
         / 'Base de Ataque: ', v_ataq,
         / 'Tirou no Dado: ', v_d10,
         / 'Ataque: ', v_atk,
         / 'Inimigo: ', p_racai, p_clasi,
         / 'Armadura: ', v_defe,
         / 'ACERTOU'.
  ELSE.
    WRITE:
         / 'Nome: ', p_nome,
         / 'Idade: ', p_idade,
         / 'Raça e Classe: ', p_raca, p_clas,
         / 'Base de Ataque: ', v_ataq,
         / 'Tirou no Dado: ', v_d10,
         / 'Ataque: ', v_atk,
         / 'Inimigo: ', p_racai, p_clasi,
         / 'Armadura: ', v_defe,
         / 'ERROU'.
ENDIF.
