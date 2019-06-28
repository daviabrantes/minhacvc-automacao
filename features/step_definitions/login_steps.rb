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

Quando("eu clicar no botão de esqueci minha senha") do
    $login_page.esqueci_senha    
end

E("preencher os dados para recuperar minha senha") do
    $login_page.preencher_esqueci_senha  
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

Então("devem ser enviadas instruções por email") do
    $login_page.assert_esqueci_senha
end



