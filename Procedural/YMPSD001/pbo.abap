*&---------------------------------------------------------------------*
*& Include          YMP002O01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
 SET PF-STATUS 'PF-0100'.
 SET TITLEBAR 'TL-0100'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0700 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0700 OUTPUT.
 SET PF-STATUS 'PF-0700'.
 SET TITLEBAR 'TL-0700'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module CARREGA_ALV_PC OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE carrega_alv_pdc OUTPUT.
  PERFORM init_container_pdc.
  PERFORM init_alv_pdc.
  PERFORM show_data_pdc.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0500 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0500 OUTPUT.
 SET PF-STATUS 'PF-0500'.
 SET TITLEBAR 'TL-0500'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module START_ALV_MA OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE start_alv_ma OUTPUT.

  PERFORM init_container_ma.
  PERFORM init_alv_ma.
  PERFORM show_data_ma.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0200 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
 SET PF-STATUS 'PF-0200'.
 SET TITLEBAR 'TL-0200'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0300 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0300 OUTPUT.
 SET PF-STATUS 'PF-0300'.
 SET TITLEBAR 'TL-0300'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0400 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0400 OUTPUT.
 SET PF-STATUS 'PF-0400'.
 SET TITLEBAR 'TL-0400'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0600 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0600 OUTPUT.
 SET PF-STATUS 'PF-0600'.
 SET TITLEBAR 'TL-0600'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module START_ALV_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE start_alv_0100 OUTPUT.
  PERFORM init_containter_tm.
  PERFORM init_alv_tm.
  PERFORM show_data_tm.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module START_ALV_EM OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE start_alv_em OUTPUT.
  PERFORM init_containter_em.
  PERFORM init_alv_em.
  PERFORM show_data_em.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module START_ALV_GC OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE start_alv_gc OUTPUT.
 PERFORM init_containter_gc.
 PERFORM init_alv_gc.
 PERFORM show_data_gc.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module START_LAYOUT OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE start_layout OUTPUT.
 PERFORM layout.
ENDMODULE.