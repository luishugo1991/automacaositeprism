#language: pt

Funcionalidade: Cadastro de Tarefas
    Para que eu possa organizar minha vida
    Sendo um usuário cadastrado
    Posso adicionar novas tarefas no meu Painel

    @smoke @login @logout
    Cenário: Nova tarefa

        Dado que o nome da tarefa é "Fazer Compras"
        E a data de finalização será "20/08/2018"
        E quero taguear esta tarefa com:
            | tag         |
            | Compras     |
            | Supermecado |
            | Ketchup     |
            | Mostarda    |
            | Maionese    |
        Quando fazer o cadastro desta tarefa
        Então deverá ver esta tarefa com o status "Em andamento"

    @tentativa @login @logout
    Esquema do Cenário: Tentar cadastrar

        Dado que o nome da tarefa é "<nome>"
        E a data de finalização será "<data>"
        Quando fazer o cadastro desta tarefa
        Então deverá ver a mensagem "<mensagem>"

        Exemplos:
            | nome | data       | mensagem                            |
            | Ler  | 21/08/2018 | 10 caracteres é o mínimo permitido. |
            |      | 21/08/2018 | Nome é obrigatório.                 |

    @dup @login @logout 
    Cenário: Tarefa não ser duplicada

        Dado que o nome da tarefa é "Ler um livro de historia"
        E a data de finalização será "23/08/2018"
        Mas já foi cadastrado esta tarefa e esqueci 
        Quando fazer o cadastro desta tarefa
        Então deverá ver a mensagem "Tarefa duplicada."
        E deverá ver somente 1 tarefa com o nome cadastrado