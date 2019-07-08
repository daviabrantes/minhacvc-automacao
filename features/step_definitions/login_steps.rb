# frozen_string_literal: true

Quando("informar os dados de usuário válidos") do
    $login_page = LoginPage.new
    $login_page.logar
end

Quando("informar um email não cadastrado") do
    $login_page = LoginPage.new
    $login_page.logar_erro_email
end

Quando("informar uma senha incorreta") do
    $login_page = LoginPage.new
    $login_page.logar_erro_senha
end

Quando("eu clicar no botão de esqueci minha senha") do
    $login_page = LoginPage.new
    $login_page.clicar_esqueci_senha
end

Quando("informar dados para testar os elementos da tela login") do
    $login_page = LoginPage.new
    $login_page.validar_elementos_login
end

Então("devo encontrar a mensagem de email ou senha incorretos") do
    $login_page.assert_login_erro
end

Então("devo encontrar a mensagem de versão bloqueada") do
    
end

Então("devo encontrar a mensagem de versão desatualizada") do

end

Então("não devo encontrar erros na tela de login") do
    $login_page.assert_elementos_login
end


  

  

  

  

  

  

