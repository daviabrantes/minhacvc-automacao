# language: pt
Funcionalidade: Login

A tela de login possuí os campos email e senha (email sem restrição de domínio)
A senha a princípio seria de (4 a 8 dígitos a confirmar)
A tela de login possuí também um link de esqueci minha senha e cadastra-se
A tela de login possuí um botão de entrar

@Login #1
Cenário: Efetuar login com sucesso
Dado que estou na home de login
Quando informar os dados de usuário válidos
Então devo acessar a home logado com sucesso

@Login #2
Cenário: Efetuar Login Convidado com sucesso
Dado que estou na home de login
Quando continuar sem login
Então devo acessar a home sem login com sucesso

@Login #3
Cenário: Efetuar Login com email não cadastrado
Dado que estou na home de login
Quando informar um email não cadastrado
Então devo encontrar a mensagem de email ou senha incorretos

@Login #4
Cenário: Efetuar login com senha incorreta
Dado que estou na home de login
Quando informar uma senha incorreta
Então devo encontrar a mensagem de email ou senha incorretos

#TODO
#@Login #5
Cenário: Efetuar Login com serviço indisponível
Dado que estou na home de login
Quando informar os dados de usuário válidos
E o serviço estiver indisponível
Então devo encontrar a mensagem de serviço indisponível

#TODO
#@Login #6
Cenário: Efetuar Login sem conexão
Dado que estou na home de login
Quando informar os dados de usuário válidos
E estiver sem conexão de internet
Então devo encontrar a mensagem de erro de conexão

#TODO
#@Login #7
Cenário: Efetuar Login com versão bloqueada
Dado que estou na home de login com uma versão bloqueada
Quando informar os dados de usuário válidos
Então devo encontrar a mensagem de versão bloqueada

#TODO
#@Login #8
Cenário: Efetuar Login com versão desatualizada
Dado que estou na home de login com uma versão desatualizada
Quando informar os dados de usuário válidos
Então devo encontrar a mensagem de versão desatualizada

#TODO
#@Login #9
Cenário: Validar Campos Login
Dado que estou na home de login
Quando informar dados para testar os elementos da tela
Então não devo encontrar erros na tela