@echo off
echo Inserindo categorias...

REM Criar categoria Mercearia
curl -X POST "http://localhost:8080/api/categorias" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Mercearia\", \"descricao\": \"Produtos basicos de mercearia\", \"status\": \"ATIVA\"}"

REM Criar categoria Hortifruti
curl -X POST "http://localhost:8080/api/categorias" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Hortifruti\", \"descricao\": \"Frutas, legumes e verduras\", \"status\": \"ATIVA\"}"

REM Criar categoria Bebidas
curl -X POST "http://localhost:8080/api/categorias" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Bebidas\", \"descricao\": \"Bebidas em geral\", \"status\": \"ATIVA\"}"

REM Criar categoria Carnes
curl -X POST "http://localhost:8080/api/categorias" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Carnes\", \"descricao\": \"Carnes, aves e peixes\", \"status\": \"ATIVA\"}"

REM Criar categoria Laticínios
curl -X POST "http://localhost:8080/api/categorias" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Laticinios\", \"descricao\": \"Leite e derivados\", \"status\": \"ATIVA\"}"

echo.
echo Categorias criadas! Agora inserindo alguns produtos de exemplo...
echo.

REM Inserir alguns produtos de exemplo (assumindo categoria ID 1 = Mercearia)
curl -X POST "http://localhost:8080/api/produtos" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Arroz Integral Uncle Ben's\", \"descricao\": \"Arroz integral tipo 1, pacote 1kg\", \"preco\": 9.99, \"quantidadeEstoque\": 100, \"categoriaId\": 1, \"codigoBarras\": \"7891234567890\", \"status\": \"ATIVO\"}"

curl -X POST "http://localhost:8080/api/produtos" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Feijao Preto Camil\", \"descricao\": \"Feijao preto tipo 1, pacote 1kg\", \"preco\": 7.50, \"quantidadeEstoque\": 80, \"categoriaId\": 1, \"codigoBarras\": \"7891234567891\", \"status\": \"ATIVO\"}"

curl -X POST "http://localhost:8080/api/produtos" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Acucar Cristal Uniao\", \"descricao\": \"Acucar cristal especial, pacote 1kg\", \"preco\": 4.99, \"quantidadeEstoque\": 120, \"categoriaId\": 1, \"codigoBarras\": \"7891234567892\", \"status\": \"ATIVO\"}"

REM Inserir produtos de Hortifruti (assumindo categoria ID 2)
curl -X POST "http://localhost:8080/api/produtos" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Banana Prata\", \"descricao\": \"Banana prata fresca, kg\", \"preco\": 4.99, \"quantidadeEstoque\": 50, \"categoriaId\": 2, \"codigoBarras\": \"7891234567810\", \"status\": \"ATIVO\"}"

curl -X POST "http://localhost:8080/api/produtos" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Maca Gala\", \"descricao\": \"Maca gala nacional, kg\", \"preco\": 7.99, \"quantidadeEstoque\": 40, \"categoriaId\": 2, \"codigoBarras\": \"7891234567811\", \"status\": \"ATIVO\"}"

REM Inserir produtos de Bebidas (assumindo categoria ID 3)
curl -X POST "http://localhost:8080/api/produtos" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Coca-Cola 2L\", \"descricao\": \"Refrigerante Coca-Cola, garrafa 2L\", \"preco\": 7.99, \"quantidadeEstoque\": 80, \"categoriaId\": 3, \"codigoBarras\": \"7891234567830\", \"status\": \"ATIVO\"}"

curl -X POST "http://localhost:8080/api/produtos" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Agua Mineral Crystal 1,5L\", \"descricao\": \"Agua mineral sem gas, garrafa 1,5L\", \"preco\": 2.99, \"quantidadeEstoque\": 120, \"categoriaId\": 3, \"codigoBarras\": \"7891234567835\", \"status\": \"ATIVO\"}"

REM Inserir produtos de Carnes (assumindo categoria ID 4)
curl -X POST "http://localhost:8080/api/produtos" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Picanha Bovina\", \"descricao\": \"Picanha bovina premium, kg\", \"preco\": 59.99, \"quantidadeEstoque\": 20, \"categoriaId\": 4, \"codigoBarras\": \"7891234567850\", \"status\": \"ATIVO\"}"

curl -X POST "http://localhost:8080/api/produtos" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Frango Inteiro\", \"descricao\": \"Frango inteiro congelado, kg\", \"preco\": 8.99, \"quantidadeEstoque\": 50, \"categoriaId\": 4, \"codigoBarras\": \"7891234567856\", \"status\": \"ATIVO\"}"

REM Inserir produtos de Laticínios (assumindo categoria ID 5)
curl -X POST "http://localhost:8080/api/produtos" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Leite Integral Parmalat 1L\", \"descricao\": \"Leite UHT integral, caixa 1L\", \"preco\": 4.99, \"quantidadeEstoque\": 100, \"categoriaId\": 5, \"codigoBarras\": \"7891234567870\", \"status\": \"ATIVO\"}"

curl -X POST "http://localhost:8080/api/produtos" ^
  -H "Content-Type: application/json" ^
  -d "{\"nome\": \"Queijo Mussarela Tirolez\", \"descricao\": \"Queijo mussarela fatiado, pacote 150g\", \"preco\": 8.99, \"quantidadeEstoque\": 60, \"categoriaId\": 5, \"codigoBarras\": \"7891234567872\", \"status\": \"ATIVO\"}"

echo.
echo Script concluido! Produtos inseridos com sucesso.
echo Acesse http://localhost:8080 para ver os produtos no sistema.
pause