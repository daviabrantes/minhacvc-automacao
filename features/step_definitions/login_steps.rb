# frozen_string_literal: true

Dado("que estou na home de login") do
    $login_page = LoginPage.new
    $logger.info('Início do teste...')
end
  
Quando("informar os dados de usuário válido") do
    $login_page.login
end
  
Então("devo realizar o login com sucesso") do
    pending # Write code here that turns the phrase above into concrete actions
end
  