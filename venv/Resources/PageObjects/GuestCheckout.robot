*** Settings ***
Documentation    This common file will cover all the common actions taken on the website
Library    SeleniumLibrary


*** Variables ***
${Cart_Summary} =   id=cfw-cart-summary
${email_address} =  id=billing_email
${customer_email_id} =  carlsolomon81@gmail.com
${Create_Account_Checkbox} =    id=createaccount
${Shipping_First_Name_Field} =  id=shipping_first_name
${Shipping_Surname_Field} =    id=shipping_last_name
${Shipping_Street_Address} =     id=shipping_address_1
${Shipping_Apartment_Number} =    id=shipping_address_2
${Shipping_Company_Name} =  id=shipping_company
${Shipping_Country} =   id=shipping_country
${Shipping_Pincode} =   id=shipping_postcode
${Shipping_State} =   id=shipping_state
${Shipping_City} =   id=shipping_city
${Shipping_Phone} =     id=shipping_phone




*** Test Cases ***
Guest Checkout
    [Documentation]    If user wants to complete purchase as guest then they uncheck the create account checkbox
    [Tags]    Reg
    Checkout Without Creating Account
    Enter Shipping Details





*** Keywords ***
Checkout Without Creating Account
    Wait Until Page Contains Element    ${Cart_Summary}
    Sleep    1s
    #Need to put in code to verify that the cart contains the right number of items
    Input Text  ${email_address}    ${customer_email_id}
    Sleep    2s
    Unselect Checkbox    ${Create_Account_Checkbox}
Enter Shipping Details
    Input Text    ${Shipping_First_Name_Field}                  Carl
    Input Text    ${Shipping_Surname_Field}                     Solomon
    Input Text    ${Shipping_Street_Address}                    3 Victoria Park Parade
    Input Text    ${Shipping_Apartment_Number}                  28
    Input Text    ${Shipping_Company_Name}                      Amazon
    List Selection Should Be    ${Shipping_Country}             Australia
    Input Text    ${Shipping_Pincode}                           2017
    List Selection Should Be    ${Shipping_State}               NSW
    Input Text    ${Shipping_City}                              Sydney
    Input Text    ${Shipping_Phone}                             0410348495


