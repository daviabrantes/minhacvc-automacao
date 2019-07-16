# frozen_string_literal: true
require 'rspec'
require 'rspec/expectations'
require 'ffaker'
include RSpec::Matchers

class ContaPage

  def initialize
    get_screen_mappings 'conta'
  end
  
  def clicar_notificacao
    $opcao_botao = get_text @mappings['button_notificacao']
    click @mappings['button_notificacao']
  end




  ### Assertions ###

  def assert_notificacao
    expect(get_text @mappings['button_notificacao']).not_to be($opcao_botao)
  end

end