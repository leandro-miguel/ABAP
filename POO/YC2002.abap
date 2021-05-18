CLASS y_2002 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS create
      RETURNING
        value(r_result) TYPE REF TO y_2002.
        interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS y_2002 IMPLEMENTATION.

  METHOD create.

    create object r_result.

  ENDMETHOD.
  METHOD if_oo_adt_classrun~main.
    DATA: ti_table type table of ytclientes.

          ti_table  = VALUE #(
          ( client = sy-uname cliente = 'Leandro Miguel' cpf = '407089587-69' rua = 'Rua Duque de Caxias, 92' cidade = 'Taubaté' cep = '12060-902' nascimento = '19910222'  modelo = 'KA')
          ( client = sy-uname cliente = 'Felipe Vitor' cpf = '589123654-87' rua = 'Rua Visconde do Sabugosa, 136' cidade = 'Taubaté' cep = '12548-963' nascimento = '19970510'  modelo = 'FIESTA')
          ( client = sy-uname cliente = 'Nicolas' cpf = '986125648-78' rua = 'Rua Jascinto Gomes, 43' cidade = 'Campos do Jordão' cep = '12369-988' nascimento = '19980331'  modelo = 'GOL')
          ( client = sy-uname cliente = 'Luis' cpf = '986321659-35' rua = 'Rua Arnolfo de Azevedo, 102' cidade = 'Taubaté' cep = '12987-210' nascimento = '19970125'  modelo = 'UNO')
          ( client = sy-uname cliente = 'Fábio' cpf = '478653914-22' rua = 'Avenida Getúlio Vargas, 1089' cidade = 'São José dos Campos' cep = '12784-122' nascimento = '19890912'  modelo = 'FOCUS')
          ( client = sy-uname cliente = 'Patrícia' cpf = '45213564-65' rua = 'Rua Arnaldo de Azevedo, 875' cidade = 'Pindamonhangaba' cep = '12987-658' nascimento = '19930630'  modelo = 'A3')
          ( client = sy-uname cliente = 'Junior' cpf = '465986321-87' rua = 'Avenida Ayrton Senna, 764' cidade = 'São José dos Campos' cep = '12354-081' nascimento = '19950328'  modelo = 'ASTRA')
          ( client = sy-uname cliente = 'Denner' cpf = '46789123-09' rua = 'Rua Conde de Sarzedas, 387' cidade = 'Taubaté' cep = '12587-698' nascimento = '19950328'  modelo = 'LOGAN')
          ( client = sy-uname cliente = 'Paulo' cpf = '42157986-12' rua = 'Rua Conselheiro, 812' cidade = 'São José dos Campos' cep = '12324-099' nascimento = '19801011'  modelo = 'PASSAT')
          ).

          DELETE from ytclientes.

          INSERT ytclientes from table @ti_table.

          out->write( ti_table ).
  ENDMETHOD.

ENDCLASS.
