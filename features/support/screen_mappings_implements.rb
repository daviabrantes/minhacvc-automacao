require 'yaml'
require 'logger'

def get_screen_mappings(screen)
  $platform = ENV['PLATFORM_NAME'].downcase
  dir = "#{Dir.pwd}/features/elements/#{screen}_objects.yaml"
  screen_mappings = YAML.load_file(dir)
  @mappings = screen_mappings[$platform][screen]
end
