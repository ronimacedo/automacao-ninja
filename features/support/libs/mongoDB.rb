require 'mongo'

# url: ds225078.mlab.com
# database: heroku_4m3km28x  
# username: heroku_4m3km28x
# porta: 25078
# senha: rmrm93njviet46a4caul3svj4p


class MongoDB



    def remove_tarefa(titulo)
        @task = client[:tasks] # Define a coleção (Client abre conexao , pegando colections
        @task.delete_many('title' => titulo)                     #tasks , vou ter acesso a todas as operações(leitura , delete))

    end

    def busca_tarefa(titulo)
        @task = client[:tasks]
        @task.find('title' => titulo)
        
    end

    private
    def client

        # Gravar LOG do Mongo dentro de uma pasta
            Mongo::Logger.logger = Logger.new('log/mong.log')

        #outra forma = mongodb://servidor:porta/bancodedados -> sem senha
        #com senha:  str_conn = 'mongodb://usuario:senha@servidor:porta/banco'  ->
    # str_conn = 'mongodb://heroku_4m3km28x@rmrm93njviet46a4caul3svj4p:ds225078.mlab.com:25078/heroku_4m3km28x' -> Maneira errada
       str_conn = 'mongodb://heroku_4m3km28x:rmrm93njviet46a4caul3svj4p@ds225078.mlab.com:25078/heroku_4m3km28x'    
        Mongo::Client.new(str_conn)
    end
end