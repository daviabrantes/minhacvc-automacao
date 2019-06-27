include FFaker
require 'ffaker'

USUARIOS = { 
    usuario_aereo_hotel: 
    {
        email: "frormm@gmail.com",
        senha: "thi0927",
        nome: "Rosiane"
    },
    usuario_seguro: 
    {
        email: "adrilk@hotmail.com",
        senha: "25902590",
        nome: "Adriano"
    },
    usuario_esqueci_senha:
    {
        email: "buck.bednar@hotmail.com",
        cpf: "47169855127",
    }
}

CADASTRO = {
    dados_cadastro:
    {
    nome: FFaker::NameBR.first_name,
    cpf: FFaker::IdentificationBR.cpf,
    data: gerar_data,
    email: FFaker::Internet.free_email
    }
}
