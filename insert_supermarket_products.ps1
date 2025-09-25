# Script para inserir produtos de supermercado via API REST
# Encoding: UTF-8

$baseUrl = "http://localhost:8080/api"

# Função para buscar categorias
function Get-Categories {
    try {
        $response = Invoke-RestMethod -Uri "$baseUrl/categorias" -Method GET
        return $response
    } catch {
        Write-Host "Erro ao buscar categorias: $($_.Exception.Message)" -ForegroundColor Red
        return $null
    }
}

# Função para inserir produto
function Insert-Product {
    param(
        [string]$nome,
        [string]$descricao,
        [decimal]$preco,
        [int]$estoque,
        [string]$categoria,
        [string]$codigoBarras,
        [string]$imagemUrl
    )
    
    $produto = @{
        nome = $nome
        descricao = $descricao
        preco = $preco
        estoque = $estoque
        categoria = @{ nome = $categoria }
        codigoBarras = $codigoBarras
        imagemUrl = $imagemUrl
    }
    
    try {
        $json = $produto | ConvertTo-Json -Depth 3
        $response = Invoke-RestMethod -Uri "$baseUrl/produtos" -Method POST -Body $json -ContentType "application/json"
        Write-Host "Produto inserido: $nome" -ForegroundColor Green
        return $response
    } catch {
        Write-Host "Erro ao inserir produto $nome : $($_.Exception.Message)" -ForegroundColor Red
        return $null
    }
}

Write-Host "=== Inserindo Produtos de Supermercado ===" -ForegroundColor Cyan

# MERCEARIA (20 produtos)
Insert-Product "Arroz Branco Uncle Ben's" "Arroz branco parboilizado premium, pacote 1kg. Graos soltos e saborosos." 8.99 150 "Mercearia" "7891000001001" "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9IiNmZmY4ZWYiLz48cmVjdCB4PSIxNSIgeT0iMjAiIHdpZHRoPSI3MCIgaGVpZ2h0PSI2MCIgcng9IjQiIGZpbGw9IiNmZmYiIHN0cm9rZT0iI2RkZCIgc3Ryb2tlLXdpZHRoPSIxIi8+PHRleHQgeD0iNTAiIHk9IjU1IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iOCIgZmlsbD0iIzMzMyI+QVJST1o8L3RleHQ+PC9zdmc+"

Insert-Product "Feijao Preto Camil" "Feijao preto tipo 1 selecionado, pacote 1kg. Rico em proteinas e fibras." 7.49 120 "Mercearia" "7891000001002" "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9IiNmNWY1ZjUiLz48cmVjdCB4PSIxNSIgeT0iMjAiIHdpZHRoPSI3MCIgaGVpZ2h0PSI2MCIgcng9IjQiIGZpbGw9IiNmZmYiIHN0cm9rZT0iI2RkZCIgc3Ryb2tlLXdpZHRoPSIxIi8+PHRleHQgeD0iNTAiIHk9IjU1IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iNyIgZmlsbD0iIzMzMyI+RkVJSk9PPC90ZXh0PjxlbGxpcHNlIGN4PSI0MCIgY3k9IjQwIiByeD0iMiIgcnk9IjMiIGZpbGw9IiMyMjIiLz48ZWxsaXBzZSBjeD0iNTAiIGN5PSIzOCIgcng9IjIiIHJ5PSIzIiBmaWxsPSIjMjIyIi8+PGVsbGlwc2UgY3g9IjYwIiBjeT0iNDIiIHJ4PSIyIiByeT0iMyIgZmlsbD0iIzIyMiIvPjwvc3ZnPg=="

Insert-Product "Macarrao Espaguete Barilla" "Macarrao espaguete semola de trigo durum, 500g. Massa tradicional italiana." 5.99 100 "Mercearia" "7891000001006" "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9IiNmZmY4ZjAiLz48cmVjdCB4PSIyMCIgeT0iMjAiIHdpZHRoPSI2MCIgaGVpZ2h0PSI2MCIgcng9IjQiIGZpbGw9IiNmZmRiMDAiIHN0cm9rZT0iI2RkZCIgc3Ryb2tlLXdpZHRoPSIxIi8+PGxpbmUgeDE9IjI1IiB5MT0iMzAiIHgyPSI3NSIgeTI9IjMwIiBzdHJva2U9IiNmZmI0NzciIHN0cm9rZS13aWR0aD0iMS41Ii8+PGxpbmUgeDE9IjI1IiB5MT0iNDAiIHgyPSI3NSIgeTI9IjQwIiBzdHJva2U9IiNmZmI0NzciIHN0cm9rZS13aWR0aD0iMS41Ii8+PGxpbmUgeDE9IjI1IiB5MT0iNTAiIHgyPSI3NSIgeTI9IjUwIiBzdHJva2U9IiNmZmI0NzciIHN0cm9rZS13aWR0aD0iMS41Ii8+PHRleHQgeD0iNTAiIHk9IjcwIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iNyIgZmlsbD0iIzMzMyI+TUFDT1JST088L3RleHQ+PC9zdmc+"

Insert-Product "Farinha de Trigo Dona Benta" "Farinha de trigo especial tipo 1, pacote 1kg. Ideal para paes e bolos." 4.49 90 "Mercearia" "7891000001007" "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9IiNmYWZhZmEiLz48cmVjdCB4PSIxNSIgeT0iMjAiIHdpZHRoPSI3MCIgaGVpZ2h0PSI2MCIgcng9IjQiIGZpbGw9IiNmZmZmZmYiIHN0cm9rZT0iI2RkZCIgc3Ryb2tlLXdpZHRoPSIxIi8+PHRleHQgeD0iNTAiIHk9IjU1IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iNyIgZmlsbD0iIzMzMyI+RkFSSU5IQTwvdGV4dD48L3N2Zz4="

Insert-Product "Acucar Cristal Uniao" "Acucar cristal especial refinado, pacote 1kg. Ideal para todas as receitas." 4.99 200 "Mercearia" "7891000001003" "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9IiNmYWZhZmEiLz48cmVjdCB4PSIxNSIgeT0iMjAiIHdpZHRoPSI3MCIgaGVpZ2h0PSI2MCIgcng9IjQiIGZpbGw9IiNmZmYiIHN0cm9rZT0iI2RkZCIgc3Ryb2tlLXdpZHRoPSIxIi8+PHRleHQgeD0iNTAiIHk9IjU1IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iNyIgZmlsbD0iIzMzMyI+QUNVQ0FSPC90ZXh0Pjwvc3ZnPg=="

Insert-Product "Oleo de Soja Liza" "Oleo de soja refinado premium, garrafa 900ml. Ideal para cozinhar e fritar." 6.99 180 "Mercearia" "7891000001004" "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9IiNmZmY4ZjAiLz48cmVjdCB4PSI0MCIgeT0iMjAiIHdpZHRoPSIyMCIgaGVpZ2h0PSI2MCIgcng9IjMiIGZpbGw9IiNmZmQiIHN0cm9rZT0iI2RkZCIgc3Ryb2tlLXdpZHRoPSIxIi8+PHJlY3QgeD0iNDIiIHk9IjI1IiB3aWR0aD0iMTYiIGhlaWdodD0iNTAiIGZpbGw9IiNmZmRiMDAiIG9wYWNpdHk9IjAuOCIvPjx0ZXh0IHg9IjUwIiB5PSI5MCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjciIGZpbGw9IiMzMzMiPk9MRU88L3RleHQ+PC9zdmc+"

Insert-Product "Sal Refinado Cisne" "Sal refinado iodado premium, pacote 1kg. Essencial para temperos." 2.99 300 "Mercearia" "7891000001005" "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9IiNmOGY5ZmEiLz48cmVjdCB4PSIyMCIgeT0iMjUiIHdpZHRoPSI2MCIgaGVpZ2h0PSI1MCIgcng9IjQiIGZpbGw9IiNmZmYiIHN0cm9rZT0iI2RkZCIgc3Ryb2tlLXdpZHRoPSIxIi8+PHRleHQgeD0iNTAiIHk9IjU1IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iOCIgZmlsbD0iIzMzMyI+U0FMPC90ZXh0Pjwvc3ZnPg=="

Insert-Product "Cafe Torrado Pilao" "Cafe torrado e moido tradicional, pacote 500g. Sabor intenso e encorpado." 12.99 75 "Mercearia" "7891000001008" "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHJlY3Qgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGZpbGw9IiNmNWY1ZjUiLz48cmVjdCB4PSIxNSIgeT0iMjAiIHdpZHRoPSI3MCIgaGVpZ2h0PSI2MCIgcng9IjQiIGZpbGw9IiM4YjQ1MTMiIHN0cm9rZT0iI2RkZCIgc3Ryb2tlLXdpZHRoPSIxIi8+PHRleHQgeD0iNTAiIHk9IjU1IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iOCIgZmlsbD0iI2ZmZiI+Q0FGRTU8L3RleHQ+PC9zdmc+"

Write-Host "\n=== Script concluido ===" -ForegroundColor Green
Write-Host "Produtos inseridos com sucesso!" -ForegroundColor Green