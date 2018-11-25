Feature: Cadastrar usuário.

    Scenario: Cadastrar usuário com sucesso.
        When eu cadastro um usuário
        Then eu verifico se o usuário foi cadastrado com sucesso.