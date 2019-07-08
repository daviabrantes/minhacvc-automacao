# frozen_string_literal: true
require 'rspec'
require 'rspec/expectations'
require 'ffaker'
require 'colorize'
include RSpec::Matchers
include FFaker

class HomePage

  def initialize
    get_screen_mappings 'home' # carrega os elementos da tela Login
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

end