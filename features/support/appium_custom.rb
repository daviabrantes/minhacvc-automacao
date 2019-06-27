# frozen_string_literal: true

  def wait(seconds)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until {yield}
  end

  def take_screenshot
    $driver.screenshot("screenshots/#{$env}/#{$scenario}_#{$executionTime}.png")
  end

  def gerar_data
    dia = rand(01..28)
      if dia < 10
      dia = '0' + dia.to_s
      end
    mes = rand(01..12)
      if mes < 10
        mes = '0' + mes.to_s
      end
    ano = rand(1930..2000)
    $data = dia.to_s + mes.to_s + ano.to_s
  end

  def swipe_down
    @x = window_size[:width]/2
    @y = window_size[:height] - 200
    @startCords = [@x,@y]
    @endCords = first_text.location
   swipe(start_x:@startCords[0],start_y:@startCords[1],end_x:@endCords[0],end_y:@endCords[1], duration:1000)
  end

  def button_exists?(button)
    $logger.info("Verificando a existência do elemento #{el}")
    $driver.find_elements(:id, button).count > 0
  end
  
  def wait_for(el)
    wait(8) { $driver.find_element(:id, el).displayed? }
    $logger.info("Aguardou a exibição do elemento #{el}")
  end
  
  def wait_for_element_to_exist(el)
     wait(10) { element_exists? el }
     $logger.info("Aguardou a existência do elemento #{el}")
  end
  
  def click(el)
    wait_for_element_to_exist(el)
    $driver.find_element(:id, el).click
    $logger.info('Clicou no botão ' + el)
  end
  
  def click_index(el, index)
    wait_for_element_to_exist(el)
    $driver.find_elements(:id, el)[index].click
    $logger.info("Clicou no indice #{index} do elemento #{el}")
  end
  
  def click_subelement_index(element, el, index)
    wait_for_element_to_exist(el)
    element.find_elements(:id, el).get(index).click
    $logger.info("Clicou em um subelemento no indice #{index} do elemento #{el}")
  end
  
  def element_exists?(el)
    $logger.info("Verificando se existe o elemento #{el}")
    return $driver.find_elements(:id, el).count > 0
  end
  
  def elements(el)
    return $driver.find_elements(:id, el)
    $logger.info('Buscou a lista de elementos ' + el)
  end
  
  def element_is_enabled?(el)
    $logger.info("Elemento habilitado #{el}")
    return $driver.find_elements(:id, el).enabled
  end
  
  def get_text(el)
    wait(8) { $driver.find_element(:id, el).displayed? }
    $logger.info('Está buscando o texto do elemento ' + el)
    return $driver.find_element(:id, el).text
  end
  
  def get_subelement_text_index(element, el, index)
    $logger.info("Buscando texto em subelemento no indice #{index} do elemento #{el}")
    return element.find_elements(:id, el).get(index).text
  end
  
  def get_text_index(el, index)
    $logger.info("Indice do texto #{index} do elemento #{el}")
    return $driver.find_elements(:id, el).get(index).text
  end
  
  def fill_in(el, text)
    element = $driver.find_element(:id, el)
    element.clear
    element.send_keys text
    $logger.info("Preencheu o campo #{el} com o valor #{text}")
  end
  
  def hide_keyboard
    if android?
      $driver.hide_keyboard
    elsif ios?
      $driver.hide_keyboard :pressKey
    end
    $logger.info('Fechou o teclado virtual')
  end
  
  def id_exists?(id)
    $driver.find_elements(:id, id).count > 0
  end
  
  def wait_for_id_to_exist(id)
    wait(8) { id_exists? id }
  end
  
  def click_id(id)
    wait_for_id_to_exist id
    $driver.find_element(:id, id).click
  end
  
  def tap_screen(screen_x, screen_y)
    Appium::TouchAction.new.tap(x: screen_x, y: screen_y).perform
  end
  
  def scroll_to(el_start, el_start_location, el_end, el_end_location)
    # get element coordinates start
    el_start = $driver.find_element(:id, el_start)
    screen_x_start = el_start.location.x
    screen_y_start = el_start.location.y
    # get element coordinates end
    el_end = $driver.find_element(:id, el_end)
    screen_x_end = el_end.location.x
    screen_y_end = el_end.location.y
    Appium::TouchAction.new.swipe(start_x: screen_x_start, start_y: screen_y_start, delta_x: screen_x_end, delta_y: screen_y_end).perform
    $logger.info("Executou o scroll para as coordenadas: screen_x_start #{screen_x_start} - screen_y_start #{screen_y_start} - screen_x_end #{screen_x_end} - screen_y_end #{screen_y_end}")
  end
  
  def id_text(id)
    wait_for_id_to_exist id
    $driver.find_element(:id, id).text
  end
  
  def text_exists?(text)
    $driver.find_elements(:xpath, "//*[contains(@text,\"#{text}\")]").count > 0
  end
  
  def wait_for_text_to_exist(text)
    wait(8) { text_exists? text }
  end
  
  def click_text(text)
    wait_for_text_to_exist text
    $driver.find_element(:xpath, "//*[contains(@text,'#{text}')]").click
  end
  
  def android?
    $platform == 'android'
  end
  
  def ios?
    $platform == 'ios'
  end