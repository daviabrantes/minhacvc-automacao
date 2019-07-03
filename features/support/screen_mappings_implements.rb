require 'yaml'
require 'logger'

def get_screen_mappings(screen) # mapeamento dos elementos
  dir = "#{Dir.pwd}/features/elements/#{screen}_objects.yaml" # define qual arquivo de tela 
  screen_mappings = YAML.load_file(dir) # carrega o arquivo definido no step anterior
  @mappings = screen_mappings[$env] # chama a funçao pra carregar os elementos da tela
end
