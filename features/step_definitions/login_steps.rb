# frozen_string_literal: true

Dado("que estou na home de login") do
    $login_page = LoginPage.new
    $logger.info('Início do teste...')
end
  
Quando("informar os dados de usuário válidos") do
    $login_page.login
end

Quando("continuar sem login") do
    $login_page.loginless
end
  
Quando("cadastrar os dados de usuário válidos") do
    $login_page.cadastrarUsuario
end

Então("devo acessar a home logado com sucesso") do
    $login_page.assertLogin
end 

Então("devo acessar a home sem login com sucesso") do
    $login_page.assertLoginless
end

Então("devo acessar a home cadastrado com sucesso") do
    $login_page.assertCadastro
end 


