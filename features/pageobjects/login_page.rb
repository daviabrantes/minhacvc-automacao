# frozen_string_literal: true
require 'rspec'
require 'rspec/expectations'
require 'ffaker'
require 'colorize'
include RSpec::Matchers
include FFaker

class LoginPage

  def initialize
    get_screen_mappings 'login' # carrega os elementos da tela Login
  end
  
  def logar
    login = USUARIOS[:usuario_aereo_hotel]
    fill_in @mappings['text_email'], login[:email]
    fill_in @mappings['text_senha'], login[:senha]
    click @mappings['button_entrar']
  end

  def logar_erro_email
    login = USUARIOS[:usuario_aereo_hotel]
    fill_in @mappings['text_email'], 'teste@descubra.com'
    fill_in @mappings['text_senha'], login[:senha]
    click @mappings['button_entrar']
  end

  def logar_erro_senha
    login = USUARIOS[:usuario_aereo_hotel]
    fill_in @mappings['text_email'], login[:email]
    fill_in @mappings['text_senha'], '123456'
    click @mappings['button_entrar']
  end

  def loginless
    click @mappings['button_continuar_sem_login']
  end

  def clicar_esqueci_senha
    click @mappings['link_esqueci_senha']
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

  def assert_elementos_login
    expect(@mappings['text_email']).to exist
    expect(@mappings['text_senha']).to exist
    expect(@mappings['link_esqueci_senha']).to exist
    expect(@mappings['button_ver_password']).to exist
    expect(@mappings['link_cadastro']).to exist
    fill_in @mappings['text_email'], 'a'
  end

end