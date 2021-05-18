*&---------------------------------------------------------------------*
*& Include YMP000TOP                                - PoolMóds.        YMP0000
*& Como se fosse uma classe global
*& Seprar os atributos por tabela
*&---------------------------------------------------------------------*
PROGRAM ymp0002top.


**********************************************************************
*Variáveis Globais
**********************************************************************
*Radions Butons
DATA: r_insert,
      r_modify,
      r_delete.

*Work área de Layout
DATA: w_layout TYPE LVC_S_LAYO,
      ls_row   TYPE lvc_s_row,
      lt_rows  type lvc_t_row.


**********************************************************************
*Tipo de Material
**********************************************************************
*Tabela Transparente
TABLES: yt0001. "Tipo de Material

*Inserindo a Coluna Mark na tabela
TYPES: BEGIN OF t_yt0001.
  INCLUDE STRUCTURE: yt0001.
  TYPES: mark.
TYPES: END OF t_yt0001.

*Tabela Interna com header Line
DATA: th_yt0001 TYPE TABLE OF t_yt0001 WITH HEADER LINE.

*Tabela interna
DATA: ti_yt0001 TYPE TABLE OF yt0001.

*Work Área
DATA: w_yt0001 TYPE yt0001.

*Controle
CONTROLS: tc_0100 TYPE TABLEVIEW USING SCREEN 0100.

*Atributos da ALV
DATA: go_alv_tm TYPE REF TO cl_gui_alv_grid,
      go_container_tm TYPE REF TO cl_gui_custom_container.

*Subtela
DATA: v_dynnr TYPE sy-dynnr VALUE '0001'.

**********************************************************************
*Empresa
**********************************************************************
*Tabela Transparente
TABLES: yt0002.

*Inserindo a Coluna Mark na tabela
TYPES: BEGIN OF t_yt0002.
  INCLUDE STRUCTURE: yt0002.
  TYPES: mark.
TYPES: END OF t_yt0002.

*Tabela Interna com header Line
DATA: th_yt0002 TYPE TABLE OF t_yt0002 WITH HEADER LINE.

*Tabela interna
DATA: ti_yt0002 TYPE TABLE OF yt0002.

*Work Área
DATA: w_yt0002 TYPE yt0002.

*Controle
CONTROLS: tc_0200 TYPE TABLEVIEW USING SCREEN 0200.

*Atributos da ALV
DATA: go_alv_em TYPE REF TO cl_gui_alv_grid,
      go_container_em TYPE REF TO cl_gui_custom_container.

**********************************************************************
*Grupo de Compras
**********************************************************************
*Tabela Transparente
TABLES: yt0003.

*Tabela Interna com header Line
DATA: th_yt0003 TYPE TABLE OF yt0003 WITH HEADER LINE.

*Tabela interna
DATA: ti_yt0003 TYPE TABLE OF yt0003.

*Work Área
DATA: w_yt0003 TYPE yt0003.

*Controle
CONTROLS: tc_0300 TYPE TABLEVIEW USING SCREEN 0300.

*Atributos da ALV
DATA: go_alv_gc TYPE REF TO cl_gui_alv_grid,
      go_container_gc TYPE REF TO cl_gui_custom_container.
**********************************************************************
*Fornecedor
**********************************************************************
*Tabela Transparente
TABLES: yt0004.

*Tabela Interna com header Line
DATA: th_yt0004 TYPE TABLE OF yt0004 WITH HEADER LINE.

*Tabela interna
DATA: ti_yt0004 TYPE TABLE OF yt0004.

*Work Área
DATA: w_yt0004 TYPE yt0004.

*Controle
CONTROLS: tc_0400 TYPE TABLEVIEW USING SCREEN 0400.

*Atributos da ALV
DATA: go_alv_fo TYPE REF TO cl_gui_alv_grid,
      go_container_fo TYPE REF TO cl_gui_custom_container.

**********************************************************************
*Material
**********************************************************************
*Tabela Transparente
TABLES: yt0005.

*Tabela Interna com header Line
DATA: th_yt0005 TYPE TABLE OF yt0005 WITH HEADER LINE.

*Tabela interna
DATA: ti_yt0005 TYPE TABLE OF yt0005.

*Work Área
DATA: w_yt0005 TYPE yt0005.

*Controle
CONTROLS: tc_0500 TYPE TABLEVIEW USING SCREEN 0500.

*Atributos da ALV
DATA: go_alv_ma TYPE REF TO cl_gui_alv_grid,
      go_container_ma TYPE REF TO cl_gui_custom_container.

**********************************************************************
*Cabeçalho de Pedido de Compra
**********************************************************************
*Tabela Transparente
TABLES: yt0006.

*Tabela Interna com header Line
DATA: th_yt0006 TYPE TABLE OF yt0006 WITH HEADER LINE.

*Tabela interna
DATA: ti_yt0006 TYPE TABLE OF yt0006.

*Work Área
DATA: w_yt0006 TYPE yt0006.

*Controle
CONTROLS: tc_0600 TYPE TABLEVIEW USING SCREEN 0600.

*Atributos da ALV
DATA: go_alv_pc TYPE REF TO cl_gui_alv_grid,
      go_container_pc TYPE REF TO cl_gui_custom_container.
**********************************************************************
*Item do Pedido de Compra
**********************************************************************
*Tabela Transparente
TABLES: yt0007.

*Inserindo a coluna mark no tabela yt0007
TYPES: BEGIN OF st_yt0007.
  INCLUDE STRUCTURE: yt0007.
  TYPES: mark.
TYPES: END OF st_yt0007.

"Variáveis da quais irão receber os valores denom das table yt0006
DATA: v_denom_bukrs TYPE String,
      v_denom_forne TYPE String,
      v_denom_compr TYPE String.

*Tabela Interna com header Line
DATA: th_yt0007 TYPE TABLE OF st_yt0007 WITH HEADER LINE.

*Tabela interna
DATA: ti_yt0007 TYPE TABLE OF yt0007.

*Work Área
DATA: w_yt0007 TYPE yt0007.

*Controle
CONTROLS: tc_0700 TYPE TABLEVIEW USING SCREEN 0700.

*Atributos da ALV
DATA: go_alv_pdc TYPE REF TO cl_gui_alv_grid,
      go_container_pdc TYPE REF TO cl_gui_custom_container.