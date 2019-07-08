# language: pt
Funcionalidade: Esqueci Minha Senha

@Esqueci_Minha_Senha1
Cenário: Efetuar Esqueci Minha Senha com sucesso
Dado que estou na tela inicial do aplicativo
E clicar em entrar
Quando eu clicar no botão de esqueci minha senha
E preencher os dados para recuperar minha senha
Então devem ser enviadas instruções por email

#TODO
#@Esqueci_Minha_Senha
Cenário: Efetuar Esqueci Minha Senha em tela de cadastro
Dado que estou na tela inicial do aplicativo
E clicar em cadastrar
Quando inserir um CPF já cadastrado
E clicar no link para redefinir minha senha
Então devo ser redirecionado para a tela de "Esqueci Minha Senha"

@Esqueci_Minha_Senha
Cenário: Efetuar Esqueci Minha Senha com CPF não cadastrado
Dado que estou na tela inicial do aplicativo
E clicar em entrar
Quando eu clicar no botão de esqueci minha senha
E preencher os dados com CPF não cadastrado para recuperar minha senha
Então devo encontrar a mensagem de "dados informados não conferem"

#TODO
#@Esqueci_Minha_Senha
Cenário: Efetuar Esqueci Minha Senha com email não cadastrado
Dado que estou na tela inicial do aplicativo
E clicar em entrar
Quando eu clicar no botão de esqueci minha senha
E preencher os dados com email não cadastrado para recuperar minha senha
Então devo encontrar a mensagem de "dados informados não conferem"

#TODO
#@Esqueci_Minha_Senha
Cenário: Efetuar Esqueci Minha Senha com dados divergentes
Dado que estou na tela inicial do aplicativo
E clicar em entrar
Quando eu clicar no botão de esqueci minha senha
E preencher os dados com email e CPF divergentes para recuperar minha senha
Então devo encontrar a mensagem de "dados informados não conferem"

#TODO
#@Esqueci_Minha_Senha
Cenário: Validar campos Esqueci Minha Senha
Dado que estou na tela inicial do aplicativo
E clicar em entrar
Quando eu clicar no botão de esqueci minha senha
E informar dados de senha para testar os elementos da tela
Então não devo encontrar erros na tela de esqueci minha senha