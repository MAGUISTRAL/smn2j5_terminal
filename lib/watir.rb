require 'watir'
browser = Watir::Browser.new
browser.goto 'google.com'
search_bar = browser.text_field(class: 'gsfi')
search_bar.set("Hello World!")

#méthode de la barre d'entrée
#search_bar.send_keys(:enter)

#méthode du clic
submit_button = browser.button(type:"submit")
submit_button.click
