*** Settings ***
Documentation    This will cover the one of purchase of single or multiple products
Library    SeleniumLibrary  Excellib



*** Variables ***
${Start_URL} =    https://thebutchersdog.oxdigital.com.au
${Browser} =    firefox
${Confirmed_Order_Continue_Shopping} =      xpath=/html/body/main/div/div[1]/div[2]/a



*** Test Cases ***


*** Keywords ***
Access TBD Home Page
    Open Browser    ${Start_URL}    ${Browser}
    Maximize Browser Window
    Sleep    3s
Continue Shopping
    Click Element    ${Confirmed_Order_Continue_Shopping}
    Sleep    2s
Close TBD website
    Close Browser
