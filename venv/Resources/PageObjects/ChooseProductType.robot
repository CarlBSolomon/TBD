*** Settings ***
Documentation    This common file will cover all the common actions taken on the website
Library    SeleniumLibrary  Excellib


*** Variables ***
${Home_Products_Menu} =  xpath=//*[@id="cus-nav"]
${Home_Product_Combo_Box} =  xpath=//*[@id="cus-show"]/div/a[1]/div[1]
${Home_Product_Build_A_Box} =   xpath=//*[@id="cus-show"]/div/a[2]/div[1]
${Home_Product_Treats} =    xpath=//*[@id="cus-show"]/div/a[3]/div[1]
${Home_Product_Apothecary} =    xpath=//*[@id="cus-show"]/div/a[4]/div[1]



*** Test Cases ***




*** Keywords ***
Click on Product Menu
    Click Element    ${Home_Products_Menu}
    Sleep    1s
Choose Combo Box
    Click Element   ${Home_Product_Combo_Box}
    Sleep    2s
Choose Build A Box
    Click Element   ${Home_Product_Build_A_Box}
    Sleep    2s
Choose Treats
    Click Element   ${Home_Product_Treats}
    Sleep    2s
Choose Apothecary
    Click Element   ${Home_Product_Apothecary}
    Sleep    2s

