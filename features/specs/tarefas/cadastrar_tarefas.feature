#language:pt

Funcionalidade: Cadastro de tarefas
    Para que eu possa organizar minhas atividades  
    Sendo um usuário cadastrado
    Posso adicionar novas tarefas


@auth
Cenario: Cadastrar Tarefa

    Dado que "Estudar Ruby" é minha nova tarefa
    E devo finalizar esta tarefa até dia "02/12/2019"
    E além disso vou taguear está tarefa com: 
            | tag         |
            | capybara    |
            | ruby        |
            | programação | 
    Quando eu faço o cadastro desta tarefa
    Então está tarefa deve ser exibida com status "Em andamento"
    E deve existir somente  somente 1 registro com o nome cadastrado

    @auth @dup
    Cenario: Cadastrar tarefa duplicada
    Dado que "Viajar a trabalho" é minha nova tarefa
    E devo finalizar esta tarefa até dia "02/12/2019"
    E além disso vou taguear está tarefa com: 
            | tag         |
            | capybara    |
            | ruby        |
            | programação | 
    Mas esta tarefa ja está cadastrada
    Quando eu faço o cadastro desta tarefa
    Então vejo a mensagem de alerta "Tarefa duplicada."
    E deve existir somente  somente 1 registro com o nome cadastrado