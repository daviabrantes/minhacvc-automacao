# frozen_string_literal: true

Quando("preencher os dados com CPF não cadastrado para recuperar minha senha") do
    $esqueci_minha_senha_page = EsqueciMinhaSenhaPage.new
    $esqueci_minha_senha_page.preencher_cpf_nao_cadastrado
end

Quando("preencher os dados com email não cadastrado para recuperar minha senha") do
    $esqueci_minha_senha_page = EsqueciMinhaSenhaPage.new
    $esqueci_minha_senha_page.preencher_email_nao_cadastrado
end
  
Quando("preencher os dados com email e CPF divergentes para recuperar minha senha") do
    $esqueci_minha_senha_page = EsqueciMinhaSenhaPage.new
    $esqueci_minha_senha_page.preencher_dados_divergentes
end
  
Quando("informar dados de senha para testar os elementos da tela") do
    $esqueci_minha_senha_page.validar_elementos
end

Quando("inserir um CPF já cadastrado") do
    
end

E("preencher os dados para recuperar minha senha") do
    $esqueci_minha_senha_page = EsqueciMinhaSenhaPage.new
    $esqueci_minha_senha_page.preencher_esqueci_senha  
end
  
Então("não devo encontrar erros na tela de esqueci minha senha") do
    $esqueci_minha_senha_page.assert_validar_elementos  
end

Então("devo encontrar a mensagem de dados incorretos") do
    $esqueci_minha_senha_page.assert_mensagem_erro
end

Então("devem ser enviadas instruções por email") do
    $esqueci_minha_senha_page.assert_esqueci_senha
end

Então("devo ser redirecionado para a tela de Esqueci Minha Senha") do
    $esqueci_minha_senha_page = EsqueciMinhaSenhaPage.new
    $esqueci_minha_senha_page.assert_redirecionamento
end
