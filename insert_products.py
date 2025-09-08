import requests
import json

# URL base da API
base_url = "http://localhost:8080/api"

# Primeiro, vamos criar as categorias
categorias = [
    {"nome": "Mercearia", "descricao": "Produtos básicos de mercearia", "status": "ATIVA"},
    {"nome": "Hortifruti", "descricao": "Frutas, legumes e verduras", "status": "ATIVA"},
    {"nome": "Bebidas", "descricao": "Bebidas em geral", "status": "ATIVA"},
    {"nome": "Carnes", "descricao": "Carnes, aves e peixes", "status": "ATIVA"},
    {"nome": "Laticínios", "descricao": "Leite e derivados", "status": "ATIVA"}
]

# Criar categorias
categoria_ids = {}
for categoria in categorias:
    try:
        response = requests.post(f"{base_url}/categorias", json=categoria)
        if response.status_code == 201:
            categoria_data = response.json()
            categoria_ids[categoria["nome"]] = categoria_data["id"]
            print(f"Categoria '{categoria['nome']}' criada com ID: {categoria_data['id']}")
        else:
            print(f"Erro ao criar categoria '{categoria['nome']}': {response.status_code}")
    except Exception as e:
        print(f"Erro ao criar categoria '{categoria['nome']}': {e}")

# Lista de 100 produtos famosos
produtos = [
    # Mercearia (20 produtos)
    {"nome": "Arroz Integral Uncle Ben's", "descricao": "Arroz integral tipo 1, pacote 1kg", "preco": 9.99, "quantidadeEstoque": 100, "categoria": "Mercearia", "codigoBarras": "7891234567890", "status": "ATIVO"},
    {"nome": "Feijão Preto Camil", "descricao": "Feijão preto tipo 1, pacote 1kg", "preco": 7.50, "quantidadeEstoque": 80, "categoria": "Mercearia", "codigoBarras": "7891234567891", "status": "ATIVO"},
    {"nome": "Açúcar Cristal União", "descricao": "Açúcar cristal especial, pacote 1kg", "preco": 4.99, "quantidadeEstoque": 120, "categoria": "Mercearia", "codigoBarras": "7891234567892", "status": "ATIVO"},
    {"nome": "Óleo de Soja Liza", "descricao": "Óleo de soja refinado, garrafa 900ml", "preco": 6.99, "quantidadeEstoque": 90, "categoria": "Mercearia", "codigoBarras": "7891234567893", "status": "ATIVO"},
    {"nome": "Sal Refinado Cisne", "descricao": "Sal refinado iodado, pacote 1kg", "preco": 2.50, "quantidadeEstoque": 150, "categoria": "Mercearia", "codigoBarras": "7891234567894", "status": "ATIVO"},
    {"nome": "Macarrão Espaguete Barilla", "descricao": "Macarrão espaguete nº 8, pacote 500g", "preco": 5.99, "quantidadeEstoque": 75, "categoria": "Mercearia", "codigoBarras": "7891234567895", "status": "ATIVO"},
    {"nome": "Farinha de Trigo Dona Benta", "descricao": "Farinha de trigo especial, pacote 1kg", "preco": 4.50, "quantidadeEstoque": 85, "categoria": "Mercearia", "codigoBarras": "7891234567896", "status": "ATIVO"},
    {"nome": "Café Pilão", "descricao": "Café torrado e moído, pacote 500g", "preco": 12.99, "quantidadeEstoque": 60, "categoria": "Mercearia", "codigoBarras": "7891234567897", "status": "ATIVO"},
    {"nome": "Achocolatado Nescau", "descricao": "Achocolatado em pó, lata 400g", "preco": 8.99, "quantidadeEstoque": 70, "categoria": "Mercearia", "codigoBarras": "7891234567898", "status": "ATIVO"},
    {"nome": "Biscoito Cream Cracker Adria", "descricao": "Biscoito cream cracker, pacote 400g", "preco": 3.99, "quantidadeEstoque": 95, "categoria": "Mercearia", "codigoBarras": "7891234567899", "status": "ATIVO"},
    {"nome": "Molho de Tomate Quero", "descricao": "Molho de tomate tradicional, lata 340g", "preco": 2.99, "quantidadeEstoque": 110, "categoria": "Mercearia", "codigoBarras": "7891234567800", "status": "ATIVO"},
    {"nome": "Vinagre de Álcool Castelo", "descricao": "Vinagre de álcool, garrafa 750ml", "preco": 3.50, "quantidadeEstoque": 65, "categoria": "Mercearia", "codigoBarras": "7891234567801", "status": "ATIVO"},
    {"nome": "Extrato de Tomate Elefante", "descricao": "Extrato de tomate concentrado, lata 130g", "preco": 1.99, "quantidadeEstoque": 130, "categoria": "Mercearia", "codigoBarras": "7891234567802", "status": "ATIVO"},
    {"nome": "Sardinha Gomes da Costa", "descricao": "Sardinha em óleo comestível, lata 125g", "preco": 4.99, "quantidadeEstoque": 80, "categoria": "Mercearia", "codigoBarras": "7891234567803", "status": "ATIVO"},
    {"nome": "Atum Gomes da Costa", "descricao": "Atum sólido em óleo, lata 170g", "preco": 7.99, "quantidadeEstoque": 55, "categoria": "Mercearia", "codigoBarras": "7891234567804", "status": "ATIVO"},
    {"nome": "Milho Verde Quero", "descricao": "Milho verde em conserva, lata 200g", "preco": 3.50, "quantidadeEstoque": 90, "categoria": "Mercearia", "codigoBarras": "7891234567805", "status": "ATIVO"},
    {"nome": "Ervilha Quero", "descricao": "Ervilha em conserva, lata 200g", "preco": 3.50, "quantidadeEstoque": 85, "categoria": "Mercearia", "codigoBarras": "7891234567806", "status": "ATIVO"},
    {"nome": "Leite Condensado Moça", "descricao": "Leite condensado, lata 395g", "preco": 5.99, "quantidadeEstoque": 75, "categoria": "Mercearia", "codigoBarras": "7891234567807", "status": "ATIVO"},
    {"nome": "Creme de Leite Nestlé", "descricao": "Creme de leite, caixinha 200g", "preco": 3.99, "quantidadeEstoque": 100, "categoria": "Mercearia", "codigoBarras": "7891234567808", "status": "ATIVO"},
    {"nome": "Aveia Quaker", "descricao": "Aveia em flocos, pacote 500g", "preco": 6.99, "quantidadeEstoque": 70, "categoria": "Mercearia", "codigoBarras": "7891234567809", "status": "ATIVO"},
    
    # Hortifruti (20 produtos)
    {"nome": "Banana Prata", "descricao": "Banana prata fresca, kg", "preco": 4.99, "quantidadeEstoque": 50, "categoria": "Hortifruti", "codigoBarras": "7891234567810", "status": "ATIVO"},
    {"nome": "Maçã Gala", "descricao": "Maçã gala nacional, kg", "preco": 7.99, "quantidadeEstoque": 40, "categoria": "Hortifruti", "codigoBarras": "7891234567811", "status": "ATIVO"},
    {"nome": "Laranja Pera", "descricao": "Laranja pera para suco, kg", "preco": 3.99, "quantidadeEstoque": 60, "categoria": "Hortifruti", "codigoBarras": "7891234567812", "status": "ATIVO"},
    {"nome": "Tomate Salada", "descricao": "Tomate salada fresco, kg", "preco": 6.99, "quantidadeEstoque": 45, "categoria": "Hortifruti", "codigoBarras": "7891234567813", "status": "ATIVO"},
    {"nome": "Cebola Branca", "descricao": "Cebola branca nacional, kg", "preco": 4.50, "quantidadeEstoque": 70, "categoria": "Hortifruti", "codigoBarras": "7891234567814", "status": "ATIVO"},
    {"nome": "Batata Inglesa", "descricao": "Batata inglesa lavada, kg", "preco": 5.99, "quantidadeEstoque": 55, "categoria": "Hortifruti", "codigoBarras": "7891234567815", "status": "ATIVO"},
    {"nome": "Cenoura", "descricao": "Cenoura fresca, kg", "preco": 4.99, "quantidadeEstoque": 65, "categoria": "Hortifruti", "codigoBarras": "7891234567816", "status": "ATIVO"},
    {"nome": "Alface Crespa", "descricao": "Alface crespa hidropônica, unidade", "preco": 2.99, "quantidadeEstoque": 30, "categoria": "Hortifruti", "codigoBarras": "7891234567817", "status": "ATIVO"},
    {"nome": "Brócolis", "descricao": "Brócolis fresco, kg", "preco": 8.99, "quantidadeEstoque": 25, "categoria": "Hortifruti", "codigoBarras": "7891234567818", "status": "ATIVO"},
    {"nome": "Couve-flor", "descricao": "Couve-flor fresca, kg", "preco": 7.99, "quantidadeEstoque": 30, "categoria": "Hortifruti", "codigoBarras": "7891234567819", "status": "ATIVO"},
    {"nome": "Abobrinha", "descricao": "Abobrinha italiana, kg", "preco": 5.99, "quantidadeEstoque": 40, "categoria": "Hortifruti", "codigoBarras": "7891234567820", "status": "ATIVO"},
    {"nome": "Berinjela", "descricao": "Berinjela roxa, kg", "preco": 6.99, "quantidadeEstoque": 35, "categoria": "Hortifruti", "codigoBarras": "7891234567821", "status": "ATIVO"},
    {"nome": "Pimentão Verde", "descricao": "Pimentão verde fresco, kg", "preco": 7.50, "quantidadeEstoque": 45, "categoria": "Hortifruti", "codigoBarras": "7891234567822", "status": "ATIVO"},
    {"nome": "Limão Tahiti", "descricao": "Limão tahiti, kg", "preco": 4.99, "quantidadeEstoque": 50, "categoria": "Hortifruti", "codigoBarras": "7891234567823", "status": "ATIVO"},
    {"nome": "Mamão Papaya", "descricao": "Mamão papaya maduro, kg", "preco": 5.99, "quantidadeEstoque": 35, "categoria": "Hortifruti", "codigoBarras": "7891234567824", "status": "ATIVO"},
    {"nome": "Abacaxi Pérola", "descricao": "Abacaxi pérola maduro, unidade", "preco": 6.99, "quantidadeEstoque": 20, "categoria": "Hortifruti", "codigoBarras": "7891234567825", "status": "ATIVO"},
    {"nome": "Manga Tommy", "descricao": "Manga tommy atkins, kg", "preco": 8.99, "quantidadeEstoque": 30, "categoria": "Hortifruti", "codigoBarras": "7891234567826", "status": "ATIVO"},
    {"nome": "Uva Itália", "descricao": "Uva itália sem semente, kg", "preco": 12.99, "quantidadeEstoque": 25, "categoria": "Hortifruti", "codigoBarras": "7891234567827", "status": "ATIVO"},
    {"nome": "Melancia", "descricao": "Melancia redonda, kg", "preco": 2.99, "quantidadeEstoque": 15, "categoria": "Hortifruti", "codigoBarras": "7891234567828", "status": "ATIVO"},
    {"nome": "Melão Amarelo", "descricao": "Melão amarelo maduro, kg", "preco": 4.99, "quantidadeEstoque": 20, "categoria": "Hortifruti", "codigoBarras": "7891234567829", "status": "ATIVO"},
    
    # Bebidas (20 produtos)
    {"nome": "Coca-Cola 2L", "descricao": "Refrigerante Coca-Cola, garrafa 2L", "preco": 7.99, "quantidadeEstoque": 80, "categoria": "Bebidas", "codigoBarras": "7891234567830", "status": "ATIVO"},
    {"nome": "Pepsi 2L", "descricao": "Refrigerante Pepsi, garrafa 2L", "preco": 6.99, "quantidadeEstoque": 70, "categoria": "Bebidas", "codigoBarras": "7891234567831", "status": "ATIVO"},
    {"nome": "Guaraná Antarctica 2L", "descricao": "Refrigerante Guaraná Antarctica, garrafa 2L", "preco": 6.99, "quantidadeEstoque": 75, "categoria": "Bebidas", "codigoBarras": "7891234567832", "status": "ATIVO"},
    {"nome": "Fanta Laranja 2L", "descricao": "Refrigerante Fanta Laranja, garrafa 2L", "preco": 6.99, "quantidadeEstoque": 65, "categoria": "Bebidas", "codigoBarras": "7891234567833", "status": "ATIVO"},
    {"nome": "Sprite 2L", "descricao": "Refrigerante Sprite, garrafa 2L", "preco": 6.99, "quantidadeEstoque": 60, "categoria": "Bebidas", "codigoBarras": "7891234567834", "status": "ATIVO"},
    {"nome": "Água Mineral Crystal 1,5L", "descricao": "Água mineral sem gás, garrafa 1,5L", "preco": 2.99, "quantidadeEstoque": 120, "categoria": "Bebidas", "codigoBarras": "7891234567835", "status": "ATIVO"},
    {"nome": "Suco Del Valle Laranja 1L", "descricao": "Suco de laranja Del Valle, caixa 1L", "preco": 4.99, "quantidadeEstoque": 85, "categoria": "Bebidas", "codigoBarras": "7891234567836", "status": "ATIVO"},
    {"nome": "Suco Tang Laranja", "descricao": "Suco em pó Tang sabor laranja, pacote 25g", "preco": 1.99, "quantidadeEstoque": 100, "categoria": "Bebidas", "codigoBarras": "7891234567837", "status": "ATIVO"},
    {"nome": "Cerveja Skol Lata 350ml", "descricao": "Cerveja Skol, lata 350ml", "preco": 3.99, "quantidadeEstoque": 150, "categoria": "Bebidas", "codigoBarras": "7891234567838", "status": "ATIVO"},
    {"nome": "Cerveja Brahma Lata 350ml", "descricao": "Cerveja Brahma, lata 350ml", "preco": 3.99, "quantidadeEstoque": 140, "categoria": "Bebidas", "codigoBarras": "7891234567839", "status": "ATIVO"},
    {"nome": "Cerveja Antarctica Lata 350ml", "descricao": "Cerveja Antarctica, lata 350ml", "preco": 3.99, "quantidadeEstoque": 130, "categoria": "Bebidas", "codigoBarras": "7891234567840", "status": "ATIVO"},
    {"nome": "Energético Red Bull 250ml", "descricao": "Energético Red Bull, lata 250ml", "preco": 8.99, "quantidadeEstoque": 60, "categoria": "Bebidas", "codigoBarras": "7891234567841", "status": "ATIVO"},
    {"nome": "Chá Mate Leão 1,5L", "descricao": "Chá mate natural Leão, garrafa 1,5L", "preco": 4.99, "quantidadeEstoque": 70, "categoria": "Bebidas", "codigoBarras": "7891234567842", "status": "ATIVO"},
    {"nome": "Isotônico Gatorade 500ml", "descricao": "Isotônico Gatorade sabor laranja, garrafa 500ml", "preco": 5.99, "quantidadeEstoque": 80, "categoria": "Bebidas", "codigoBarras": "7891234567843", "status": "ATIVO"},
    {"nome": "Água de Coco Kero Coco 1L", "descricao": "Água de coco natural, caixa 1L", "preco": 6.99, "quantidadeEstoque": 50, "categoria": "Bebidas", "codigoBarras": "7891234567844", "status": "ATIVO"},
    {"nome": "Vinho Tinto Concha y Toro", "descricao": "Vinho tinto seco, garrafa 750ml", "preco": 24.99, "quantidadeEstoque": 30, "categoria": "Bebidas", "codigoBarras": "7891234567845", "status": "ATIVO"},
    {"nome": "Whisky Johnnie Walker Red", "descricao": "Whisky escocês, garrafa 1L", "preco": 89.99, "quantidadeEstoque": 15, "categoria": "Bebidas", "codigoBarras": "7891234567846", "status": "ATIVO"},
    {"nome": "Vodka Smirnoff", "descricao": "Vodka premium, garrafa 1L", "preco": 45.99, "quantidadeEstoque": 20, "categoria": "Bebidas", "codigoBarras": "7891234567847", "status": "ATIVO"},
    {"nome": "Cachaça 51 1L", "descricao": "Cachaça 51, garrafa 1L", "preco": 19.99, "quantidadeEstoque": 25, "categoria": "Bebidas", "codigoBarras": "7891234567848", "status": "ATIVO"},
    {"nome": "Leite UHT Parmalat 1L", "descricao": "Leite UHT integral, caixa 1L", "preco": 4.99, "quantidadeEstoque": 100, "categoria": "Bebidas", "codigoBarras": "7891234567849", "status": "ATIVO"},
    
    # Carnes (20 produtos)
    {"nome": "Picanha Bovina", "descricao": "Picanha bovina premium, kg", "preco": 59.99, "quantidadeEstoque": 20, "categoria": "Carnes", "codigoBarras": "7891234567850", "status": "ATIVO"},
    {"nome": "Alcatra Bovina", "descricao": "Alcatra bovina sem osso, kg", "preco": 39.99, "quantidadeEstoque": 25, "categoria": "Carnes", "codigoBarras": "7891234567851", "status": "ATIVO"},
    {"nome": "Contrafilé Bovino", "descricao": "Contrafilé bovino sem osso, kg", "preco": 49.99, "quantidadeEstoque": 18, "categoria": "Carnes", "codigoBarras": "7891234567852", "status": "ATIVO"},
    {"nome": "Coxão Mole", "descricao": "Coxão mole bovino, kg", "preco": 29.99, "quantidadeEstoque": 30, "categoria": "Carnes", "codigoBarras": "7891234567853", "status": "ATIVO"},
    {"nome": "Patinho Bovino", "descricao": "Patinho bovino sem osso, kg", "preco": 27.99, "quantidadeEstoque": 35, "categoria": "Carnes", "codigoBarras": "7891234567854", "status": "ATIVO"},
    {"nome": "Carne Moída Especial", "descricao": "Carne moída especial, kg", "preco": 24.99, "quantidadeEstoque": 40, "categoria": "Carnes", "codigoBarras": "7891234567855", "status": "ATIVO"},
    {"nome": "Frango Inteiro", "descricao": "Frango inteiro congelado, kg", "preco": 8.99, "quantidadeEstoque": 50, "categoria": "Carnes", "codigoBarras": "7891234567856", "status": "ATIVO"},
    {"nome": "Peito de Frango", "descricao": "Peito de frango sem osso, kg", "preco": 16.99, "quantidadeEstoque": 45, "categoria": "Carnes", "codigoBarras": "7891234567857", "status": "ATIVO"},
    {"nome": "Coxa e Sobrecoxa", "descricao": "Coxa e sobrecoxa de frango, kg", "preco": 12.99, "quantidadeEstoque": 55, "categoria": "Carnes", "codigoBarras": "7891234567858", "status": "ATIVO"},
    {"nome": "Linguiça Toscana", "descricao": "Linguiça toscana suína, kg", "preco": 18.99, "quantidadeEstoque": 30, "categoria": "Carnes", "codigoBarras": "7891234567859", "status": "ATIVO"},
    {"nome": "Costela Suína", "descricao": "Costela suína com osso, kg", "preco": 22.99, "quantidadeEstoque": 25, "categoria": "Carnes", "codigoBarras": "7891234567860", "status": "ATIVO"},
    {"nome": "Lombo Suíno", "descricao": "Lombo suíno sem osso, kg", "preco": 26.99, "quantidadeEstoque": 20, "categoria": "Carnes", "codigoBarras": "7891234567861", "status": "ATIVO"},
    {"nome": "Bacon Fatiado", "descricao": "Bacon suíno fatiado, pacote 500g", "preco": 15.99, "quantidadeEstoque": 40, "categoria": "Carnes", "codigoBarras": "7891234567862", "status": "ATIVO"},
    {"nome": "Presunto Fatiado", "descricao": "Presunto suíno fatiado, kg", "preco": 32.99, "quantidadeEstoque": 25, "categoria": "Carnes", "codigoBarras": "7891234567863", "status": "ATIVO"},
    {"nome": "Mortadela Fatiada", "descricao": "Mortadela com azeitona fatiada, kg", "preco": 18.99, "quantidadeEstoque": 35, "categoria": "Carnes", "codigoBarras": "7891234567864", "status": "ATIVO"},
    {"nome": "Salsicha Viena", "descricao": "Salsicha tipo viena, pacote 500g", "preco": 8.99, "quantidadeEstoque": 60, "categoria": "Carnes", "codigoBarras": "7891234567865", "status": "ATIVO"},
    {"nome": "Filé de Tilápia", "descricao": "Filé de tilápia congelado, kg", "preco": 24.99, "quantidadeEstoque": 30, "categoria": "Carnes", "codigoBarras": "7891234567866", "status": "ATIVO"},
    {"nome": "Salmão Filé", "descricao": "Filé de salmão congelado, kg", "preco": 79.99, "quantidadeEstoque": 15, "categoria": "Carnes", "codigoBarras": "7891234567867", "status": "ATIVO"},
    {"nome": "Camarão Médio", "descricao": "Camarão médio descascado, kg", "preco": 45.99, "quantidadeEstoque": 20, "categoria": "Carnes", "codigoBarras": "7891234567868", "status": "ATIVO"},
    {"nome": "Sardinha Fresca", "descricao": "Sardinha fresca inteira, kg", "preco": 12.99, "quantidadeEstoque": 25, "categoria": "Carnes", "codigoBarras": "7891234567869", "status": "ATIVO"},
    
    # Laticínios (20 produtos)
    {"nome": "Leite Integral Parmalat 1L", "descricao": "Leite UHT integral, caixa 1L", "preco": 4.99, "quantidadeEstoque": 100, "categoria": "Laticínios", "codigoBarras": "7891234567870", "status": "ATIVO"},
    {"nome": "Iogurte Natural Danone", "descricao": "Iogurte natural, pote 170g", "preco": 3.99, "quantidadeEstoque": 80, "categoria": "Laticínios", "codigoBarras": "7891234567871", "status": "ATIVO"},
    {"nome": "Queijo Mussarela Tirolez", "descricao": "Queijo mussarela fatiado, pacote 150g", "preco": 8.99, "quantidadeEstoque": 60, "categoria": "Laticínios", "codigoBarras": "7891234567872", "status": "ATIVO"},
    {"nome": "Queijo Prato Tirolez", "descricao": "Queijo prato fatiado, pacote 150g", "preco": 9.99, "quantidadeEstoque": 55, "categoria": "Laticínios", "codigoBarras": "7891234567873", "status": "ATIVO"},
    {"nome": "Requeijão Catupiry", "descricao": "Requeijão cremoso, pote 200g", "preco": 7.99, "quantidadeEstoque": 70, "categoria": "Laticínios", "codigoBarras": "7891234567874", "status": "ATIVO"},
    {"nome": "Manteiga Aviação", "descricao": "Manteiga com sal, pote 200g", "preco": 12.99, "quantidadeEstoque": 45, "categoria": "Laticínios", "codigoBarras": "7891234567875", "status": "ATIVO"},
    {"nome": "Margarina Qualy", "descricao": "Margarina cremosa, pote 500g", "preco": 6.99, "quantidadeEstoque": 65, "categoria": "Laticínios", "codigoBarras": "7891234567876", "status": "ATIVO"},
    {"nome": "Cream Cheese Philadelphia", "descricao": "Cream cheese original, pote 150g", "preco": 11.99, "quantidadeEstoque": 40, "categoria": "Laticínios", "codigoBarras": "7891234567877", "status": "ATIVO"},
    {"nome": "Leite Desnatado Parmalat", "descricao": "Leite UHT desnatado, caixa 1L", "preco": 4.99, "quantidadeEstoque": 85, "categoria": "Laticínios", "codigoBarras": "7891234567878", "status": "ATIVO"},
    {"nome": "Iogurte Grego Danone", "descricao": "Iogurte grego natural, pote 130g", "preco": 5.99, "quantidadeEstoque": 50, "categoria": "Laticínios", "codigoBarras": "7891234567879", "status": "ATIVO"},
    {"nome": "Queijo Coalho", "descricao": "Queijo coalho nordestino, kg", "preco": 28.99, "quantidadeEstoque": 25, "categoria": "Laticínios", "codigoBarras": "7891234567880", "status": "ATIVO"},
    {"nome": "Queijo Minas Frescal", "descricao": "Queijo minas frescal, kg", "preco": 24.99, "quantidadeEstoque": 30, "categoria": "Laticínios", "codigoBarras": "7891234567881", "status": "ATIVO"},
    {"nome": "Ricota Fresca", "descricao": "Ricota fresca, kg", "preco": 18.99, "quantidadeEstoque": 35, "categoria": "Laticínios", "codigoBarras": "7891234567882", "status": "ATIVO"},
    {"nome": "Queijo Parmesão Ralado", "descricao": "Queijo parmesão ralado, pacote 50g", "preco": 4.99, "quantidadeEstoque": 75, "categoria": "Laticínios", "codigoBarras": "7891234567883", "status": "ATIVO"},
    {"nome": "Nata Fresca", "descricao": "Nata fresca para culinária, pote 200g", "preco": 6.99, "quantidadeEstoque": 40, "categoria": "Laticínios", "codigoBarras": "7891234567884", "status": "ATIVO"},
    {"nome": "Leite Condensado Moça", "descricao": "Leite condensado, lata 395g", "preco": 5.99, "quantidadeEstoque": 90, "categoria": "Laticínios", "codigoBarras": "7891234567885", "status": "ATIVO"},
    {"nome": "Doce de Leite Mineiro", "descricao": "Doce de leite pastoso, pote 400g", "preco": 8.99, "quantidadeEstoque": 50, "categoria": "Laticínios", "codigoBarras": "7891234567886", "status": "ATIVO"},
    {"nome": "Bebida Láctea Danone", "descricao": "Bebida láctea sabor morango, garrafa 900ml", "preco": 7.99, "quantidadeEstoque": 60, "categoria": "Laticínios", "codigoBarras": "7891234567887", "status": "ATIVO"},
    {"nome": "Achocolatado Toddynho", "descricao": "Achocolatado UHT, caixa 200ml", "preco": 2.99, "quantidadeEstoque": 120, "categoria": "Laticínios", "codigoBarras": "7891234567888", "status": "ATIVO"},
    {"nome": "Vitamina de Frutas Danone", "descricao": "Vitamina de frutas vermelhas, garrafa 900ml", "preco": 9.99, "quantidadeEstoque": 45, "categoria": "Laticínios", "codigoBarras": "7891234567889", "status": "ATIVO"}
]

# Inserir produtos
for produto in produtos:
    if produto["categoria"] in categoria_ids:
        produto_data = {
            "nome": produto["nome"],
            "descricao": produto["descricao"],
            "preco": produto["preco"],
            "quantidadeEstoque": produto["quantidadeEstoque"],
            "categoriaId": categoria_ids[produto["categoria"]],
            "codigoBarras": produto["codigoBarras"],
            "status": produto["status"]
        }
        
        try:
            response = requests.post(f"{base_url}/produtos", json=produto_data)
            if response.status_code == 201:
                print(f"Produto '{produto['nome']}' criado com sucesso!")
            else:
                print(f"Erro ao criar produto '{produto['nome']}': {response.status_code} - {response.text}")
        except Exception as e:
            print(f"Erro ao criar produto '{produto['nome']}': {e}")
    else:
        print(f"Categoria '{produto['categoria']}' não encontrada para o produto '{produto['nome']}'")

print("\nScript de inserção de produtos concluído!")
print(f"Total de categorias criadas: {len(categoria_ids)}")
print(f"Total de produtos processados: {len(produtos)}")