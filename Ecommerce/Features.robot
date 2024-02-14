*** Settings ***
Resource         ResourceBDD.robot    
Resource         BDDpt-br.robot    
Suite Teardown   Fechar Navegador

*** Test Cases ***
Cenário 01: Login com sucesso
    Dado que esteja deslogado do sistema
    Quando preencher usuario e senha com dados corretos
    Então ResourceBDD.Então Devo Ser Direcionado Para Área Logada Com Sucesso


Cenário 02: Login com senha inválida
    Dado que esteja deslogado do sistema
    Quando ResourceBDD.Quando Preencher Usuario Corretamente E Senha Invalida
    Então o sistema deve retornar a mensagem Authentication failed

Cenário 03: Compra realizada com sucesso
    Dado que esteja na tela inicial do sistema
    Quando ResourceBDD.Quando realizar o fluxo de compra até o final
    Então devo ver uma mensagem de compra com sucesso
