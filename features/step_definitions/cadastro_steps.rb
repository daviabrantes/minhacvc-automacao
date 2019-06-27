# frozen_string_literal: true

Quando("cadastrar os dados de usuário válidos") do
    $cadastro_page = CadastroPage.new
    $cadastro_page.cadastrar_usuario
end

Então("devo acessar a home cadastrado com sucesso") do
    $cadastro_page.assert_cadastro
end 

