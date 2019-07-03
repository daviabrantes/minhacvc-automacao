# language: pt
Funcionalidade: Cadastro

@Cadastro #1
Cenário: Efetuar cadastro com sucesso
Dado que estou na home de login
Quando cadastrar os dados de usuário válidos
Então devo acessar a home cadastrado com sucesso

#TODO
#@Cadastro #2
Cenário: Efetuar Cadastro com CPF já cadastrado
Dado que estou na home de login
Quando cadastrar os dados de usuário com CPF já cadastrado
Então devo encontrar a mensagem de CPF já cadastrado

#TODO
#@Cadastro #3
Cenário: Efetuar Cadastro com email já cadastrado
Dado que estou na home de login
Quando cadastrar os dados de usuário com email já cadastrado
Então devo encontrar a mensagem de email já cadastrado

#TODO
#@Cadastro #4
Cenário: Validar campos Cadastro
Dado que estou na home de login
Quando informar dados de cadastro para testar os elementos da tela
Então não devo encontrar erros na tela

#TODO
#@Cadastro #5
Cenário: Validar Política de Segurança
Dado que estou na home de login
Quando clicar em política de segurança
Então devo encontrar os dados de políticas e normas de segurança

#TODO
#@Cadastro #6
Cenário: Efetuar Cadastro com serviço indisponível
Dado que estou na home de login
Quando cadastrar os dados de usuário válidos
E o serviço estiver indisponível
Então devo encontrar a mensagem de serviço indisponível

#TODO
#@Cadastro #7
Cenário: Efetuar Cadastro sem conexão
Dado que estou na home de login
Quando cadastrar os dados de usuário válidos
E estiver sem conexão de internet
Então devo encontrar a mensagem de erro de conexão