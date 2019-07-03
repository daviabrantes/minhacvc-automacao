# language: pt
Funcionalidade: Esqueci Minha Senha

@Esqueci_Minha_Senha
Cenário: Efetuar Esqueci Minha Senha com sucesso
Dado que estou na home de login
Quando eu clicar no botão de esqueci minha senha
E preencher os dados para recuperar minha senha
Então devem ser enviadas instruções por email

@Esqueci_Minha_Senha
Cenário: Efetuar Esqueci Minha Senha com CPF não cadastrado
Dado que estou na home de login
Quando eu clicar no botão de esqueci minha senha
E preencher os dados com CPF não cadastrado para recuperar minha senha
Então devo encontrar a mensagem de "dados informados não conferem"

#TODO
#@Esqueci_Minha_Senha
Cenário: Efetuar Esqueci Minha Senha com email não cadastrado
Dado que estou na home de login
Quando eu clicar no botão de esqueci minha senha
E preencher os dados com email não cadastrado para recuperar minha senha
Então devo encontrar a mensagem de "dados informados não conferem"

#TODO
#@Esqueci_Minha_Senha
Cenário: Efetuar Esqueci Minha Senha com dados divergentes
Dado que estou na home de login
Quando eu clicar no botão de esqueci minha senha
E preencher os dados com email e CPF divergentes para recuperar minha senha
Então devo encontrar a mensagem de "dados informados não conferem"

#TODO
#@Esqueci_Minha_Senha
Cenário: Validar campos Esqueci Minha Senha
Dado que estou na home de login
Quando eu clicar no botão de esqueci minha senha
E informar dados de senha para testar os elementos da tela
Então não devo encontrar erros na tela