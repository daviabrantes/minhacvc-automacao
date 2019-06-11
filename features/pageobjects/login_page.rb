# frozen_string_literal: true
require 'rspec'
require 'rspec/expectations'
include RSpec::Matchers

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

  def loginless
    click @mappings['button_continuar_sem_login']
  end

  def cadastrarUsuario
    fill_in @mappings['text_nome_completo'], FFaker::NameBR.first_name
    fill_in @mappings['text_cpf'], FFaker::IdentificationBR.cpf
    fill_in @mappings['text_data_nascimento'], FFaker::Internet.free_email
    fill_in @mappings['text_email'], FFaker::Internet.free_email
    fill_in @mappings['text_senha_cadastro'], 'Senha123'
    click @mappings['button_continuar']
  end


  ### Assertions ###

  def assertLoginPage
    $ola_usuario = get_text @mappings['label_nome_entrada']
    expect($ola_usuario).to include(Massa["Usuario_Aereo_Hotel"]["nome"])
  end

  def assertLoginlessPage
    $ola_usuario = get_text @mappings['label_nome_entrada']
    expect($ola_usuario).to eq("Olá,")
  end


end