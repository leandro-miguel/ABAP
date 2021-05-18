*&---------------------------------------------------------------------*
*& Report YR1001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yr1001.

*Declaração de tipos
TYPES: BEGIN OF ty_material,
  codmat(10) TYPE c,
  descri(35) TYPE c,
END OF ty_material.

*Declarando estruturas (work area)
*Nesse exemplo estamos declarando 2 estruturas de maneira diferente

*Nesse caso declaramos a work area do tipo ty_material
DATA w_material TYPE ty_material. "Sem HEAD LINE"

*Nesse caso inserimos os valores manualmente.
DATA: BEGIN OF w_cliente,
  cidcli(10) TYPE c,
  nome(35) TYPE c,
 END OF w_cliente.

*Declarando a tabela interna
*Nesse exmeplo estaremos declarando a tebela porém de maneira diferente
DATA ti_material TYPE TABLE OF ty_material. "Sem HEAD LINE

DATA: BEGIN OF ti_fornec OCCURS 0,
  codfor(10) TYPE c,
  nome(35)   TYPE c,
END OF ti_fornec.

*Inserindo registros na tabela interna (APPEND)
*Início - Exemplo APPEND tabela interna COM HEADER LINE.
ti_fornec-codfor = 'forn-0001'.
ti_fornec-nome = 'apple'.
APPEND ti_fornec.

CLEAR ti_fornec.

ti_fornec-codfor = 'forn-0002'.
ti_fornec-nome = 'samsung'.
APPEND ti_fornec.
*Fim do exemplo APPEND com tabela Interna com HEADER LINE

*Início - Exemplo APPEND tabela interna SEM HEADER LINE.
w_material-codmat = 'mat-0001'.
w_material-descri = 'iphone 6'.
APPEND w_material TO ti_material.

CLEAR w_material.

w_material-codmat = 'mat-0002'.
w_material-descri = 'G6'.
APPEND w_material TO ti_material.
*Fim do exemplo APPEND com tabela Interna sem HEADER LINE

*Utilizando o comando LOOP
*LOOP tabela interna com HEADER-LINE
*LOOP AT ti_fornec WHERE codfor = 'forn-0001'.
LOOP AT ti_fornec INTO ti_fornec.
  WRITE:/ ti_fornec-codfor, ti_fornec-nome, 'LOOP'.
ENDLOOP.

ULINE.

*LOOP tabela interna sem HEADER-LINE
LOOP AT ti_material INTO w_material.
    WRITE:/ w_material-codmat, w_material-descri, 'LOOP'.
ENDLOOP.

ULINE.

*Utilizando o Comando Read Table
*PARAMETERS p_index TYPE i.

READ TABLE ti_fornec INDEX 1.
IF sy-subrc = 0.
  WRITE:/ ti_fornec-codfor, ti_fornec-nome, 'READ'.
ELSE.
  WRITE:/ 'Não foi encontrado nada hoje'.
ENDIF.

ULINE.

*Utilizando o MODIFY
LOOP AT ti_material INTO w_material.
  CONCATENATE w_material-descri 'Branco' INTO w_material-descri SEPARATED BY space.
  MODIFY ti_material FROM w_material TRANSPORTING descri.
ENDLOOP.

LOOP AT ti_material INTO w_material.
  WRITE:/ w_material-codmat, w_material-descri, 'modify'.
ENDLOOP.
