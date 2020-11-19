*** Settings ***
Documentation    This common file will cover all the common actions taken on the website
Library    SeleniumLibrary


*** Variables ***
${Cart_Checkout} =  xpath=/html/body/div[10]/div/a/div/div[2]/div
${Cart_Header} =    class=woo_amc_head




*** Test Cases ***
Go To Cart
    [Documentation]    Checking Out once all products have been chosen
    [Tags]    Core
    Checkout Product






*** Keywords ***
Checkout Product
    Wait Until Element Is Visible    ${Cart_Header}
    Sleep    2s
    Click Element   ${Cart_Checkout}
    Sleep   3s


