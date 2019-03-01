#language:pt

Funcionalidade: Apagar Tarefas
Sendo um usuário que possui um ou mais tarefas indesejadas
Posso remover tarefas
Para deixar meu painel mais organizado

@auth
Cenario: Apagar Tarefa

    Dado que "Estudar Java" é uma tarefa indesejada
    Quando eu solicito a exclusão dessa tarefa
    E confirmo esta solicitação
    Então ela nao deve ser exibida no painel

@auth
Cenario: Desistir

    Dado que "Estudar MongoDB" é uma tarefa indesejada
    Quando eu solicito a exclusão dessa tarefa
    E não confirmo esta solicitação
    Então esta tarefa deve permanecer no painel