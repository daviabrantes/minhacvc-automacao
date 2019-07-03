# frozen_string_literal: true

Dado("que estou na home de login") do
    $login_page = LoginPage.new
end

Quando("informar os dados de usuário válidos") do
    $login_page.login
end

Quando("continuar sem login") do
    $login_page.loginless
end

Quando("informar um email não cadastrado") do
    $login_page.login_erro_email
end

Quando("informar uma senha incorreta") do
    $login_page.login_erro_senha
end

Então("devo acessar a home logado com sucesso") do
    $login_page.assert_login
end 

Então("devo acessar a home sem login com sucesso") do
    $login_page.assert_loginless
end

Então("devo encontrar a mensagem de email ou senha incorretos") do
    $login_page.assert_login_erro
end



