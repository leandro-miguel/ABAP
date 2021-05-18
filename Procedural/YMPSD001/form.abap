*&---------------------------------------------------------------------*
*& Form layout
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM layout .

    w_layout-cwidth_opt = 'X'.
    w_layout-smalltitle = 'X'.
    w_layout-zebra = 'X'.
    w_layout-sel_mode = 'D'.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Include          YMP002F01
  *&---------------------------------------------------------------------*
  *&---------------------------------------------------------------------*
  *& Form select_table_pdc
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM select_table_pdc .
  
    SELECT * FROM yt0007 INTO TABLE ti_yt0007 ORDER BY numpd.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form init_container_pc
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM init_container_pdc .
    IF go_container_pdc IS NOT BOUND.
      CREATE OBJECT go_container_pdc
        EXPORTING
  *        parent                      =
          container_name              = 'CC_0700'
  *        style                       =
  *        lifetime                    = lifetime_default
  *        repid                       =
  *        dynnr                       =
  *        no_autodef_progid_dynnr     =
        EXCEPTIONS
          cntl_error                  = 1
          cntl_system_error           = 2
          create_error                = 3
          lifetime_error              = 4
          lifetime_dynpro_dynpro_link = 5
          OTHERS                      = 6
          .
      IF sy-subrc <> 0.
       MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                  WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
  
  
    ENDIF.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form init_alv_pc
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM init_alv_pdc .
    IF go_alv_pdc IS NOT BOUND.
      CREATE OBJECT go_alv_pdc
        EXPORTING
  *        i_shellstyle      = 0
  *        i_lifetime        =
          i_parent          = go_container_pdc
  *        i_appl_events     = SPACE
  *        i_parentdbg       =
  *        i_applogparent    =
  *        i_graphicsparent  =
  *        i_name            =
  *        i_fcat_complete   = SPACE
  *        o_previous_sral_handler =
        EXCEPTIONS
          error_cntl_create = 1
          error_cntl_init   = 2
          error_cntl_link   = 3
          error_dp_create   = 4
          OTHERS            = 5
          .
      IF sy-subrc <> 0.
       MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                  WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
  
  
    ENDIF.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form show_data_pc
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM show_data_pdc .
    CALL METHOD go_alv_pdc->set_table_for_first_display
      EXPORTING
  *      i_buffer_active               =
  *      i_bypassing_buffer            =
  *      i_consistency_check           =
        i_structure_name              = 'YT0007'
  *      is_variant                    =
  *      i_save                        =
        i_default                     = 'X'
        is_layout                     = W_LAYOUT
  *      is_print                      =
  *      it_special_groups             =
  *      it_toolbar_excluding          =
  *      it_hyperlink                  =
  *      it_alv_graphics               =
  *      it_except_qinfo               =
  *      ir_salv_adapter               =
      CHANGING
        it_outtab                     = ti_yt0007
  *      it_fieldcatalog               =
  *      it_sort                       =
  *      it_filter                     =
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        OTHERS                        = 4
            .
    IF sy-subrc <> 0.
  
    ENDIF.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form select_table_ma
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM select_table_ma .
  
    SELECT * FROM yt0005 INTO CORRESPONDING FIELDS OF TABLE ti_yt0005.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form init_container_ma
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM init_container_ma .
    IF go_container_ma IS NOT BOUND.
      CREATE OBJECT go_container_ma
        EXPORTING
  *        parent                      =
          container_name              = 'CC_0500'
  *        style                       =
  *        lifetime                    = lifetime_default
  *        repid                       =
  *        dynnr                       =
  *        no_autodef_progid_dynnr     =
        EXCEPTIONS
          cntl_error                  = 1
          cntl_system_error           = 2
          create_error                = 3
          lifetime_error              = 4
          lifetime_dynpro_dynpro_link = 5
          OTHERS                      = 6
          .
      IF sy-subrc <> 0.
       MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                  WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
  
  
    ENDIF.
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form init_alv_ma
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM init_alv_ma .
     IF go_alv_ma IS NOT BOUND.
      CREATE OBJECT go_alv_ma
        EXPORTING
  *        i_shellstyle      = 0
  *        i_lifetime        =
          i_parent          = go_container_ma
  *        i_appl_events     = SPACE
  *        i_parentdbg       =
  *        i_applogparent    =
  *        i_graphicsparent  =
  *        i_name            =
  *        i_fcat_complete   = SPACE
  *        o_previous_sral_handler =
        EXCEPTIONS
          error_cntl_create = 1
          error_cntl_init   = 2
          error_cntl_link   = 3
          error_dp_create   = 4
          OTHERS            = 5
          .
      IF sy-subrc <> 0.
       MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                  WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
  
  
    ENDIF.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form show_data_ma
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM show_data_ma .
    CALL METHOD go_alv_ma->set_table_for_first_display
      EXPORTING
  *      i_buffer_active               =
  *      i_bypassing_buffer            =
  *      i_consistency_check           =
        i_structure_name              = 'YT0005'
  *      is_variant                    =
  *      i_save                        =
  *      i_default                     = 'X'
        is_layout                     = W_LAYOUT
  *      is_print                      =
  *      it_special_groups             =
  *      it_toolbar_excluding          =
  *      it_hyperlink                  =
  *      it_alv_graphics               =
  *      it_except_qinfo               =
  *      ir_salv_adapter               =
      CHANGING
        it_outtab                     = ti_yt0005
  *      it_fieldcatalog               =
  *      it_sort                       =
  *      it_filter                     =
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        OTHERS                        = 4
            .
    IF sy-subrc <> 0.
    ENDIF.
  
  ENDFORM.
  
  *&---------------------------------------------------------------------*
  *& Form select_table_tipmat
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM select_table_tm .
  
    SELECT * FROM YT0001 INTO TABLE ti_yT0001.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form init_containter_tipmat
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM init_containter_tm .
  
    IF go_container_tm is not bound.
      CREATE OBJECT go_container_tm
        EXPORTING
  *        parent                      =
          container_name              = 'CC_0100'
  *        style                       =
  *        lifetime                    = lifetime_default
  *        repid                       =
  *        dynnr                       =
  *        no_autodef_progid_dynnr     =
        EXCEPTIONS
          cntl_error                  = 1
          cntl_system_error           = 2
          create_error                = 3
          lifetime_error              = 4
          lifetime_dynpro_dynpro_link = 5
          others                      = 6
          .
      IF sy-subrc <> 0.
       MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
                  WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
      ENDIF.
    ENDIF.
  
  ENDFORM.
  
  *&---------------------------------------------------------------------*
  *& Form init_alv_tm
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM init_alv_tm .
  
     IF go_alv_tm is not bound.
      CREATE OBJECT go_alv_tm
        EXPORTING
  *        i_shellstyle      = 0
  *        i_lifetime        =
          i_parent          = go_container_tm
  *        i_appl_events     = SPACE
  *        i_parentdbg       =
  *        i_applogparent    =
  *        i_graphicsparent  =
  *        i_name            =
  *        i_fcat_complete   = SPACE
  *        o_previous_sral_handler =
        EXCEPTIONS
          error_cntl_create = 1
          error_cntl_init   = 2
          error_cntl_link   = 3
          error_dp_create   = 4
          others            = 5
          .
      IF sy-subrc <> 0.
       MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
                  WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
      ENDIF.
    ENDIF.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form show_data_tipmat
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM show_data_tm .
    CALL METHOD go_alv_tm->set_table_for_first_display
      EXPORTING
  *      i_buffer_active               =
  *      i_bypassing_buffer            =
  *      i_consistency_check           =
        i_structure_name              = 'YT0001'
  *      is_variant                    =
  *      i_save                        =
  *      i_default                     = 'X'
        is_layout                     = W_LAYOUT
  *      is_print                      =
  *      it_special_groups             =
  *      it_toolbar_excluding          =
  *      it_hyperlink                  =
  *      it_alv_graphics               =
  *      it_except_qinfo               =
  *      ir_salv_adapter               =
      CHANGING
        it_outtab                     = ti_yt0001
  *      it_fieldcatalog               =
  *      it_sort                       =
  *      it_filter                     =
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        others                        = 4
            .
    IF sy-subrc <> 0.
  
    ENDIF.
  
  ENDFORM.
  
  *&---------------------------------------------------------------------*
  *& Form init_containter_em
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM init_containter_em .
    IF go_container_em is not bound.
      CREATE OBJECT go_container_em
        EXPORTING
  *        parent                      =
          container_name              = 'CC_0200'
  *        style                       =
  *        lifetime                    = lifetime_default
  *        repid                       =
  *        dynnr                       =
  *        no_autodef_progid_dynnr     =
        EXCEPTIONS
          cntl_error                  = 1
          cntl_system_error           = 2
          create_error                = 3
          lifetime_error              = 4
          lifetime_dynpro_dynpro_link = 5
          others                      = 6
          .
      IF sy-subrc <> 0.
       MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
                  WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
      ENDIF.
    ENDIF.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form init_alv_em
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM init_alv_em .
  
     IF go_alv_em is not bound.
      CREATE OBJECT go_alv_em
        EXPORTING
  *        i_shellstyle      = 0
  *        i_lifetime        =
          i_parent          = go_container_em
  *        i_appl_events     = SPACE
  *        i_parentdbg       =
  *        i_applogparent    =
  *        i_graphicsparent  =
  *        i_name            =
  *        i_fcat_complete   = SPACE
  *        o_previous_sral_handler =
        EXCEPTIONS
          error_cntl_create = 1
          error_cntl_init   = 2
          error_cntl_link   = 3
          error_dp_create   = 4
          others            = 5
          .
      IF sy-subrc <> 0.
       MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
                  WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
      ENDIF.
    ENDIF.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form show_data_em
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM show_data_em .
  
    CALL METHOD go_alv_em->set_table_for_first_display
      EXPORTING
  *      i_buffer_active               =
  *      i_bypassing_buffer            =
  *      i_consistency_check           =
        i_structure_name              = 'YT0002'
  *      is_variant                    =
  *      i_save                        =
  *      i_default                     = 'X'
        is_layout                     = W_LAYOUT
  *      is_print                      =
  *      it_special_groups             =
  *      it_toolbar_excluding          =
  *      it_hyperlink                  =
  *      it_alv_graphics               =
  *      it_except_qinfo               =
  *      ir_salv_adapter               =
      CHANGING
        it_outtab                     = ti_yt0002
  *      it_fieldcatalog               =
  *      it_sort                       =
  *      it_filter                     =
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        others                        = 4
            .
    IF sy-subrc <> 0.
  
    ENDIF.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form select_table_em
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM select_table_em .
  
    SELECT * FROM yt0002 INTO TABLE ti_yt0002.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form init_containter_gc
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM init_containter_gc .
  
     IF go_container_gc is not bound.
      CREATE OBJECT go_container_gc
        EXPORTING
  *        parent                      =
          container_name              = 'CC_0300'
  *        style                       =
  *        lifetime                    = lifetime_default
  *        repid                       =
  *        dynnr                       =
  *        no_autodef_progid_dynnr     =
        EXCEPTIONS
          cntl_error                  = 1
          cntl_system_error           = 2
          create_error                = 3
          lifetime_error              = 4
          lifetime_dynpro_dynpro_link = 5
          others                      = 6
          .
      IF sy-subrc <> 0.
       MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
                  WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
      ENDIF.
    ENDIF.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form init_alv_gc
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM init_alv_gc .
  
     IF go_alv_gc is not bound.
      CREATE OBJECT go_alv_gc
        EXPORTING
  *        i_shellstyle      = 0
  *        i_lifetime        =
          i_parent          = go_container_gc
  *        i_appl_events     = SPACE
  *        i_parentdbg       =
  *        i_applogparent    =
  *        i_graphicsparent  =
  *        i_name            =
  *        i_fcat_complete   = SPACE
  *        o_previous_sral_handler =
        EXCEPTIONS
          error_cntl_create = 1
          error_cntl_init   = 2
          error_cntl_link   = 3
          error_dp_create   = 4
          others            = 5
          .
      IF sy-subrc <> 0.
       MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
                  WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
      ENDIF.
    ENDIF.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form show_data_gc
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM show_data_gc .
  
     CALL METHOD go_alv_gc->set_table_for_first_display
      EXPORTING
  *      i_buffer_active               =
  *      i_bypassing_buffer            =
  *      i_consistency_check           =
        i_structure_name              = 'YT0003'
  *      is_variant                    =
  *      i_save                        =
  *      i_default                     = 'X'
        is_layout                     = W_LAYOUT
  *      is_print                      =
  *      it_special_groups             =
  *      it_toolbar_excluding          =
  *      it_hyperlink                  =
  *      it_alv_graphics               =
  *      it_except_qinfo               =
  *      ir_salv_adapter               =
      CHANGING
        it_outtab                     = ti_yt0003
  *      it_fieldcatalog               =
  *      it_sort                       =
  *      it_filter                     =
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        others                        = 4
            .
    IF sy-subrc <> 0.
  
    ENDIF.
  
  ENDFORM.
  *&---------------------------------------------------------------------*
  *& Form select_table_gc
  *&---------------------------------------------------------------------*
  *& text
  *&---------------------------------------------------------------------*
  *& -->  p1        text
  *& <--  p2        text
  *&---------------------------------------------------------------------*
  FORM select_table_gc .
  
    SELECT * FROM yt0003 INTO TABLE ti_yt0003.
  
  ENDFORM.