# language: pt
Funcionalidade: Cadastro

@Cadastro1
Cenário: Efetuar cadastro com sucesso
Dado que estou na tela inicial do aplicativo
E clicar em cadastrar
Quando cadastrar os dados de usuário válidos
Então devo acessar a home cadastrado com sucesso

@Cadastro2
Cenário: Efetuar Cadastro com CPF já cadastrado
Dado que estou na tela inicial do aplicativo
E clicar em cadastrar
Quando informar os dados de usuário com CPF já cadastrado
Então devo encontrar a mensagem de CPF já cadastrado

@Cadastro3
Cenário: Efetuar Cadastro com email já cadastrado
Dado que estou na tela inicial do aplicativo
E clicar em cadastrar
Quando informar os dados de usuário com email já cadastrado
E clicar em continuar
Então devo encontrar a mensagem de email já cadastrado

#TODO
@Cadastro4 #4
Cenário: Validar campos Cadastro
Dado que estou na tela inicial do aplicativo
E clicar em cadastrar
Quando informar dados de cadastro para testar os elementos da tela
Então não devo encontrar erros na tela

#TODO
@Cadastro5 #5
Cenário: Validar Política de Segurança
Dado que estou na tela inicial do aplicativo
E clicar em cadastrar
Quando clicar em política de segurança
Então devo encontrar os dados de políticas e normas de segurança

#TODO
@Cadastro #6
Cenário: Efetuar Cadastro com serviço indisponível
Dado que estou na tela inicial do aplicativo
E clicar em cadastrar
Quando cadastrar os dados de usuário válidos
E o serviço estiver indisponível
Então devo encontrar a mensagem de serviço indisponível

#TODO
@Cadastro #7
Cenário: Efetuar Cadastro sem conexão
Dado que estou na tela inicial do aplicativo
E clicar em cadastrar
Quando cadastrar os dados de usuário válidos
E estiver sem conexão de internet
Então devo encontrar a mensagem de erro de conexão