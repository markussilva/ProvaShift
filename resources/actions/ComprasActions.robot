**Settings**
Documentation   Acessar um site de compras,procurar por produtos,
...             adicionar ao carrinho, efetuar o login ou cadastro, confirmar o endereço,
...             termos, escolher forma de pagamento e visualizar a ordem. 

Resource                ../Pages/BasePage.robot

**Keywords**
Dado que eu tenha que acessar o site de compras
    [Arguments]     ${json_string}
    BasePage.Carregando arquivo de dados  Compras/${json_string}
    helpers.Ir até a página     http://automationpractice.com/index.php

E realizo a pesquisa por produdos
    #Inserido produto que deve ser pesquisado
    helpers.Set Campo Input         id:search_query_top        ${acao_json['produto']}
    helpers.Clicar no Elemento      xpath://button[@name="submit_search"]
    #Clicando no produto para adicionar no carrinho
    # helpers.Clicar no Elemento      //img[contains(@title,'Faded Short Sleeve T-shirts')]
    helpers.Clicar no Link "//a[contains(@class,'product_img_link')]"
    #Verificando se a produto no retorno da pesquisa
    helpers.Verificar se o Elemento está visível  //*[contains(@itemprop,'name')]

Quando realizo a inclusão do produto no carrinho
    #Adicionando o produto no carrinho
    select frame                    //*[@class="fancybox-iframe"]
    helpers.Clicar no Elemento     //span[text()="Add to cart"]/ancestor::button    
    unselect frame
    #Prosseguindo com o produto selecionado
    helpers.Clicar no Elemento       //a[contains(@title,'Proceed to checkout')]/span
    #Verificando se a produto no carrinho
    helpers.Verificar se o Elemento está visível  //span[contains(text(),'1 Product')]
    #Prosseguindo com o cadastro
    Scroll footer da pagina
    helpers.Clicar no Elemento       //a[contains(@class,'button btn btn-default standard-checkout button-medium')]/span

Então devo finalizar a compra de um produto
    #Verificando se acessou a guia Sign in
    helpers.Verificar se o Elemento está visível  //*[contains(@class,'step_current second')]
    #E Faço o login para realizar a compra
    BasePage.Sessão de login
    # Verificar Login
    helpers.Verificar se o Elemento está visível  //span[text()="${acao_json['usuario']}"] 
    #Confirma endereço
    helpers.Verificar se o Elemento está visível  //h3[contains(text(),'Your delivery address')]
    helpers.Verificar se o Elemento está visível  //*[@id="address_delivery"]/li[contains(text(),'Street 01, Box 23, Tester ')]
    helpers.Clicar no Botão  //*[contains(@name,'processAddress')]  
    #Aba de Envio
    Select Checkbox     //input[contains(@id,'cgv')]
    #Aba Pagamento
    helpers.Clicar no Elemento       //button[contains(@class,'button btn btn-default standard-checkout button-medium')]
    helpers.Clicar no Elemento       //a[contains(@class,'bankwire')]
    Get Text                        //*[contains(@class,'box cheque-box')] 
    helpers.Impressão Text          // tests.txt
