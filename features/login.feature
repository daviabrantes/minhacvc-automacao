# language: pt
Funcionalidade: Login

A tela de login possuí os campos email e senha (email sem restrição de domínio)
A senha a princípio seria de (4 a 8 dígitos a confirmar)
A tela de login possuí também um link de esqueci minha senha e cadastra-se
A tela de login possuí um botão de entrar

@Login
Cenário: Efetuar login com sucesso
Dado que estou na home de login
Quando informar os dados de usuário válidos
Então devo acessar a home logado com sucesso

@Login
Cenário: Efetuar login com email nao cadastrado
Dado que estou na home de login
Quando informar um email não cadastrado
Então devo encontrar a mensagem de email ou senha incorretos

@Login
Cenário: Efetuar login com senha incorreta
Dado que estou na home de login
Quando informar uma senha incorreta
Então devo encontrar a mensagem de email ou senha incorretos

@Loginless
Cenário: Efetuar loginless com sucesso
Dado que estou na home de login
Quando continuar sem login
Então devo acessar a home sem login com sucesso

@Cadastro
Cenário: Efetuar cadastro com sucesso
Dado que estou na home de login
Quando cadastrar os dados de usuário válidos
Então devo acessar a home cadastrado com sucesso