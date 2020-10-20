#language: pt

Funcionalidade: Meu Perfil
    Para que eu possa manter meus dados atualizados
    Sendo um usuário
    Posso completar o meu cadastro do Perfil
        @perfil
        Esquema do Cenário: Atualizar Perfil

        Dado que esteja autenticado com "<email>" e "<senha>"
        E que esteja em Perfil                                  
        Quando completar o cadastro com "<empresa>" e "<cargo>"
        Então deverá ver a mensagem de atualização cadastral:
        """
        Perfil atualizado com sucesso.
        """

        Exemplos:
            | email             | senha      | empresa   | cargo      |
            |luis.hugo@live.com | 123456     | Yahoo     | Developer  |
            |joao@live.com      | 123456     | Google    | QA         |
            |maria@live.com     | 123456     | Microsoft | CEO        |
            |jose@live.com      | 123456     | Linkedin  | CTO        |
            |araujo@live.com    | 123456     | Facebook  | Estagiario |