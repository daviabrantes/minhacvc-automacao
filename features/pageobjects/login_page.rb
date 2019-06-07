class LoginPage

    def login
      click @mappings['button_entrar']
    end

    def initialize
      get_screen_mappings 'login'
    end

end