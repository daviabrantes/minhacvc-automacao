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

  @Login
  Cenário: Pular login
  Dado que estou na área de boas vindas
  Quando eu optar por pular o processo de login
  Então eu estarei na home logada

  @calabash @appium @jenkins
  Cenário: Logar em Viagens
  Obs.: Viagens representa a lista de viagens e reservas
  Dado que eu resolvi visualizar minhas viagens sem estar logado
  Quando eu logar
  Então eu poderei acessar o conteúdo de Viagens "adquirido"

  @calabash @appium @jenkins
  Cenário: Logar em Conta
  Obs.: Viagens representa a lista de viagens e reservas
  Dado que eu resolvi visualizar "Conta" sem estar logado
  Quando eu logar
  Então eu poderei visualizar minhas informações de cadastro

  @calabash @jenkins
  Cenário: Cadastrar em Viagens
  Obs.: Viagens representa a lista de viagens e reservas
  Dado que eu resolvi visualizar minhas viagens sem estar logado
  Quando eu me cadastrar
  Então eu poderei acessar o conteúdo de Viagens "pela primeira vez"

  @calabash @jenkins
  Cenário: Cadastrar em Conta
  Obs.: Viagens representa a lista de viagens e reservas
  Dado que eu resolvi visualizar "Conta" sem estar logado
  Quando eu me cadastrar
  Então eu poderei visualizar minhas informações de cadastro

  @calabash @appium @jenkins
  Cenário: Tentar fazer login sem preencher dados
  Dado que estou na home de login
  Quando tentar fazer o login sem preencher dos dados
  Então o botão Entrar não ficará ativo

  Cenário: Efetuar login com email invalido
  Dado que estou na home de login
  Quando informar um email inválido
  Então devo visualizar a mensagem de email/senha invalido

  @calabash @appium @jenkins
  Cenário: Efetuar login com senha invalida
  Dado que estou na home de login
  Quando informar uma senha inválida
  Então devo visualizar a mensagem de email/senha invalido

  Cenário: Efetuar login com usuário não cadastrado
  Dado que estou na home de login
  Quando informar um email não cadastrado
  Então devo visualizar a mensagem de email não cadastrado

  @instrumentado
  Cenário: Login: Sem internet
  Dado que estou na tela de login
  E que estou offline
  Quando informar os dados de usuário válido
  Então devo visualizar a mensagem de offline

  @calabash @appium @instrumentado @jenkins
  Cenário: Login: Sem serviço
  Dado que estou na home de login
  E que estou sem serviço da API
  Quando informar os dados de usuário sem serviço
  Então devo visualizar a mensagem de sem serviço


########################### PRE CADASTRO ##################################

  @calabash @appium @jenkins
  Cenário: Pré-cadastro (sucesso)
  Dado que estou na home de login
  E que sou usuário pré-cadastrado
  Quando informar os dados de usuário precadastrado
  Então deverei preencher uma nova senha
  E poderei ir para a home logada



########################### ESQUECI MINHA SENHA ###########################


  @instrumentado
  Cenário: CPF Correto - feedback do campo
  Dado que estou na home de login
  Quando acessar a opçao Esqueci minha senha
  E preencho o CPF corretamente
  Então terei um feedback de preenchimento correto

  @instrumentado
  Cenário: E-mail Correto - feedback do campo
  Dado que estou na home de login
  Quando acessar a opçao Esqueci minha senha
  E preencho o Email corretamente
  Então terei um feedback de preenchimento correto

  @instrumentado
  Cenário: CPF com dígito incorreto
  Dado que estou na home de login
  Quando acessar a opçao Esqueci minha senha
  E preencho o CPF incorretamente
  Então terei um feedback de preenchimento incorreto

  @instrumentado
  Cenário:Email com formato errado
  Dado que estou na home de login
  Quando acessar a opçao Esqueci minha senha
  E preencho o email com formato inválido
  Então terei um feedback de preenchimento incorreto

  @calabash @appium @jenkins
  Cenário: Reset de senha: Solicitar nova senha via link esqueci minha senha
  Dado que estou na home de login
  Quando acessar a opçao Esqueci minha senha
  E preencho os dados corretamente "em todos campos"
  E tentar recuperar a senha
  Então devo visualizar a mensagem de senha enviada
  E poderei ir para a tela de login

  Cenário: Reset de senha: CPF não cadastrado (API)
  Dado que estou na home de login
  Quando acessar a opçao Esqueci minha senha
  Quando preencho os dados corretamente "e eu informar cpf não cadastrado"
  E tentar recuperar a senha
  Então eu verei um aviso de cpf não cadastrado

  Cenário: Reset de senha: E-mail não cadastrado (API)
  Dado que estou na tela de "Esqueci minha Senha"
  Quando eu informar email não cadastrado
  E tentar recuperar a senha
  Então eu verei um aviso de email não cadastrado

  Cenário: Reset de senha: E-mail não vinculado (API)
  OBS.: Email vinculado significa que email não bate com o CPF cadastrado
  Dado que estou na tela de "Esqueci minha Senha"
  Quando eu informar email não vinculado
  E tentar recuperar a senha
  Então eu verei um aviso de email não vinculado

  @calabash @appium @jenkins
  Cenário: Reset de senha: Nenhum cadastro com os dados informados (API)
  Dado que estou na home de login
  Quando acessar a opçao Esqueci minha senha
  E preencho os dados corretamente "de um usuário não cadastrado"
  E tentar recuperar a senha
  Então devo visualizar a mensagem de erro para usuário não cadastrado

  Cenário: Reset de senha: CPF não vinculado (API)
  Dado que estou na tela de "Esqueci minha Senha"
  Quando eu informar cpf não vinculado
  E tentar recuperar a senha
  Então eu verei um aviso de cpf não vinculado

  Cenário: Reset de senha: Sem internet
  Dado que estou na tela de login
  E que estou offline
  Quando tentar cadastrar
  Então devo visualizar a mensagem de offline

  @calabash @appium @jenkins
  Cenário: Reset de senha: Sem serviço
  Dado que estou na home de login
  E que estou sem serviço da API
  Quando acessar a opçao Esqueci minha senha
  E preencho os dados corretamente ""
  E tentar recuperar a senha
  Então devo visualizar a mensagem de sem serviço
