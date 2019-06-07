# language: pt
Funcionalidade: Login

A tela de login possuí os campos email e senha (email sem restrição de domínio)
A senha a princípio seria de (4 a 8 dígitos a confirmar)
A tela de login possuí também um link de esqueci minha senha e cadastra-se
A tela de login possuí um botão de entrar

  @Login @blabla
  Cenário: Efetuar login com sucesso
  Dado que estou na home de login
  Quando informar os dados de usuário válido
  Então devo realizar o login com sucesso