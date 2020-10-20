#language:pt
Funcionalidade: Fazer login no sistema
    Validar o sistema de login
    Contexto: Home
        Dado que esteja na Home

    @sprint1 @logout
    Cenário: Usúario autenticado

        Quando fazer o login com "luis.hugo@live.com" e senha "123456"
        Então deverá ver a mensagem de boas vindas "Olá, hugo"

    Esquema do Cenário: Tentativa de Login 

        Quando fazer o login com "<email>" e senha "<senha>"
        Então deverá ver a mensagem de alerta "<saida>"

            Exemplos:
            | email                  | senha   | saida                       |
            | luis.hugo@live.com     | 125asd  | Senha inválida.             |
            | luis.hugo@live.com.net | xpta123 | Usuário não cadastrado.     |
            | luis.hugolive.com      | xpta123 | Email incorreto ou ausente. |
            | luis.hugo@live.com     |         | Senha ausente.              |