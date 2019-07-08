# frozen_string_literal: true
require 'rspec'
require 'rspec/expectations'
require 'ffaker'
include RSpec::Matchers
include FFaker

class CadastroPage

  def initialize
    get_screen_mappings 'cadastro'
  end
  
  def cadastrar_usuario
    preencher_dados_cadastro
    click @mappings['button_continuar']
  end

  def preencher_dados_cadastro
    cadastro = CADASTRO[:dados_cadastro]
    $nomeCadastro = cadastro[:nome]
    $cpfCadastro = cadastro[:cpf]
    $dataCadastro = cadastro[:data]
    $emailCadastro = cadastro[:email]
    fill_in @mappings['text_nome_completo'], $nomeCadastro
    fill_in @mappings['text_cpf'], $cpfCadastro
    fill_in @mappings['text_data_nascimento'], $dataCadastro
    fill_in @mappings['text_email'], $emailCadastro
    fill_in @mappings['text_senha_cadastro'], 'Senha123!'
    cadastro[:nome] = $olaUsuario
    back
  end

  def preencher_dados_cpf_cadastrado
    fill_in @mappings['text_cpf'], '47169855127'
    click @mappings['text_nome_completo']
  end

  def preencher_dados_email_cadastrado
    fill_in @mappings['text_email'], 'buck.bednar@hotmail.com'
    click @mappings['text_nome_completo']
  end

  def clicar_politica
    click @mappings['link_politica_seguranca']
  end

  def clicar_login_cadastro
    click @mappings['button_alerta_ir_login']
  end



  ### Assertions ###

  def assert_cadastro
    cadastro = CADASTRO[:dados_cadastro]
    element_exists?(@mappings['label_email_cadastrado'])
    $logger.info("Cadastrei usuário com sucesso - Email: #{$emailCadastro} - Senha: Senha123!")
    expect(get_text @mappings['label_email_cadastrado']).to eq($emailCadastro)
    expect(get_text @mappings['label_cadastro_realizado']).to include('realizado com sucesso')
  end

  def assert_email_cadastrado
    expect(get_text @mappings['label_cadastro_realizado']).to include('realizado com sucesso')
  end
  
  def validar_campos
  end

  def assert_politicas
    
  end

  def assert_cpf_cadastrado
  end

end