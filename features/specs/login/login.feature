#language: pt

#Essa é a historia 
# -> O ator é o usuario cadastrado
# -> Tenho que desenvolver um sistema com login e autenticação de senha
# ->  E qual o beneficio , por que ele tem que estar autenticado ? Para que ele possa gerenciar suas tarefas

#Esse é meu valor de negocio

Funcionalidade: Login  
    Sendo um usuário cadastrado
    Posso acessar o sistema com meu email e senha
    Para que eu possa gerenciar minhas tarefas






#Isso abaixo é BDT( Teste Guiado por Comportamento )
# É um caso de teste tradicional , só esta disfarçado de Gherkin) e não BDD
# E BDD não foi feito para isso , ele foi feito para  trazer valor e escrever cenários que são de negócio
#eu nao quero saber como eu vou logar
# 
# Dado que eu acessi a página principal
# E preencho o campo login com "eu@papito.io"
# E preencho o campo senha com "123456"
# Quando eu clicar em entrar
# Então deve ver a mensagem "Olá, Fernando"



#Isso é um documento que serve pro desenvolvedor implementar e nao pra eu testar , teste é um beneficio.
#Não é um plano de testes , é uma especificação , então o modo de tertar tem que ser diferente.


#Jeito Certo

Contexto: Pagina Login
    Dado que eu acesso a página principal


@login @smoke
Cenario: Usuário é autenticado

Quando eu faço login com "roni@teste.com" e "123456"
Então devo ver a seguinte mensagem "Olá, Roni Macedo"



@tentativa
Esquema do Cenario: Tentando logar

Quando eu faço login com "<email>" e "<senha>"
Então devo ver a seguinte mensagem de alerta "<mensagem>"

 Exemplos:
      | email          | senha     | mensagem                               |
      | eu@papito.io   | 123456789 | Senha inválida.                        |
      | roni$gmail.com | 123456    | Email incorreto ou ausente.            |
      |                | 123456    | Email incorreto ou ausente.            |
      | eu@papito.io   |           | Senha ausente.                         |
      | roni@gmail.com | 123456    | Usuário não cadastrado.                |
      | eu@papito.io   | 123       | Senha deve ter no mínimo 6 caracteres. |


@bloqueado
Cenario: Usuário Bloqueado por tentativas

Dado que eu tento fazer login com "roni@teste.com" e "xpto12345" por 6 vezes
Então devo ver a seguinte mensagem de alerta "Usuário bloqueado"

