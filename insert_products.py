import requests
import json
import time
import uuid

# URL base da API
base_url = "http://localhost:8080/api"
API_URL = base_url

# Primeiro, vamos criar as categorias
categorias = [
    {"nome": "Mercearia", "descricao": "Produtos básicos de mercearia", "status": "ATIVA"},
    {"nome": "Hortifruti", "descricao": "Frutas, legumes e verduras", "status": "ATIVA"},
    {"nome": "Bebidas", "descricao": "Bebidas em geral", "status": "ATIVA"},
    {"nome": "Carnes", "descricao": "Carnes, aves e peixes", "status": "ATIVA"},
    {"nome": "Laticínios", "descricao": "Leite e derivados", "status": "ATIVA"}
]

# Verificar se a API está disponível
def verificar_api():
    try:
        response = requests.get(f"{base_url}/categorias")
        if response.status_code == 200:
            print("API está disponível!")
            return True
        else:
            print(f"API retornou status code: {response.status_code}")
            return False
    except Exception as e:
        print(f"Erro ao conectar com a API: {e}")
        return False

# Esperar até que a API esteja disponível
def esperar_api():
    tentativas = 0
    while tentativas < 10:
        if verificar_api():
            return True
        print("Aguardando API ficar disponível...")
        time.sleep(3)
        tentativas += 1
    return False

# Garantir que a API está disponível antes de continuar
if not esperar_api():
    print("API não disponível após várias tentativas. Encerrando script.")
    exit(1)

# Função para limpar produtos existentes
def limpar_produtos():
    try:
        response = requests.delete(f"{base_url}/produtos/limpar")
        if response.status_code == 200:
            print("Produtos existentes foram removidos com sucesso!")
        else:
            print(f"Falha ao limpar produtos: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"Erro ao limpar produtos: {e}")

# Função para obter categorias existentes
def obter_categorias():
    categoria_ids = {}
    try:
        response = requests.get(f"{base_url}/categorias")
        if response.status_code == 200:
            categorias_existentes = response.json()
            for categoria in categorias_existentes:
                categoria_ids[categoria["nome"]] = categoria["id"]
                print(f"Categoria '{categoria['nome']}' encontrada com ID: {categoria['id']}")
        else:
            print(f"Erro ao obter categorias: {response.status_code}")
    except Exception as e:
        print(f"Erro ao obter categorias: {e}")
    return categoria_ids

# Lista de 100 produtos famosos com imagens
produtos = [
    # Mercearia (20 produtos)
    {"nome": "Arroz Integral Uncle Ben's", "descricao": "Arroz integral tipo 1, pacote 1kg", "preco": 9.99, "quantidadeEstoque": 100, "categoria": "Mercearia", "codigoBarras": "7891234567890", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1586201375761-83865001e31c?w=500&auto=format"},
    {"nome": "Feijão Preto Camil", "descricao": "Feijão preto tipo 1, pacote 1kg", "preco": 7.50, "quantidadeEstoque": 80, "categoria": "Mercearia", "codigoBarras": "7891234567891", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1564894809611-1742fc40ed80?w=500&auto=format"},
    {"nome": "Açúcar Cristal União", "descricao": "Açúcar cristal especial, pacote 1kg", "preco": 4.99, "quantidadeEstoque": 120, "categoria": "Mercearia", "codigoBarras": "7891234567892", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1581441363689-1f3c3c414635?w=500&auto=format"},
    {"nome": "Óleo de Soja Liza", "descricao": "Óleo de soja refinado, garrafa 900ml", "preco": 6.99, "quantidadeEstoque": 90, "categoria": "Mercearia", "codigoBarras": "7891234567893", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1620705042582-7c61b34cc91d?w=500&auto=format"},
    {"nome": "Sal Refinado Cisne", "descricao": "Sal refinado iodado, pacote 1kg", "preco": 2.50, "quantidadeEstoque": 150, "categoria": "Mercearia", "codigoBarras": "7891234567894", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1518110925495-5fe2fda0442a?w=500&auto=format"},
    {"nome": "Macarrão Espaguete Barilla", "descricao": "Macarrão espaguete nº 8, pacote 500g", "preco": 5.99, "quantidadeEstoque": 75, "categoria": "Mercearia", "codigoBarras": "7891234567895", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1551462147-ff29053bfc14?w=500&auto=format"},
    {"nome": "Farinha de Trigo Dona Benta", "descricao": "Farinha de trigo especial, pacote 1kg", "preco": 4.50, "quantidadeEstoque": 85, "categoria": "Mercearia", "codigoBarras": "7891234567896", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1586444248879-9a421ac68a7d?w=500&auto=format"},
    {"nome": "Café Pilão", "descricao": "Café torrado e moído, pacote 500g", "preco": 12.99, "quantidadeEstoque": 60, "categoria": "Mercearia", "codigoBarras": "7891234567897", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?w=500&auto=format"},
    {"nome": "Achocolatado Nescau", "descricao": "Achocolatado em pó, lata 400g", "preco": 8.99, "quantidadeEstoque": 70, "categoria": "Mercearia", "codigoBarras": "7891234567898", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=500&auto=format"},
    {"nome": "Biscoito Cream Cracker Adria", "descricao": "Biscoito cream cracker, pacote 400g", "preco": 3.99, "quantidadeEstoque": 95, "categoria": "Mercearia", "codigoBarras": "7891234567899", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1558961363-fa8fdf82db35?w=500&auto=format"},
    {"nome": "Molho de Tomate Quero", "descricao": "Molho de tomate tradicional, lata 340g", "preco": 2.99, "quantidadeEstoque": 110, "categoria": "Mercearia", "codigoBarras": "7891234567800", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1608574973628-d2fda8e6c191?w=500&auto=format"},
    {"nome": "Vinagre de Álcool Castelo", "descricao": "Vinagre de álcool, garrafa 750ml", "preco": 3.50, "quantidadeEstoque": 65, "categoria": "Mercearia", "codigoBarras": "7891234567801", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1599021456807-25db0f974333?w=500&auto=format"},
    {"nome": "Extrato de Tomate Elefante", "descricao": "Extrato de tomate concentrado, lata 130g", "preco": 1.99, "quantidadeEstoque": 130, "categoria": "Mercearia", "codigoBarras": "7891234567802", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1608574973628-d2fda8e6c191?w=500&auto=format"},
    {"nome": "Sardinha Gomes da Costa", "descricao": "Sardinha em óleo comestível, lata 125g", "preco": 4.99, "quantidadeEstoque": 80, "categoria": "Mercearia", "codigoBarras": "7891234567803", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1626957341926-98752fc2ba90?w=500&auto=format"},
    {"nome": "Atum Gomes da Costa", "descricao": "Atum sólido em óleo, lata 170g", "preco": 7.99, "quantidadeEstoque": 55, "categoria": "Mercearia", "codigoBarras": "7891234567804", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1626957341926-98752fc2ba90?w=500&auto=format"},
    {"nome": "Milho Verde Quero", "descricao": "Milho verde em conserva, lata 200g", "preco": 3.50, "quantidadeEstoque": 90, "categoria": "Mercearia", "codigoBarras": "7891234567805", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1551390815-9a3a7c2d9aaa?w=500&auto=format"},
    {"nome": "Ervilha Quero", "descricao": "Ervilha em conserva, lata 200g", "preco": 3.50, "quantidadeEstoque": 85, "categoria": "Mercearia", "codigoBarras": "7891234567806", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1596097635121-14b38b1df990?w=500&auto=format"},
    {"nome": "Leite Condensado Moça", "descricao": "Leite condensado, lata 395g", "preco": 5.99, "quantidadeEstoque": 75, "categoria": "Mercearia", "codigoBarras": "7891234567807", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1589985270826-4b7bb135bc9d?w=500&auto=format"},
    {"nome": "Creme de Leite Nestlé", "descricao": "Creme de leite, caixinha 200g", "preco": 3.99, "quantidadeEstoque": 100, "categoria": "Mercearia", "codigoBarras": "7891234567808", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1563636619-e9143da7973b?w=500&auto=format"},
    {"nome": "Aveia Quaker", "descricao": "Aveia em flocos, pacote 500g", "preco": 6.99, "quantidadeEstoque": 70, "categoria": "Mercearia", "codigoBarras": "7891234567809", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1614961233913-a5113a4a34ed?w=500&auto=format"},
    
    # Hortifruti (20 produtos)
    {"nome": "Banana Prata", "descricao": "Banana prata fresca, kg", "preco": 4.99, "quantidadeEstoque": 50, "categoria": "Hortifruti", "codigoBarras": "7891234567810", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=500&auto=format"},
    {"nome": "Maçã Gala", "descricao": "Maçã gala nacional, kg", "preco": 7.99, "quantidadeEstoque": 40, "categoria": "Hortifruti", "codigoBarras": "7891234567811", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=500&auto=format"},
    {"nome": "Laranja Pera", "descricao": "Laranja pera para suco, kg", "preco": 3.99, "quantidadeEstoque": 60, "categoria": "Hortifruti", "codigoBarras": "7891234567812", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1611080626919-7cf5a9dbab12?w=500&auto=format"},
    {"nome": "Tomate Salada", "descricao": "Tomate salada fresco, kg", "preco": 6.99, "quantidadeEstoque": 45, "categoria": "Hortifruti", "codigoBarras": "7891234567813", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1561136594-7f68413baa99?w=500&auto=format"},
    {"nome": "Cebola Branca", "descricao": "Cebola branca nacional, kg", "preco": 4.50, "quantidadeEstoque": 70, "categoria": "Hortifruti", "codigoBarras": "7891234567814", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1620574387735-3624d75b2dbc?w=500&auto=format"},
    {"nome": "Batata Inglesa", "descricao": "Batata inglesa lavada, kg", "preco": 5.99, "quantidadeEstoque": 55, "categoria": "Hortifruti", "codigoBarras": "7891234567815", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=500&auto=format"},
    {"nome": "Cenoura", "descricao": "Cenoura fresca, kg", "preco": 4.99, "quantidadeEstoque": 65, "categoria": "Hortifruti", "codigoBarras": "7891234567816", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?w=500&auto=format"},
    {"nome": "Alface Crespa", "descricao": "Alface crespa hidropônica, unidade", "preco": 2.99, "quantidadeEstoque": 30, "categoria": "Hortifruti", "codigoBarras": "7891234567817", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1556801712-76c8eb07bbc9?w=500&auto=format"},
    {"nome": "Brócolis", "descricao": "Brócolis fresco, kg", "preco": 8.99, "quantidadeEstoque": 25, "categoria": "Hortifruti", "codigoBarras": "7891234567818", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1584270354949-c26b0d5b4a0c?w=500&auto=format"},
    {"nome": "Couve-flor", "descricao": "Couve-flor fresca, kg", "preco": 7.99, "quantidadeEstoque": 30, "categoria": "Hortifruti", "codigoBarras": "7891234567819", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1568584711075-3d021a7c3ca3?w=500&auto=format"},
    {"nome": "Abobrinha", "descricao": "Abobrinha italiana, kg", "preco": 5.99, "quantidadeEstoque": 40, "categoria": "Hortifruti", "codigoBarras": "7891234567820", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1596796930385-0885a1f1f472?w=500&auto=format"},
    {"nome": "Berinjela", "descricao": "Berinjela roxa, kg", "preco": 6.99, "quantidadeEstoque": 35, "categoria": "Hortifruti", "codigoBarras": "7891234567821", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1615485290382-441e4d049cb5?w=500&auto=format"},
    {"nome": "Pimentão Verde", "descricao": "Pimentão verde fresco, kg", "preco": 7.50, "quantidadeEstoque": 45, "categoria": "Hortifruti", "codigoBarras": "7891234567822", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1563565375-f3fdfdbefa83?w=500&auto=format"},
    {"nome": "Limão Tahiti", "descricao": "Limão tahiti, kg", "preco": 4.99, "quantidadeEstoque": 50, "categoria": "Hortifruti", "codigoBarras": "7891234567823", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1590502593747-42a996133562?w=500&auto=format"},
    {"nome": "Mamão Papaya", "descricao": "Mamão papaya maduro, kg", "preco": 5.99, "quantidadeEstoque": 35, "categoria": "Hortifruti", "codigoBarras": "7891234567824", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1526318472351-c75fcf070305?w=500&auto=format"},
    {"nome": "Abacaxi Pérola", "descricao": "Abacaxi pérola maduro, unidade", "preco": 6.99, "quantidadeEstoque": 20, "categoria": "Hortifruti", "codigoBarras": "7891234567825", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1550258987-190a2d41a8ba?w=500&auto=format"},
    {"nome": "Manga Tommy", "descricao": "Manga tommy atkins, kg", "preco": 8.99, "quantidadeEstoque": 30, "categoria": "Hortifruti", "codigoBarras": "7891234567826", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1553279768-865429fa0078?w=500&auto=format"},
    {"nome": "Uva Itália", "descricao": "Uva itália sem semente, kg", "preco": 12.99, "quantidadeEstoque": 25, "categoria": "Hortifruti", "codigoBarras": "7891234567827", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1537640538966-79f369143f8f?w=500&auto=format"},
    {"nome": "Melancia", "descricao": "Melancia redonda, kg", "preco": 2.99, "quantidadeEstoque": 15, "categoria": "Hortifruti", "codigoBarras": "7891234567828", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1563114773-84221bd62daa?w=500&auto=format"},
    {"nome": "Melão Amarelo", "descricao": "Melão amarelo maduro, kg", "preco": 4.99, "quantidadeEstoque": 20, "categoria": "Hortifruti", "codigoBarras": "7891234567829", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1571575173700-afb9492e6a50?w=500&auto=format"},
    
    # Bebidas (20 produtos)
    {"nome": "Coca-Cola 2L", "descricao": "Refrigerante Coca-Cola, garrafa 2L", "preco": 7.99, "quantidadeEstoque": 80, "categoria": "Bebidas", "codigoBarras": "7891234567830", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1554866585-cd94860890b7?w=500&auto=format"},
    {"nome": "Pepsi 2L", "descricao": "Refrigerante Pepsi, garrafa 2L", "preco": 6.99, "quantidadeEstoque": 70, "categoria": "Bebidas", "codigoBarras": "7891234567831", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1629203432180-71e9b18d855c?w=500&auto=format"},
    {"nome": "Guaraná Antarctica 2L", "descricao": "Refrigerante Guaraná Antarctica, garrafa 2L", "preco": 6.99, "quantidadeEstoque": 75, "categoria": "Bebidas", "codigoBarras": "7891234567832", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=500&auto=format"},
    {"nome": "Fanta Laranja 2L", "descricao": "Refrigerante Fanta Laranja, garrafa 2L", "preco": 6.99, "quantidadeEstoque": 65, "categoria": "Bebidas", "codigoBarras": "7891234567833", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1624552184280-9e9631bbeee9?w=500&auto=format"},
    {"nome": "Sprite 2L", "descricao": "Refrigerante Sprite, garrafa 2L", "preco": 6.99, "quantidadeEstoque": 60, "categoria": "Bebidas", "codigoBarras": "7891234567834", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1625772299848-391b6a87d7b3?w=500&auto=format"},
    {"nome": "Água Mineral Crystal 1,5L", "descricao": "Água mineral sem gás, garrafa 1,5L", "preco": 2.99, "quantidadeEstoque": 120, "categoria": "Bebidas", "codigoBarras": "7891234567835", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1560787313-5dff3307e257?w=500&auto=format"},
    {"nome": "Suco Del Valle Laranja 1L", "descricao": "Suco de laranja Del Valle, caixa 1L", "preco": 4.99, "quantidadeEstoque": 85, "categoria": "Bebidas", "codigoBarras": "7891234567836", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=500&auto=format"},
    {"nome": "Suco Tang Laranja", "descricao": "Suco em pó Tang sabor laranja, pacote 25g", "preco": 1.99, "quantidadeEstoque": 100, "categoria": "Bebidas", "codigoBarras": "7891234567837", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1534353473418-4cfa6c56fd38?w=500&auto=format"},
    {"nome": "Cerveja Skol Lata 350ml", "descricao": "Cerveja Skol, lata 350ml", "preco": 3.99, "quantidadeEstoque": 150, "categoria": "Bebidas", "codigoBarras": "7891234567838", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1608270586620-248524c67de9?w=500&auto=format"},
    {"nome": "Cerveja Brahma Lata 350ml", "descricao": "Cerveja Brahma, lata 350ml", "preco": 3.99, "quantidadeEstoque": 140, "categoria": "Bebidas", "codigoBarras": "7891234567839", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1613922962236-e9ba827d6c01?w=500&auto=format"},
    {"nome": "Cerveja Antarctica Lata 350ml", "descricao": "Cerveja Antarctica, lata 350ml", "preco": 3.99, "quantidadeEstoque": 130, "categoria": "Bebidas", "codigoBarras": "7891234567840", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1613922962236-e9ba827d6c01?w=500&auto=format&q=80"},
    {"nome": "Energético Red Bull 250ml", "descricao": "Energético Red Bull, lata 250ml", "preco": 8.99, "quantidadeEstoque": 60, "categoria": "Bebidas", "codigoBarras": "7891234567841", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1613218222876-54be0ec87de0?w=500&auto=format"},
    {"nome": "Chá Mate Leão 1,5L", "descricao": "Chá mate natural Leão, garrafa 1,5L", "preco": 4.99, "quantidadeEstoque": 70, "categoria": "Bebidas", "codigoBarras": "7891234567842", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&auto=format"},
    {"nome": "Isotônico Gatorade 500ml", "descricao": "Isotônico Gatorade sabor laranja, garrafa 500ml", "preco": 5.99, "quantidadeEstoque": 80, "categoria": "Bebidas", "codigoBarras": "7891234567843", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1622543925917-763c34d1a86e?w=500&auto=format"},
    {"nome": "Água de Coco Kero Coco 1L", "descricao": "Água de coco natural, caixa 1L", "preco": 6.99, "quantidadeEstoque": 50, "categoria": "Bebidas", "codigoBarras": "7891234567844", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1536657464919-892534f60d6e?w=500&auto=format"},
    {"nome": "Vinho Tinto Concha y Toro", "descricao": "Vinho tinto seco, garrafa 750ml", "preco": 24.99, "quantidadeEstoque": 30, "categoria": "Bebidas", "codigoBarras": "7891234567845", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1510812431401-41d2bd2722f3?w=500&auto=format"},
    {"nome": "Whisky Johnnie Walker Red", "descricao": "Whisky escocês, garrafa 1L", "preco": 89.99, "quantidadeEstoque": 15, "categoria": "Bebidas", "codigoBarras": "7891234567846", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1527281400683-1aae777175f8?w=500&auto=format"},
    {"nome": "Vodka Smirnoff", "descricao": "Vodka premium, garrafa 1L", "preco": 45.99, "quantidadeEstoque": 20, "categoria": "Bebidas", "codigoBarras": "7891234567847", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1556679343-c1306ee3f376?w=500&auto=format"},
    {"nome": "Cachaça 51 1L", "descricao": "Cachaça 51, garrafa 1L", "preco": 19.99, "quantidadeEstoque": 25, "categoria": "Bebidas", "codigoBarras": "7891234567848", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1614313511387-1436a4480ebb?w=500&auto=format"},
    {"nome": "Leite UHT Parmalat 1L", "descricao": "Leite UHT integral, caixa 1L", "preco": 4.99, "quantidadeEstoque": 100, "categoria": "Bebidas", "codigoBarras": "7891234567849", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1550583724-b2692b85b150?w=500&auto=format"},
    
    # Carnes (20 produtos)
    {"nome": "Picanha Bovina", "descricao": "Picanha bovina premium, kg", "preco": 59.99, "quantidadeEstoque": 20, "categoria": "Carnes", "codigoBarras": "7891234567850", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?w=500&auto=format"},
    {"nome": "Alcatra Bovina", "descricao": "Alcatra bovina sem osso, kg", "preco": 39.99, "quantidadeEstoque": 25, "categoria": "Carnes", "codigoBarras": "7891234567851", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1603048297172-c92544700ec9?w=500&auto=format"},
    {"nome": "Contrafilé Bovino", "descricao": "Contrafilé bovino sem osso, kg", "preco": 49.99, "quantidadeEstoque": 18, "categoria": "Carnes", "codigoBarras": "7891234567852", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1588168333986-5078d3ae3976?w=500&auto=format"},
    {"nome": "Coxão Mole", "descricao": "Coxão mole bovino, kg", "preco": 29.99, "quantidadeEstoque": 30, "categoria": "Carnes", "codigoBarras": "7891234567853", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1615937657715-bc7b4b7962c1?w=500&auto=format"},
    {"nome": "Patinho Bovino", "descricao": "Patinho bovino sem osso, kg", "preco": 27.99, "quantidadeEstoque": 35, "categoria": "Carnes", "codigoBarras": "7891234567854", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1602470520998-f4a52199a3d6?w=500&auto=format"},
    {"nome": "Carne Moída Especial", "descricao": "Carne moída especial, kg", "preco": 24.99, "quantidadeEstoque": 40, "categoria": "Carnes", "codigoBarras": "7891234567855", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=500&auto=format"},
    {"nome": "Frango Inteiro", "descricao": "Frango inteiro congelado, kg", "preco": 8.99, "quantidadeEstoque": 50, "categoria": "Carnes", "codigoBarras": "7891234567856", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1587593810167-a84920ea0781?w=500&auto=format"},
    {"nome": "Peito de Frango", "descricao": "Peito de frango sem osso, kg", "preco": 16.99, "quantidadeEstoque": 45, "categoria": "Carnes", "codigoBarras": "7891234567857", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=500&auto=format"},
    {"nome": "Coxa e Sobrecoxa", "descricao": "Coxa e sobrecoxa de frango, kg", "preco": 12.99, "quantidadeEstoque": 55, "categoria": "Carnes", "codigoBarras": "7891234567858", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=500&auto=format"},
    {"nome": "Linguiça Toscana", "descricao": "Linguiça toscana suína, kg", "preco": 18.99, "quantidadeEstoque": 30, "categoria": "Carnes", "codigoBarras": "7891234567859", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1599161146640-8d60bd2888e3?w=500&auto=format"},
    {"nome": "Costela Suína", "descricao": "Costela suína com osso, kg", "preco": 22.99, "quantidadeEstoque": 25, "categoria": "Carnes", "codigoBarras": "7891234567860", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1544025162-d76694265947?w=500&auto=format"},
    {"nome": "Lombo Suíno", "descricao": "Lombo suíno sem osso, kg", "preco": 26.99, "quantidadeEstoque": 20, "categoria": "Carnes", "codigoBarras": "7891234567861", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1432731631195-84a9479269bd?w=500&auto=format"},
    {"nome": "Bacon Fatiado", "descricao": "Bacon suíno fatiado, pacote 500g", "preco": 15.99, "quantidadeEstoque": 40, "categoria": "Carnes", "codigoBarras": "7891234567862", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1606851091851-e8c8c0fca5ba?w=500&auto=format"},
    {"nome": "Presunto Fatiado", "descricao": "Presunto suíno fatiado, kg", "preco": 32.99, "quantidadeEstoque": 25, "categoria": "Carnes", "codigoBarras": "7891234567863", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1524438418049-ab2acb7aa48f?w=500&auto=format"},
    {"nome": "Mortadela Fatiada", "descricao": "Mortadela com azeitona fatiada, kg", "preco": 18.99, "quantidadeEstoque": 35, "categoria": "Carnes", "codigoBarras": "7891234567864", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1626082922482-ac8b9b63bc3f?w=500&auto=format"},
    {"nome": "Salsicha Viena", "descricao": "Salsicha tipo viena, pacote 500g", "preco": 8.99, "quantidadeEstoque": 60, "categoria": "Carnes", "codigoBarras": "7891234567865", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=500&auto=format"},
    {"nome": "Filé de Tilápia", "descricao": "Filé de tilápia congelado, kg", "preco": 24.99, "quantidadeEstoque": 30, "categoria": "Carnes", "codigoBarras": "7891234567866", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=500&auto=format"},
    {"nome": "Salmão Filé", "descricao": "Filé de salmão congelado, kg", "preco": 79.99, "quantidadeEstoque": 15, "categoria": "Carnes", "codigoBarras": "7891234567867", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1519708042361-f1c8bc3a911f?w=500&auto=format"},
    {"nome": "Camarão Médio", "descricao": "Camarão médio descascado, kg", "preco": 45.99, "quantidadeEstoque": 20, "categoria": "Carnes", "codigoBarras": "7891234567868", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1565680018434-b513d5e5fd47?w=500&auto=format"},
    {"nome": "Sardinha Fresca", "descricao": "Sardinha fresca inteira, kg", "preco": 12.99, "quantidadeEstoque": 25, "categoria": "Carnes", "codigoBarras": "7891234567869", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1574652533367-e5eb0dfa5116?w=500&auto=format"},
    
    # Laticínios (20 produtos)
    {"nome": "Leite Integral Parmalat 1L", "descricao": "Leite UHT integral, caixa 1L", "preco": 4.99, "quantidadeEstoque": 100, "categoria": "Laticínios", "codigoBarras": "7891234567870", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1563636619-e9143da7973b?w=500&auto=format"},
    {"nome": "Iogurte Natural Danone", "descricao": "Iogurte natural, pote 170g", "preco": 3.99, "quantidadeEstoque": 80, "categoria": "Laticínios", "codigoBarras": "7891234567871", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1488477181946-6428a0291777?w=500&auto=format"},
    {"nome": "Queijo Mussarela Tirolez", "descricao": "Queijo mussarela fatiado, pacote 150g", "preco": 8.99, "quantidadeEstoque": 60, "categoria": "Laticínios", "codigoBarras": "7891234567872", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1624806992066-5ffcf7ca186b?w=500&auto=format"},
    {"nome": "Queijo Prato Tirolez", "descricao": "Queijo prato fatiado, pacote 150g", "preco": 9.99, "quantidadeEstoque": 55, "categoria": "Laticínios", "codigoBarras": "7891234567873", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=500&auto=format"},
    {"nome": "Requeijão Catupiry", "descricao": "Requeijão cremoso, pote 200g", "preco": 7.99, "quantidadeEstoque": 70, "categoria": "Laticínios", "codigoBarras": "7891234567874", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1589881133595-a3c085cb731d?w=500&auto=format"},
    {"nome": "Manteiga Aviação", "descricao": "Manteiga com sal, pote 200g", "preco": 12.99, "quantidadeEstoque": 45, "categoria": "Laticínios", "codigoBarras": "7891234567875", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1589985270958-bf087be2a336?w=500&auto=format"},
    {"nome": "Margarina Qualy", "descricao": "Margarina cremosa, pote 500g", "preco": 6.99, "quantidadeEstoque": 65, "categoria": "Laticínios", "codigoBarras": "7891234567876", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1589985270826-4b7bb135bc9d?w=500&auto=format"},
    {"nome": "Cream Cheese Philadelphia", "descricao": "Cream cheese original, pote 150g", "preco": 11.99, "quantidadeEstoque": 40, "categoria": "Laticínios", "codigoBarras": "7891234567877", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1550583724-b2692b85b150?w=500&auto=format"},
    {"nome": "Leite Desnatado Parmalat", "descricao": "Leite UHT desnatado, caixa 1L", "preco": 4.99, "quantidadeEstoque": 85, "categoria": "Laticínios", "codigoBarras": "7891234567878", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1550583724-b2692b85b150?w=500&auto=format"},
    {"nome": "Iogurte Grego Danone", "descricao": "Iogurte grego natural, pote 130g", "preco": 5.99, "quantidadeEstoque": 50, "categoria": "Laticínios", "codigoBarras": "7891234567879", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1488477181946-6428a0291777?w=500&auto=format&q=80"},
    {"nome": "Queijo Coalho", "descricao": "Queijo coalho nordestino, kg", "preco": 28.99, "quantidadeEstoque": 25, "categoria": "Laticínios", "codigoBarras": "7891234567880", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1589881133595-a3c085cb731d?w=500&auto=format&q=80"},
    {"nome": "Queijo Minas Frescal", "descricao": "Queijo minas frescal, kg", "preco": 24.99, "quantidadeEstoque": 30, "categoria": "Laticínios", "codigoBarras": "7891234567881", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1624806992066-5ffcf7ca186b?w=500&auto=format&q=80"},
    {"nome": "Ricota Fresca", "descricao": "Ricota fresca, kg", "preco": 18.99, "quantidadeEstoque": 35, "categoria": "Laticínios", "codigoBarras": "7891234567882", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=500&auto=format&q=80"},
    {"nome": "Queijo Parmesão Ralado", "descricao": "Queijo parmesão ralado, pacote 50g", "preco": 4.99, "quantidadeEstoque": 75, "categoria": "Laticínios", "codigoBarras": "7891234567883", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1552767059-ce182ead6c1b?w=500&auto=format"},
    {"nome": "Nata Fresca", "descricao": "Nata fresca para culinária, pote 200g", "preco": 6.99, "quantidadeEstoque": 40, "categoria": "Laticínios", "codigoBarras": "7891234567884", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1563636619-e9143da7973b?w=500&auto=format&q=85"},
    {"nome": "Leite Condensado Moça", "descricao": "Leite condensado, lata 395g", "preco": 5.99, "quantidadeEstoque": 90, "categoria": "Laticínios", "codigoBarras": "7891234567885", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1589985270958-bf087be2a336?w=500&auto=format&q=85"},
    {"nome": "Doce de Leite Mineiro", "descricao": "Doce de leite pastoso, pote 400g", "preco": 8.99, "quantidadeEstoque": 50, "categoria": "Laticínios", "codigoBarras": "7891234567886", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1589985270958-bf087be2a336?w=500&auto=format&q=90"},
    {"nome": "Bebida Láctea Danone", "descricao": "Bebida láctea sabor morango, garrafa 900ml", "preco": 7.99, "quantidadeEstoque": 60, "categoria": "Laticínios", "codigoBarras": "7891234567887", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1563636619-e9143da7973b?w=500&auto=format&q=90"},
    {"nome": "Achocolatado Toddynho", "descricao": "Achocolatado UHT, caixa 200ml", "preco": 2.99, "quantidadeEstoque": 120, "categoria": "Laticínios", "codigoBarras": "7891234567888", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1578020190125-f4f7c18bc9cb?w=500&auto=format"},
    {"nome": "Vitamina de Frutas Danone", "descricao": "Vitamina de frutas vermelhas, garrafa 900ml", "preco": 9.99, "quantidadeEstoque": 45, "categoria": "Laticínios", "codigoBarras": "7891234567889", "status": "ATIVO", "imagemUrl": "https://images.unsplash.com/photo-1563636619-e9143da7973b?w=500&auto=format&q=95"}
]

# Função para normalizar o nome da categoria
def normalizar_categoria(nome):
    # Corrigir problemas de codificação em "Laticínios"
    if "Latic" in nome:
        return "Laticínios"
    return nome

# Iniciar o script
if __name__ == "__main__":
    # Garantir que a API está disponível antes de continuar
    if not esperar_api():
        print("API não disponível após várias tentativas. Encerrando script.")
        exit(1)
    
    # Limpar produtos existentes para evitar duplicação
    print("Limpando produtos existentes...")
    limpar_produtos()
    
    # Obter categorias existentes
    categoria_ids = obter_categorias()
    print(f"Categorias encontradas: {len(categoria_ids)}")
    
    # Inserir produtos
    produtos_processados = 0
    produtos_criados = 0
    
    for i, produto in enumerate(produtos):
        # Normalizar o nome da categoria
        produto["categoria"] = normalizar_categoria(produto["categoria"])
        
        if produto["categoria"] in categoria_ids:
            # Gerar um ID único para o produto usando UUID
            produto_id = str(uuid.uuid4())
            
            # Gerar código de barras único para cada produto
            codigo_barras = f"789{uuid.uuid4().hex[:9]}"
            
            produto_data = {
                "id": produto_id,
                "nome": produto["nome"],
                "descricao": produto["descricao"],
                "preco": produto["preco"],
                "quantidadeEstoque": produto["quantidadeEstoque"],
                "categoriaId": categoria_ids[produto["categoria"]],
                "codigoBarras": codigo_barras,
                "status": produto["status"],
                "imagemUrl": produto["imagemUrl"]
            }
            
            try:
                # Criar o produto diretamente sem verificar se existe
                # (já limpamos todos os produtos anteriormente)
                response = requests.post(f"{base_url}/produtos", json=produto_data)
                if response.status_code == 201 or response.status_code == 200:
                    print(f"Produto '{produto['nome']}' criado com sucesso!")
                    produtos_criados += 1
                else:
                    print(f"Erro ao criar produto '{produto['nome']}': {response.status_code} - {response.text}")
            except Exception as e:
                print(f"Erro ao processar produto '{produto['nome']}': {e}")
        else:
            print(f"Categoria '{produto['categoria']}' não encontrada para o produto '{produto['nome']}'")
        
        produtos_processados += 1
    
    print("\nScript de inserção de produtos concluído!")
    print(f"Total de categorias encontradas: {len(categoria_ids)}")
    print(f"Total de produtos processados: {produtos_processados}")
    print(f"Total de produtos criados com sucesso: {produtos_criados}")