Dado("que {string} é minha nova tarefa") do |titulo|
    
    @nova_tarefa = { titulo: titulo, data: nil, tags:[] }
    # @mongoDB = MongoDB.new
    MongoDB.new.remove_tarefa(titulo)
  end
  
Dado("devo finalizar esta tarefa até dia {string}") do |data|
    @nova_tarefa[:data] = data
  end
  

  # Dado("além disso vou taguear está tarefa com: # -> DataTable") do |tags|
  #   @tags = tags
  #   puts
  #   # puts @tags[1][:tags]
  # end

  Dado("além disso vou taguear está tarefa com:") do |table|
    @nova_tarefa[:tags] = table.hashes
  end

  Dado("esta tarefa ja está cadastrada") do
    steps %(Quando eu faço o cadastro desta tarefa)
  end
  
 Quando("eu faço o cadastro desta tarefa") do
  @page.tarefas.btn_nova_tarefa
  @page.tarefas.cadastrar_tarefa(@nova_tarefa)


end
  
Então("está tarefa deve ser exibida com status {string}") do |status|
     # <- Capybara tem uma ESTRATEGIA  muito legal de encontrar elementos
                                              # <- eu quero um elemento cuja o texto dele contenha @titulo
   expect(@page.tarefas.obter_status(@nova_tarefa[:titulo])).to have_content status
end

Então("vejo a mensagem de alerta {string}") do |msg_alerta|
  expect(@page.tarefas.msg).to eql msg_alerta
end

Então("deve existir somente  somente {int} registro com o nome cadastrado") do |qtd|  
         resultado = MongoDB.new.busca_tarefa(@nova_tarefa[:titulo])
        #  puts 'A QUANTIDADE DA CONSULTA DO BANCO'
        #  puts resultado.count
        expect(resultado.count).to eql qtd
end                                                                                   


#Apagar tarefa


Dado("que {string} é uma tarefa indesejada") do |titulo|
 @tarefa_indesejada = { titulo: titulo, data: '10/10/2019', tags: [{tag: 'tag1'},{tag: 'tag2'}]}
 MongoDB.new.remove_tarefa(titulo)
 @page.tarefas.btn_nova_tarefa
 @page.tarefas.cadastrar_tarefa(@tarefa_indesejada)

end

Quando("eu solicito a exclusão dessa tarefa") do
 resultado = @page.tarefas.obter_status(@tarefa_indesejada[:titulo])
 resultado.find('i[class*=fa-trash-o]').click
end

Quando("confirmo esta solicitação") do
  within('.modal-content') do #Conceito de Escopo , pegamos o Pai 
      click_button 'Sim'      #within - dentro do modal clica no botao Sim
  end
end

Quando("não confirmo esta solicitação") do
  within('.modal-content') do

click_button 'Não, deixa queto.'
  end
end

Então("ela nao deve ser exibida no painel") do
 
  @page.tarefas.buscar(@tarefa_indesejada[:titulo])
  expect(@page.tarefas.msg_busca_nao_encontrada).to eql 'Hmm... nenhuma tarefa encontrada :('
  
end

Então("esta tarefa deve permanecer no painel") do

  @page.tarefas.buscar(@tarefa_indesejada[:titulo])
  expect(@page.tarefas.obter_tarefas.size).to eql 1
end