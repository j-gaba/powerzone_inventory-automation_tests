*** Settings ***
Documentation   Robot file belonging to the Delivery Access Suite with test cases
...             for accessing delivery features for the Transaction Cashier Role
...
...             This set of tests was created using keywords from the SeleniumLibrary
Resource        resource.robot

*** Test Cases ***
[Transaction Cashier] Viewing Delivery Information
    Open Deliveries Page as Transaction Cashier

    # click on more info to access extra details
    Click Element   xpath=${FIRST DELIVERY PATH}

    # should be in the page containing detailed information on the first delivery
    More Info On Deliveries Page Should Be Open

    # close browser
    [Teardown]    Close Browser

[Transaction Cashier] Inputted Correct Delivery Details - Add
    Open Add Transactions Page as Transaction Cashier
    Input Name    UnliLiver
    Input Number  09242214256
    Input Date    16    09    2021
    Input Quantity    ${VALID GASOLINE}   ${VALID P95}    ${VALID DIESEL}   ${VALID P97}    ${VALID KEROSENE}
    Wait Until Element Is Enabled   confirm-add-transaction-btn
    Element Should Be Enabled   confirm-add-transaction-btn
    Confirm Transaction

    Transactions Page Should Be Open
    Wait Until Ajax Complete
    
    Go to Home

    Click Image   ${DELIVERIES BUTTON}
    Deliveries Page Should Be Open
    Wait Until Ajax Complete

    Page Should Contain   UnliLiver

    [Teardown]    Close Browser

[Transaction Cashier] Inputted Correct Delivery Details - Edit
    Edit First Delivery As Transaction Cashier
    Input Name Edit   Perly Shell
    Input Number Edit   09175548663
    Input Date Edit   19   03    2022
    Input Warehouse Edit    Somewhere 560, Ina St.
    Input Drop-Off Edit  In AnotherLife St.
    Input Delivery Manager Edit  Mr. DM
    Input Driver Edit  Dabus Drib Err
    Wait Until Element Is Enabled   confirm-edit-delivery-btn
    Element Should Be Enabled   confirm-edit-delivery-btn
    Confirm Delivery Edit

    Deliveries Page Should Be Open
    Wait Until Ajax Complete

    Page Should Contain   03/19/2022
    Page Should Contain   Perly Shell
    Page Should Contain   In AnotherLife St.

    [Teardown]    Close Browser

[Transaction Cashier] Phone Number is not 10 digits - Edit
    Edit First Delivery As Transaction Cashier
    Input Name Edit   Palshell
    Input Number Edit   21
    Input Date Edit   15   03    2022
    Input Warehouse Edit    Somewhere 560, Ina St.
    Input Drop-Off Edit  In AnotherLife St.
    Input Delivery Manager Edit  Mr. DM
    Input Driver Edit  Dabus Drib Err
    Page Should Contain   Invalid phone number (should have 7 to 15 digits) 
    [Teardown]    Close Browser

[Transaction Cashier] User attempts to input incorrect data - Edit
    Edit First Delivery As Transaction Cashier
    Input Name Edit   Petshell
    Input Number Edit   abc
    Input Date Edit   de   fg    hijk
    Input Warehouse Edit    Somewhere 560, Ina St.
    Input Drop-Off Edit  In AnotherLife St.
    Input Delivery Manager Edit  Mr. DM
    Input Driver Edit  Dabus Drib Err
    Check Fields For Content Edit
    [Teardown]    Close Browser