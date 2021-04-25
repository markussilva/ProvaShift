**Settings**
Documentation   Acessar um site de compras,procurar por produtos,
...             adicionar ao carrinho, efetuar o login ou cadastro, confirmar o endereço,
...             termos, escolher forma de pagamento e visualizar a ordem. 

Resource                ../resources/actions.robot
Suite Setup             Open Session
Suite Teardown          Close Session 

***Test Cases***
Cenário 01: Realizando a compra de um produto
    Dado que eu tenha que acessar o site de compras
    ...    Compras.json
    E realizo a pesquisa por produdos 
    Quando realizo a inclusão do produto no carrinho
    Então devo finalizar a compra de um produto

Cenário 02: Comparar preços e gerar planilha excel
    