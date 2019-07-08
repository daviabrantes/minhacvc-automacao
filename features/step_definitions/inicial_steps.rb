# frozen_string_literal: true

Dado("que estou na tela inicial do aplicativo") do
    $inicial_page = InicialPage.new
end

Dado("que estou na tela inicial do aplicativo com uma versão desatualizada") do

end
  
Dado("que estou na tela inicial do aplicativo com uma versão bloqueada") do
    
end

Quando("continuar sem login") do
    $inicial_page.continuar_sem_login
end

E("clicar em entrar") do
    $inicial_page.clicar_entrar
end

E("clicar em cadastrar") do
    $inicial_page.clicar_cadastrar
end



  

  

  

  

  

  

