*** Settings ***
Documentation    This common file will cover all the common actions taken on the website
Library    SeleniumLibrary  Excellib


*** Variables ***
${Start_URL} =    https://thebutchersdog.oxdigital.com.au
${Browser} =    firefox
${Home_Products_Menu} =  xpath=//*[@id="cus-nav"]
${Home_Product_Combo_Box} =  xpath=//*[@id="cus-show"]/div/a[1]/div[1]
${Combo_Boxes_Carnivore_Box} =  xpath=/html/body/section[5]/div/div[2]/div[3]/div/div/div/div/a
${Combo_Boxes_Carnivore_Box_Pincode} =    id=pincode_field_id
${Postcode} =   2017
${Combo_Boxes_Carnivore_Box_Check_My_Postcode} =    id=checkpin
${Combo_Boxes_Carnivore_Box_Add_To_Cart} =   class=single_add_to_cart_button
${Combo_Boxes_Carnivore_Box_Added_To_Cart} =    class=single_add_to_cart_button.button.alt.added
${Cart_Icon} =  class=woo_amc_container_wrap woo_amc_container_wrap_right
${Cart_Checkout} =  xpath=/html/body/div[10]/div/a/div/div[2]/div
${Cart_Header} =    class=woo_amc_head
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
${Payment_Button} =     class=cfw-primary-btn.cfw-next-tab.cfw-continue-to-payment-btn
${Payment_Method_Type} =    class=payment_method_title.cfw-radio-reveal-title
${Payment_Method_Type_Paypal} =     Paypal
${Stripe_CC_Frame} =       xpath=//*[@id="stripe-card-element"]/div/iframe
${Credit_Card_Number} =     xpath=//*[@id="root"]/form/span[2]/div/div[2]/span/input
${Stripe_Exp_Frame} =       xpath=//*[@id="stripe-exp-element"]/div/iframe
${Credit_Card_Expiry} =     xpath=//*[@id="root"]/form/span[2]/span/input
${Stripe_CVC_Frame} =       xpath=//*[@id="stripe-cvc-element"]/div/iframe
${Credit_Card_CVV} =        xpath=//*[@id="root"]/form/span[2]/span/input
${Order_Comments} =     id=order_comments
${Terms_Condtns_Checkbox} =     id=terms
${Complete_Order} =     xpath=/html/body/main/form/div[1]/div[3]/div[8]/div[2]/button
${Page_Footer} =        id=cfw-footer
${Confirmed_Order_Success_Tick} =       class=cfw-checkmark
${Confirmed_Order_Updates_Section} =    class=cfw-order-updates
${Confirmed_Order_Customer_Info_Section} =      class=cfw-customer-information
${Confirmed_Order_Continue_Shopping} =      xpath=/html/body/main/div/div[1]/div[2]/a



*** Test Cases ***
User can successfully complete purchase of a one off
    [Documentation]    One off purchase of single or multiple products
    [Tags]    Reg
    Access TBD Home Page
    Click on Product Menu
    Choose Product Type
    Add product to cart
    Checkout Product
    Enter Shipping Details
    Choose Payment Type
    Enter Credit Card Details
    Submit Final Order Details
    Verify Order Confirmation Page
    Continue Shopping
    Close TBD website





*** Keywords ***
Access TBD Home Page
    Open Browser    ${Start_URL}    ${Browser}
    Maximize Browser Window
    Sleep    3s
Click on Product Menu
    Click Element    ${Home_Products_Menu}
    Sleep    1s
Choose Product Type
    Click Element   ${Home_Product_Combo_Box}
    Sleep    2s
Add product to cart
    Click Element    ${Combo_Boxes_Carnivore_Box}
    Sleep    2s
    Input Text    ${Combo_Boxes_Carnivore_Box_Pincode}   ${Postcode}
    Sleep    1s
    Click Element    ${Combo_Boxes_Carnivore_Box_Check_My_Postcode}
    Sleep   1s
    Click Element    ${Combo_Boxes_Carnivore_Box_Add_To_Cart}
    Sleep    3s
    Wait Until Page Contains Element    ${Combo_Boxes_Carnivore_Box_Added_To_Cart}
    Sleep   1s
Checkout Product
    #Click Element   ${Cart_Icon}
    Wait Until Element Is Visible    ${Cart_Header}
    Sleep    2s
    Click Element   ${Cart_Checkout}
    Sleep   3s
Enter Shipping Details
    Wait Until Page Contains Element    ${Cart_Summary}
    Sleep    1s
    #Need to put in code to verify that the cart contains the right number of items
    Input Text  ${email_address}    ${customer_email_id}
    Sleep    2s
    Unselect Checkbox    ${Create_Account_Checkbox}
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
Submit Final Order Details
    Input Text    ${Order_Comments}     Testing For Combo Box
    Sleep    2s
    Select Checkbox    ${Terms_Condtns_Checkbox}
    Sleep    5s
    Click Element    ${Complete_Order}
    Sleep    5s
Verify Order Confirmation Page
    Wait Until Page Contains Element    ${Confirmed_Order_Continue_Shopping}    30s
    Element Should Be Visible    ${Confirmed_Order_Success_Tick}        Order Tick Confirmed
    Sleep    1s
    Element Should Be Visible    ${Confirmed_Order_Updates_Section}     Updates Section Confirmed
    Sleep    1s
    Element Should Be Visible    ${Confirmed_Order_Customer_Info_Section}   Customer Information Section Confirmed
    Sleep    1s
Continue Shopping
    Click Element    ${Confirmed_Order_Continue_Shopping}
    Sleep    2s
Close TBD website
    Close Browser


