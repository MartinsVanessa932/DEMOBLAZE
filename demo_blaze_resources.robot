*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.demoblaze.com
${SIGNIN_UP}    signin2
*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Dado que estou na página inicial do Demoblaze
    Go To    url=${URL}


Quando eu clico no botão de criar conta
    Click Element    css:#signin2
    Wait Until Page Contains    sign-username    timeout=30s
    
E eu preencho as informações de cadastro
  Input Text  xpath://input[@id='sign-username']  automacao2024P
  Input Text  xpath://input[@id='sign-password']  sucessosenha24

E eu clico no botão de criar conta
    Click Button    css:button[onclick='register()']
    Wait Until Page Contains    Sign up successful.    timeout=30s

Então eu devo ver a mensagem de confirmação de criação de conta
    Page Should Contain    Sign up successful.

Dado que já criei a conta
    Go To    ${URL}
    Wait Until Element Is Visible    css:#signin2    timeout=60s

Quando eu adiciono 3 produtos ao carrinho
    Click Link    Samsung galaxy s6
    Wait Until Page Contains    Add to cart    timeout=10s
    Click Button    css:button[onclick*='add-to-cart']    # Atualizar o localizador conforme necessário
    Wait Until Page Contains    Product added    timeout=10s
    Click Link    Nokia lumia 1520
    Click Button    css:button[onclick*='add-to-cart']
    Click Link    Iphone 6 32gb
    Click Button    css:button[onclick*='add-to-cart']

E eu prosseguir para o checkout
    Click Link    Cart
    Wait Until Page Contains    3    timeout=10s

E eu preencho as informações de pagamento
    Click Button    css:button[onclick='placeOrder()']
    Wait Until Page Contains    Card Number    timeout=10s
    Input Text    name:cardNumber    1234567890123456
    Input Text    name:cardExpiration    12/25
    Input Text    name:cardCVC    123

Então eu devo ver a mensagem de confirmação de compra
    Click Button    css:button[onclick='purchase()']
    Wait Until Page Contains    Thank you for your purchase!    timeout=10s
    Close Browser

Dado que tenho produtos visíveis para selecionar
    Go To    ${URL}
    Wait Until Element Is Visible    css:#signin2    timeout=60s

Quando eu adiciono um celular ao carrinho
    Click Link    Samsung galaxy s6
    Click Button    css:button[onclick*='add-to-cart']
    Wait Until Page Contains    Product added    timeout=10s

E eu adiciono um monitor ao carrinho
    Click Link    Apple monitor 24
    Click Button    css:button[onclick*='add-to-cart']
    Wait Until Page Contains    Product added    timeout=10s

E eu adiciono um computador ao carrinho
    Click Link    Dell i7 8gb
    Click Button    css:button[onclick*='add-to-cart']
    Wait Until Page Contains    Product added    timeout=10s

E eu entro no carrinho
    Click Link    Cart
    Wait Until Page Contains    3    timeout=10s

E eu removo o monitor do carrinho
    Click Button    css:a[onclick*='delete']    # Atualizar o localizador conforme necessário
    Wait Until Page Does Not Contain    Apple monitor 24    timeout=10s

E eu atualizo a página
    Reload Page

Então eu devo ver que o monitor foi removido do carrinho
    Page Should Not Contain    Apple monitor 24
    Close Browser
