*** Settings ***
Library     SeleniumLibrary
Library     Dialogs


*** Variables ***
${BROWSER}                  firefox
${URL}                      http://www.automationpractice.pl/index.php
${CABEÇALHO}                css=[src="http://www.automationpractice.pl/img/logo.jpg"]
${BOTAO_SIGN_IN}            css=[title="Log in to your customer account"]
${CAMPO_EMAIL}              css=#email
${CAMPO_SENHA}              css=#passwd
${PREENCHER_EMAIL}          desafio@mailinator.com
${PREENCHER_SENHA}          desafio2024
${BOTAO_LOGAR}              xpath=.//*[@id="SubmitLogin"]/span/i
${URL_AREA_LOGADA}          http://www.automationpractice.pl/index.php?controller=my-account
${URL_AREA_DESLOGADA}       http://www.automationpractice.pl/index.php?controller=authentication
${SENHA_INVALIDA}           SENHAerrada
${CAMPO_PESQUISA}           id=search_query_top
${LUPA}                     css=button[class="btn btn-default button-search"]
${OPCAO_EXIBIDA}            css=#center_column > ul > li > div > div.left-block
${COR_CAMISA}               id=color_14
${PLUS_BUTTON}              css:.button-plus > span
${PLUS_MINUS}               css=.button-minus > span
${ADD_AO_CARRINHO}          xpath=.//*[@id="add_to_cart"]/button/span
${SEGUIR_TO_CKT_SUM}        xpath=.//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
${URL_ORDER}                http://www.automationpractice.pl/index.php?controller=order
${TO_CHECKOUT_SIGN}         xpath=.//*[@id="center_column"]/p[2]/a[1]
${TO_CHECkOUT_ADDRESS}      css=#center_column > form > p > button
${AGREE_TERMS}              id:cgv
${TO_CHECkOUT_SHIPPING}     css=#form > p > button
${PAY_BY_BANK}              xpath=.//*[@id="HOOK_PAYMENT"]/div[1]/div/p/a
${URL_PAYMENT}              http://www.automationpractice.pl/index.php?fc=module&module=bankwire&controller=payment
${BTN_CONFIRM_ORDER}        css=#cart_navigation > button
${MSG_ALERTA_SUCCESFUL}     css=#center_column > p.alert.alert-success


*** Keywords ***
#### DADO
Dado que esteja deslogado do sistema
    Acessar pagina automationpractice

Dado que esteja na tela inicial do sistema
    Acessar pagina automationpractice
    Realizar login com sucesso

#### QUANDO

Quando preencher usuario e senha com dados corretos
    Realizar login com sucesso

Quando preencher usuario corretamente e senha invalida
    Realizar login com senha invalida

 Quando realizar o fluxo de compra até o final
    Segue o fluxo de compra a partir da pesquisa por um produto

#### ENTÃO

Então devo ser direcionado para área logada com sucesso
    Verificar o login com sucesso

Então o sistema deve retornar a mensagem Authentication failed
    Verificar o login sem sucesso

Então devo ver uma mensagem de compra com sucesso
    Confirma a compra efetuada com sucesso

#### PASSOS

Acessar pagina automationpractice
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    ${CABEÇALHO}

Realizar login com sucesso
    Click Element    ${BOTAO_SIGN_IN}
    Input Text    ${CAMPO_EMAIL}    ${PREENCHER_EMAIL}
    Input Text    ${CAMPO_SENHA}    ${PREENCHER_SENHA}
    Click Element    ${BOTAO_LOGAR}

Realizar login com senha invalida
    Click Element    ${BOTAO_SIGN_IN}
    Input Text    ${CAMPO_EMAIL}    ${PREENCHER_EMAIL}
    Input Text    ${CAMPO_SENHA}    ${SENHA_INVALIDA}
    Click Element    ${BOTAO_LOGAR}
    ${error_message} =    Execute JavaScript
    ...    return document.querySelector('#center_column > div > ol > li').innerText
    Should Contain    ${error_message}    Authentication failed

Verificar o login com sucesso
    Location Should Be    ${URL_AREA_LOGADA}

Verificar o login sem sucesso
    Location Should Be    ${URL_AREA_DESLOGADA}

Segue o fluxo de compra a partir da pesquisa por um produto
    Click Element    ${CAMPO_PESQUISA}
    Input Text    ${CAMPO_PESQUISA}    T-shirt
    Click Element    ${LUPA}
    Click Element    ${OPCAO_EXIBIDA}
    Wait Until Element Is Visible    ${COR_CAMISA}
    Click Element    id=color_13
    Click Element    ${COR_CAMISA}
    Wait Until Element Is Visible    ${PLUS_BUTTON}
    #Pause Execution    deixa
    Click Element    ${PLUS_BUTTON}
    Click Element    ${PLUS_MINUS}
    Click Element    ${ADD_AO_CARRINHO}
    Wait Until Element Is Visible    ${SEGUIR_TO_CKT_SUM}
    #Pause Execution    seguir checkout

    Click Element    ${SEGUIR_TO_CKT_SUM}
    Location Should Be    ${URL_ORDER}
    Wait Until Element Is Visible    ${TO_CHECKOUT_SIGN}
    Click Element    ${TO_CHECKOUT_SIGN}
    Click Element    ${TO_CHECkOUT_ADDRESS}
    #Pause Execution    aceita termo
    Wait Until Element Is Enabled    ${AGREE_TERMS}
    Select Checkbox    ${AGREE_TERMS}
    Click Element    ${TO_CHECkOUT_SHIPPING}
    Wait Until Element Is Visible    ${PAY_BY_BANK}
    Click Element    ${PAY_BY_BANK}
    Location Should Be    ${URL_PAYMENT}
    Wait Until Element Is Visible    ${BTN_CONFIRM_ORDER}
    Click Element    ${BTN_CONFIRM_ORDER}

Confirma a compra efetuada com sucesso
    Wait Until Element Is Visible    ${MSG_ALERTA_SUCCESFUL}

Fechar Navegador
    Close Browser
