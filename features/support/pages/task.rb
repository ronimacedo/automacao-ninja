class TaskPage
    include Capybara::DSL
    
    def mensagem
         find("#task-board h3").text
    end


    def btn_nova_tarefa
        find('#insert-button').click
    end

    def cadastrar_tarefa(tarefa)
       
        find('#title').set tarefa[:titulo]
        find('input[name=dueDate]').set tarefa[:data]
        add_tags(tarefa[:tags])
        click_button 'Cadastrar'
    end

    def obter_status(titulo)
        find('table tbody tr', text: titulo) 

    end

    def obter_tarefas

        all('table tbody tr')

    end

    def buscar(titulo)
        find('#search-input').set titulo
        find('#search-button').click
    end

    def msg_busca_nao_encontrada
        find('#task-board .panel-c-warning').text
    end

    def msg
        find('.alert-warn').text
    end

    private
    def add_tags(tags)
        campo_tag = find('.bootstrap-tagsinput input')
        tags.each do |x|
            campo_tag.set x[:tag]
            campo_tag.send_keys :tab
        end
        
    end
end
