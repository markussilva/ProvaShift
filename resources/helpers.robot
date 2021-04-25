***Settings***
Documentation   Palavras chave para facilitar a utilização e a clareza do código.

**Variables**
${Espera_Global}        10s

**Keywords**
Ir até a página 
    [Documentation]     Keyword criada pra ir até a página indicada.
    [Arguments]         ${Link}
    Go to   ${Link}

##  GET
Retorna arquivo em Json
    [Documentation]     Função responsável por transformar uma string json em um objeto.

    [Arguments]     ${json_file}

    ${string_file}=       Get File    ${EXECDIR}/resources/fixtures/${json_file}
    ${jsob_object}=       Evaluate    json.loads($string_file)     json

    [Return]    ${jsob_object}    

Set Campo Input
    [Documentation]     Função reponsável por colocar valor no campo tipo input

    [Arguments]     ${CAMPO_INPUT}      ${CAMPO_VALOR}

    sleep  0.5s 
    Wait Until Page Contains Element    ${CAMPO_INPUT}
    Wait Until Element Is Visible       ${CAMPO_INPUT} 
    Set Focus To Element                ${CAMPO_INPUT} 
    Input Text      ${CAMPO_INPUT}      ${CAMPO_VALOR}      
    # para disparar os campos com isvalid
    Press Keys      ${CAMPO_INPUT}      TAB    

Verificar se o Elemento está visível
    [Documentation]     Keyword criada pra verificar se um elemento está visível
    [Arguments]         ${Elemento}
    Wait Until Element Is Visible   ${Elemento}     ${Espera_Global}    'Elemento ${Elemento} não está visível'    

Clicar no Elemento
    [Documentation]     Keyword criada pra clicar em um elemento.
    [Arguments]         ${Elemento}
    Wait Until Element Is Visible   ${Elemento}     ${Espera_Global}    'Elemento ${Elemento} não encontrado na página'
    Click Element    ${Elemento}    

Clicar no Botão
    [Documentation]     Keyword criada pra clicar em um botão.
    [Arguments]         ${Elemento}
    Wait Until Element Is Visible   ${Elemento}     ${Espera_Global}    'Botão ${Elemento} não encontrado na página'
    Click Button    ${Elemento}    

Scroll footer da pagina
    Execute JavaScript    window.scrollTo(2000,2000)    

Inserir texto no Campo
    [Documentation]     Keyword criada pra inserir texto em um campo.
    [Arguments]         ${Campo}    ${Texto}
    Wait Until Element Is Visible   ${Campo}     ${Espera_Global}    'Campo ${Campo} não encontrado na página'
    Input Text      ${Campo}     ${Texto}

Inserir Senha
    [Documentation]     Keyword criada pra inserir uma senha.
    [Arguments]         ${Campo}    ${Texto}
    Wait Until Element Is Visible   ${Campo}     ${Espera_Global}    'Campo ${Campo} não encontrado na página'
    Input PassWord      ${Campo}    ${Texto}        

Clicar Campo Checkbox
    [Documentation]     Função reponsável por preencher valor em um campo checkbox

    [Arguments]     ${CAMPO_INPUT}
    Wait Until Keyword Succeeds         1 min   2s  Wait Until Element Is Visible       ${CAMPO_INPUT}  
    Wait Until Keyword Succeeds         1 min   2s  Select Checkbox                     ${CAMPO_INPUT}      

Clicar no Link "${LINK}"
    [Documentation]     Função utilizada para clicar em um link

    Wait Until Keyword Succeeds        
    ...    30s   1s  Click Link     ${LINK}

Impressão Text
    [Arguments]       ${nomearuivo}      

    ${text}=    Get Text    //*[contains(@class,'box cheque-box')]

    Create File       ${EXECDIR}/${nomearquivo}
