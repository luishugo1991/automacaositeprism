#language: pt

Funcionalidade: Cadastro de usuários
    Sendo um visitante
    Posso fazer meu Cadastro
    Para poder gerenciar minhas tarefas

    Contexto: Formulário
        Dado que esteja no Formulário de Cadastro
    
    @cad
    Cenário: Cadastro Simples
        E possuir os seguintes dados nome:"Luis" email:"luis_23@live.com" e senha:"123456" 
        Quando fazer o Cadastro
        Então deverá ver uma mensagem "Olá, Luis"

    @campos
    Esquema do Cenário: Campos Obrigatórios 

        E possuir os seguintes dados nome:"<nome>" email:"<email>" e senha:"<senha>" 
        Quando fazer o Cadastro
        Então deverá ver essa mensagem '<saida>'

        Exemplos:
            | nome | email          | senha  | saida                    |
            |      | luis2@live.com | 123456 | Nome é obrigatório.      |
            | luis |                | 123456 | Informe um email válido. |
            | luis | luis2@live.com |        | Informe uma senha.       |