# frozen_string_literal: true
require 'rspec'
require 'rspec/expectations'
require 'ffaker'
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
    $logger.info('Loguei com sucesso - usuário ' + Massa["Usuario_Aereo_Hotel"]["email"])
  end

  def loginless
    click @mappings['button_continuar_sem_login']
    get_screen_mappings 'home_logada'
    $logger.info('Continuei sem login...')
  end

  def cadastrarUsuario
    click @mappings['button_cadastro']
    $nome_completo_cadastro = FFaker::NameBR.first_name
    $cpf_cadastro = FFaker::IdentificationBR.cpf
    $data_nascimento_cadastro = gerarData
    $email_cadastro = FFaker::Internet.free_email
    fill_in @mappings['text_nome_completo'], $nome_completo_cadastro
    fill_in @mappings['text_cpf'], $cpf_cadastro
    fill_in @mappings['text_data_nascimento'], $data_nascimento_cadastro
    fill_in @mappings['text_email'], $email_cadastro
    fill_in @mappings['text_senha_cadastro'], 'Senha123!'
    $nome_completo_cadastro = $ola_usuario
    back
    click @mappings['button_continuar']
    $logger.info("Cadastrei usuário com sucesso - Email: #{$email_cadastro} - Senha: Senha123!")
    #assertCadastro
  end

  def gerarData
    dia = rand(01..28)
      if dia < 10
      dia = '0' + dia.to_s
      end
    mes = rand(01..12)
    if mes < 10
      mes = '0' + mes.to_s
      end
    ano = rand(1930..2000)
    data = dia.to_s + mes.to_s + ano.to_s
    return data
  end


  ### Assertions ###

  def assertLogin
    $ola_usuario = get_text @mappings['label_nome_entrada']
    expect($ola_usuario).to include(Massa["Usuario_Aereo_Hotel"]["nome"])
    $logger.info("Assert de Login passou!")
  end

  def assertLoginless
    $ola_usuario = get_text @mappings['label_nome_entrada']
    expect($ola_usuario).to eq("Olá,")
    $logger.info("Assert sem Login passou!")
  end

  def assertCadastro
    expect(get_text @mappings['label_email_cadastrado']).to eq($email_cadastro)
    expect(get_text @mappings['label_cadastro_realizado']).to include('realizado com sucesso')
    $logger.info("Assert de Cadastro passou!")
  end

end