Before do
  @page = Pages.new
  @component = Component.new
  # @login_page = LoginPage.new
  # @tarefas = TaskPage.new
end


Before('@auth') do
  @page.login.visita
  @page.login.com('roni@teste.com','123456')
end


After('@logout') do 
  component.nav.sair
end

After do |scenario|
nome = scenario.name.gsub(/[^A-Za-z0-9 ]/,'')
nome = nome.tr(' ','_').downcase!
shot = "log/shots/#{nome}.png"
page.save_screenshot(shot) #capybara tira  screnshot
embed(shot,'image/png','Evidencias') #cucumber anexa screenshot no report

end


