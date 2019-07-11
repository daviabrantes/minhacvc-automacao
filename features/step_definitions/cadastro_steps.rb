# frozen_string_literal: true

Quando("cadastrar os dados de usuário válidos") do
    $cadastro_page = CadastroPage.new
    $cadastro_page.cadastrar_usuario
end

Quando("informar os dados de usuário com CPF já cadastrado") do
    $cadastro_page = CadastroPage.new
    $cadastro_page.preencher_dados_cpf_cadastrado
end

Quando("informar os dados de usuário com email já cadastrado") do
    $cadastro_page = CadastroPage.new
    $cadastro_page.preencher_dados_email_cadastrado
end

Quando("informar dados de cadastro para testar os elementos da tela") do
    $cadastro_page = CadastroPage.new
    $cadastro_page.validar_campos
end
  
Quando("clicar em política de segurança") do
    $cadastro_page = CadastroPage.new
    $cadastro_page.clicar_politica
end

Quando("o serviço estiver indisponível") do
    indisponibilizar_servico
end
    
Quando("estiver sem conexão de internet") do
    desativar_conexao
end

Quando("cadastrar os dados de usuário com CPF já cadastrado") do
    $cadastro_page = CadastroPage.new
    $cadastro_page.cadastrar_cpf_cadastrado
end

Quando("eu clicar no botão de ir para o login") do
    $cadastro_page.clicar_login_cadastro
end

Quando("inserir um CPF já cadastrado para cadastrar") do
    $cadastro_page = CadastroPage.new
    $cadastro_page.preencher_dados_cpf_cadastrado
end

E("clicar em continuar") do
    $cadastro_page.clicar_continuar
end

E("clicar no link para redefinir minha senha") do
    $cadastro_page.clicar_redefina_senha
end

Então("devo acessar a home cadastrado com sucesso") do
    $cadastro_page.assert_cadastro
end 
  
Então("devo encontrar a mensagem de erro de conexão") do
    $cadastro_page.assert_erro_conexao
end  

Então("devo encontrar a mensagem de serviço indisponível") do
    $cadastro_page.assert_servico_indisponivel
end
    
Então("devo encontrar os dados de políticas e normas de segurança") do
    $cadastro_page.assert_politicas
end
  
Então("devo encontrar a mensagem de email já cadastrado") do
    $cadastro_page.assert_email_cadastrado
end
  
Então("devo encontrar a mensagem de CPF já cadastrado") do
    $cadastro_page.assert_cpf_cadastrado
end
  
  
  