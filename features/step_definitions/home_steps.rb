# frozen_string_literal: true

Então("devo acessar a home logado com sucesso") do
    $home_page = HomePage.new
    $home_page.assert_login
end 

Então("devo acessar a home sem login com sucesso") do
    $home_page = HomePage.new
    $home_page.assert_loginless
end


  

  

  

  

  

  

