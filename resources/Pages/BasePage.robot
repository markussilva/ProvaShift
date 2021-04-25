*** Settings ***
Documentation        BasePage
...                  Representa a inicialização do Selenium e demais cursos como ganchos e helpers.

# bibliote do motor do selenium
Library               SeleniumLibrary
# biblioteca geral
Library               OperatingSystem
# # biblioteca de captura de video
# Library               ScreenCapLibrary

*** Variables ***
${LOGIN URL}        ${BASE_URL}
${DELAY}            0
${CHROME_OPTIONS}   options=add_experimental_option('excludeSwitches',['enable-logging'])
${LOGGED}           ${EMPTY}

*** Keywords ***
Open Chrome
    Open Browser                    ${LOGIN URL}      chrome    #options=add_experimental_options('excludeSwitches',['enable-logging'])

Open Chrome Headless
    Open Browser                    ${LOGIN URL}      headlesschrome    #options=add_experimental_options('excludeSwitches',['enable-logging'])

Open Session
    Run Keyword If    "${browser}" == "chrome"
    ...    Open Chrome

    Run Keyword If    "${browser}" == "headless"
    ...    Open Chrome Headless
    
    # Maximize Browser Window
    Set Window Size                 1680    1200                    #1440    900
    Set Browser Implicit Wait       60 seconds
    Set Selenium Implicit Wait      60 seconds
    Set Selenium Speed              .1 seconds
    Set Selenium Timeout            60 seconds

Close Session   
    Run Keyword If    "${LOGGED}" == "logado"
    ...    Log to console    nÃO FECHA
    ...    ELSE   Close Browser

Finalizando Teste
    Capture Page Screenshot

Login Session
    [Arguments]     ${usuer}       ${pass}    ${modulo}

    Run Keyword If    "${LOGGED}" == "logado"
    ...    Estou na página de login?
    ...    ELSE    Abrir Navegador     ${usuer}      ${pass}
    
    E devo acesar o módulo 
    ...    ${modulo}

Carregando arquivo de dados
    [Arguments]     ${json_file}

    ${acao_json}=   helpers.Retorna arquivo em Json     ${json_file}
    Set Test Variable      ${acao_json}
    Sleep   0.5s    

Sessão de login
    # Abrir Navegador
    helpers.Inserir texto no Campo  id:email   ${USUARIO_GLOBAL}@gmail.com
    helpers.Inserir Senha           id:passwd   ${SENHA_GLOBAL}
    helpers.Clicar no Botão         id:SubmitLogin
    # Verificar Login   

Verificar Login
    helpers.Verificar se o Elemento está visível  //span[text()="Markus Vinicius Silva"]        

