Dado("que eu acesso a página principal") do
   @page.login.visita
  end

  Quando("eu faço login com {string} e {string}") do |email,senha|
    
    #No capybara nós vamos trabalhar 100% usando css selectors -> Vou montar um seletor CSS para buscar os elementos no HTML
    #
    @page.login.com(email,senha)
  end

  Dado("que eu tento fazer login com {string} e {string} por {int} vezes") do |email, senha, quantidade|
    # quantidade += 1
     quantidade.times do
    @page.login.com(email,senha)
    sleep 0.5 # think time ( simular o usuario pensando)
     end
  end
  
  Então("devo ver a seguinte mensagem {string}") do |mensagem_ola|
    # resposta =  find("#task-board h3")
    # expect(resposta).to have_content mensagem
    expect(@page.tarefas.mensagem).to eql mensagem_ola
  end

  Então("devo ver a seguinte mensagem de alerta {string}") do |mensagem_alerta|   
    
    
    expect(@page.login.alerta).to have_content mensagem_alerta
  end                                                                           

