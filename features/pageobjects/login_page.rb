# frozen_string_literal: true

class LoginPage

  def initialize
    get_screen_mappings 'login'
  end
  
  def login
    click @mappings['button_entrar']
    fill_in @mappings['text_email'],['teste']
    fill_in @mappings['text_senha'],['teste']
    click @mappings['button_entrar']
  end

end