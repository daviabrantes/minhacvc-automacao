# frozen_string_literal: true

Quando("clicar em receber notificacoes") do
    $conta_page = ContaPage.new
    $conta_page.clicar_notificacao
end 

Então("a notificacao devera ser alterada com sucesso") do
    $conta_page.assert_notificacao
end


  

  

  

  

  

  

