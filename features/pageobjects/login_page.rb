# frozen_string_literal: true
require 'rspec'
require 'rspec/expectations'
require 'ffaker'
require 'colorize'
include RSpec::Matchers
include FFaker

class LoginPage

  def initialize
    get_screen_mappings 'login'
  end
  
  def login
    login = USUARIOS[:usuario_aereo_hotel]
    click @mappings['button_entrar']
    fill_in @mappings['text_email'], login[:email]
    fill_in @mappings['text_senha'], login[:senha]
    click @mappings['button_entrar']
    get_screen_mappings 'home_logada'
  end

  def login_erro_email
    login = USUARIOS[:usuario_aereo_hotel]
    click @mappings['button_entrar']
    fill_in @mappings['text_email'], 'teste@descubra.com'
    fill_in @mappings['text_senha'], login[:senha]
    click @mappings['button_entrar']
  end

  def login_erro_senha
    login = USUARIOS[:usuario_aereo_hotel]
    click @mappings['button_entrar']
    fill_in @mappings['text_email'], login[:email]
    fill_in @mappings['text_senha'], '123456'
    click @mappings['button_entrar']
  end

  def loginless
    click @mappings['button_continuar_sem_login']
    get_screen_mappings 'home_logada'
  end

  def esqueci_senha 
    click @mappings['button_entrar']
    click @mappings['link_esqueci_senha']
  end

  def preencher_esqueci_senha
    login = USUARIOS[:usuario_esqueci_senha]
    fill_in @mappings['text_cpf'], login[:cpf]
    fill_in @mappings['text_email'], login[:email]
    click @mappings['button_enviar']
  end

  def preencher_esqueci_senha_cpf_incorreto
    login = USUARIOS[:usuario_esqueci_senha]
    fill_in @mappings['text_cpf'], '12070881024'
    fill_in @mappings['text_email'], login[:email]
    click @mappings['button_enviar']
  end

  def preencher_esqueci_senha_cpf_inexistente
    login = USUARIOS[:usuario_esqueci_senha]
    fill_in @mappings['text_cpf'], '11122233344'
    fill_in @mappings['text_email'], login[:email]
    click @mappings['button_enviar']
  end

  def preencher_esqueci_senha_email_inexistente
    login = USUARIOS[:usuario_esqueci_senha]
    fill_in @mappings['text_cpf'], login[:nome]
    fill_in @mappings['text_email'], 'email@teste.com'
    click @mappings['button_enviar']
  end



  ### Assertions ###

  def assert_login
    login = USUARIOS[:usuario_aereo_hotel]
    element_exists?(@mappings['label_nome_entrada'])
    $logger.info('Loguei com sucesso - usuário ' + login[:email])
    $olaUsuario = get_text @mappings['label_nome_entrada']
    expect($olaUsuario).to include(login[:nome])
  end

  def assert_loginless
    element_exists?(@mappings['label_nome_entrada']) 
    $olaUsuario = get_text @mappings['label_nome_entrada']
    expect($olaUsuario).to eq("Olá,")
    $logger.info("Acesso sem login com sucesso!")
  end

  def assert_login_erro
    expect(get_text @mappings['label_email_senha_erro']).to eq('E-mail ou senha incorretos.')
    $logger.info("Erro de login realizado com sucesso!")
  end

  def assert_esqueci_senha
    expect(get_text @mappings['label_senha_enviada']).to eq('Senha enviada para seu e-mail de cadastro')
    expect(get_text @mappings['label_email_instrucoes']).to include('e-mail com as instruções')
    $logger.info("E-mail de recuperação enviado com sucesso!")
  end

end