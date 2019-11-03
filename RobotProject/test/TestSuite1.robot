*** Settings ***
Library    SeleniumLibrary    



*** Variable ***
${url}    http://google.com
${browser}    firefox
${email}    moses.adelere@gmail.com
${password}    helper83-
# list example
@{Credential}    ${email}    ${password}
# dictionary example
&{LogInData}    username=${email}    password=${password}

*** Keyword ***
Greetings
    Log To Console    Starting test
    Log    Hello Moses
    Log    Welcome to robot framework
    
GoToHomePage
    Open Browser    http://opencart.com    ${browser}

LogInKeys
    Input Text    name=email    @{Credential}[0]
    Input Password    name=password    &{LogInData}[password]
    Submit Form    
    
Authenticate
    Input Text    id=input-pin    0445
    Submit Form    


*** Test Cases ***
MyFirstTest
    Greetings
    

Simple Web Test
    Open Browser    ${url}    ${browser}
    Set Browser Implicit Wait    5
    Input Text    name=q    Automation step by step
    Press Keys    name=q    ENTER    
    Sleep    5
    #Click Button    name=btnk    
    Close Browser
    Log    Test Completed    
    

Simple Web Login
    [Documentation]    This is a sample
    Log    Test Starting......
    GoToHomePage
    Set Browser Implicit Wait    5
    Click Link    link=Login    
    LogInKeys
    Authenticate 
    Click Element    link=Marketplace               
    Sleep    5    
    Close Browser  
    Log    Test Completed    
    Log    This test was performed by %{username} on %{os}  



    