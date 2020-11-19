*** Settings ***
Documentation    This will cover the one of purchase of single or multiple products
Library    SeleniumLibrary


*** Variables ***
${Payment_Button} =     class=cfw-primary-btn.cfw-next-tab.cfw-continue-to-payment-btn
${Payment_Method_Type} =    class=payment_method_title.cfw-radio-reveal-title
${Payment_Method_Type_Paypal} =     Paypal
${Stripe_CC_Frame} =       xpath=//*[@id="stripe-card-element"]/div/iframe
${Credit_Card_Number} =     xpath=//*[@id="root"]/form/span[2]/div/div[2]/span/input
${Stripe_Exp_Frame} =       xpath=//*[@id="stripe-exp-element"]/div/iframe
${Credit_Card_Expiry} =     xpath=//*[@id="root"]/form/span[2]/span/input
${Stripe_CVC_Frame} =       xpath=//*[@id="stripe-cvc-element"]/div/iframe
${Credit_Card_CVV} =        xpath=//*[@id="root"]/form/span[2]/span/input


*** Test Cases ***
Complete Payment Section
    [Documentation]    User can successfully choose payment type and enter relevant details
    [Tags]    Core
    Choose Payment Type
    Enter Credit Card Details



*** Keywords ***
Choose Payment Type
    Click Element    ${Payment_Button}
    Sleep    3s
    Select Radio Button    payment_method   stripe
    #Wait Until Page Contains Element    ${Credit_Card_Number}
    Sleep    3s
Enter Credit Card Details
    Select Frame    ${Stripe_CC_Frame}
    Input Text      ${Credit_Card_Number}   4242424242424242
    Unselect Frame
    Select Frame    ${Stripe_Exp_Frame}
    Input Text    ${Credit_Card_Expiry}     08/22
    Unselect Frame
    Select Frame    ${Stripe_CVC_Frame}
    Input Text    ${Credit_Card_CVV}    610
    Unselect Frame
    Sleep    2s

