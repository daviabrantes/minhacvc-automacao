# frozen_string_literal: true
require 'rspec'
require 'rspec/expectations'
require 'ffaker'
include RSpec::Matchers
include FFaker

class InicialPage

  def initialize
    get_screen_mappings 'inicial'
  end
  
  def clicar_cadastrar
    click @mappings['button_cadastro']
  end

  def clicar_entrar
    click @mappings['button_entrar']
  end

  def continuar_sem_login
    click @mappings['button_continuar_sem_login']
  end


  ### Assertions ###

  def assert_inicial_page
  end

end