*** Settings ***
Resource    demo_blaze_resources.robot
Test Setup    Abrir o navegador
#Test Teardown     Fechar o navegador


Library  SeleniumLibrary

*** Test Cases ***
Cenario: Criar conta
    Dado que estou na página inicial do Demoblaze
    Quando eu clico no botão de criar conta
    E eu preencho as informações de cadastro
    E eu clico no botão de criar conta
    Então eu devo ver a mensagem de confirmação de criação de conta


Cenario: Compra com 3 produtos no carrinho
    Dado que já criei a conta
    Quando eu adiciono 3 produtos ao carrinho
    E eu prosseguir para o checkout
    E eu preencho as informações de pagamento
    Então eu devo ver a mensagem de confirmação de compra

cenario: Adição e remoção de itens no carrinho
  Dado que tenho produtos visíveis para selecionar
  Quando eu adiciono um celular ao carrinho
  E eu adiciono um monitor ao carrinho
  E eu adiciono um computador ao carrinho
  E eu entro no carrinho
  E eu removo o monitor do carrinho
  E eu atualizo a página
  Então eu devo ver que o monitor foi removido do carrinho




