# frozen_string_literal: true
require 'rspec'
require 'rspec/expectations'
require 'ffaker'
require 'colorize'
include RSpec::Matchers
include FFaker

class EsqueciMinhaSenhaPage

  def initialize
    get_screen_mappings 'esqueci_minha_senha' # carrega os elementos da tela Esqueci Minha Senha
  end
  
  def clicar_esqueci_senha 
    click @mappings['button_entrar']
    click @mappings['link_esqueci_senha']
  end

  def preencher_esqueci_senha
    login = USUARIOS[:usuario_esqueci_senha]
    fill_in @mappings['text_cpf'], login[:cpf]
    fill_in @mappings['text_email'], login[:email]
    click @mappings['button_enviar']
  end

  def preencher_cpf_nao_cadastrado
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

  def preencher_email_nao_cadastrado
    login = USUARIOS[:usuario_esqueci_senha]
    fill_in @mappings['text_cpf'], login[:nome]
    fill_in @mappings['text_email'], 'email@teste.com'
    click @mappings['button_enviar']
  end

  def preencher_dados_divergentes
  end

  def validar_elementos
  end

  



  ### Assertions ###

  def assert_esqueci_senha
    expect(get_text @mappings['label_senha_enviada']).to eq('Senha enviada para seu e-mail de cadastro')
    expect(get_text @mappings['label_email_instrucoes']).to include('e-mail com as instruções')
    $logger.info("E-mail de recuperação enviado com sucesso!")
  end

  def assert_validar_elementos
  end

  def assert_mensagem_erro
  end

  
end