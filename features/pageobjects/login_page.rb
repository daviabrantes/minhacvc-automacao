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
    click @mappings['button_entrar']
    fill_in @mappings['text_email'], Massa["Usuario_Aereo_Hotel"]["email"]
    fill_in @mappings['text_senha'], Massa["Usuario_Aereo_Hotel"]["senha"]
    click @mappings['button_entrar']
    get_screen_mappings 'home_logada'
  end

  def login_erro_email
    click @mappings['button_entrar']
    fill_in @mappings['text_email'], 'teste@descubra.com'
    fill_in @mappings['text_senha'], Massa["Usuario_Aereo_Hotel"]["senha"]
    click @mappings['button_entrar']
  end

  def login_erro_senha
    click @mappings['button_entrar']
    fill_in @mappings['text_email'], Massa["Usuario_Aereo_Hotel"]["email"]
    fill_in @mappings['text_senha'], '123456'
    click @mappings['button_entrar']
  end

  def loginless
    click @mappings['button_continuar_sem_login']
    get_screen_mappings 'home_logada'
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
    $logger.debug("Acesso sem login com sucesso!")
  end

  def assert_login_erro
    expect(get_text @mappings['label_email_senha_erro']).to eq('E-mail ou senha incorretos.')
  end

end