require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

@browser = ENV['BROWSER'] # Recuperar valor da variavel de ambiente Browser
Capybara.configure do |config|

    config.default_driver = if @browser.eql?('firefox')
                                :selenium
                            elsif
                                @browser.eql?('chrome')
                                :selenium_chrome
                            elsif
                                @browser.eql?('chrome_headless')
                                :selenium_chrome_headless
                            else
                                raise 'Nenhum navegador foi selecionado' #Raise - Força um erro customizado
                            end
    config.default_max_wait_time = 5
end