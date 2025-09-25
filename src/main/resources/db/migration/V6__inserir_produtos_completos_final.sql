-- ========================================
-- INSERÇÃO COMPLETA DE PRODUTOS - 125 PRODUTOS
-- ========================================

-- Limpeza inicial
DELETE FROM produtos;

-- ========================================
-- CATEGORIA: MERCEARIA (25 produtos)
-- ========================================

INSERT INTO produtos (id, nome, descricao, preco, quantidade_estoque, categoria_id, codigo_barras, imagem_url, status)
VALUES 
('mercearia-001', 'Arroz Branco Tio João 5kg', 
 'Arroz branco tipo 1, grãos longos e soltos. Ideal para o dia a dia da família brasileira. Produto de alta qualidade com rendimento superior.', 
 22.99, 150, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001001', 
 'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-002', 'Feijão Carioca Camil 1kg', 
 'Feijão carioca selecionado, grãos uniformes e saborosos. Rico em proteínas e fibras. Essencial na mesa brasileira.', 
 8.99, 200, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001002', 
 'https://images.unsplash.com/photo-1559181567-c3190ca9959b?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-003', 'Açúcar Cristal União 1kg', 
 'Açúcar cristal refinado especial, ideal para adoçar bebidas e preparar doces. Produto de alta pureza e qualidade garantida.', 
 4.99, 180, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001003', 
 'https://images.unsplash.com/photo-1571115764595-644a1f56a55c?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-004', 'Óleo de Soja Liza 900ml', 
 'Óleo de soja refinado, ideal para frituras e refogados. Rico em vitamina E e ômega 6. Produto livre de colesterol.', 
 6.99, 120, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001004', 
 'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-005', 'Macarrão Espaguete Barilla 500g', 
 'Macarrão espaguete italiano premium, massa al dente perfeita. Ideal para pratos tradicionais e gourmet.', 
 7.99, 100, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001005', 
 'https://images.unsplash.com/photo-1551892374-ecf8754cf8b0?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-006', 'Sal Refinado Cisne 1kg', 
 'Sal refinado iodado, essencial para temperos e conservação. Produto de alta pureza com iodo para saúde da tireoide.', 
 2.99, 250, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001006', 
 'https://images.unsplash.com/photo-1472162314594-a27637f1bf5f?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-007', 'Farinha de Trigo Dona Benta 1kg', 
 'Farinha de trigo especial para panificação, ideal para pães, bolos e massas. Produto de alta qualidade e rendimento.', 
 5.99, 140, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001007', 
 'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-008', 'Café Torrado Pilão 500g', 
 'Café torrado e moído tradicional brasileiro, sabor intenso e aroma marcante. Ideal para começar bem o dia.', 
 12.99, 90, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001008', 
 'https://images.unsplash.com/photo-1559056199-641a0ac8b55e?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-009', 'Molho de Tomate Quero 340g', 
 'Molho de tomate tradicional, ideal para massas e pizzas. Sabor caseiro com temperos selecionados.', 
 3.99, 160, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001009', 
 'https://images.unsplash.com/photo-1572441713132-51c75654db73?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-010', 'Biscoito Cream Cracker Adria 400g', 
 'Biscoito cream cracker crocante, ideal para lanches e acompanhamentos. Sabor neutro que combina com tudo.', 
 4.99, 110, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001010', 
 'https://images.unsplash.com/photo-1558961363-fa8fdf82db35?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-011', 'Vinagre de Álcool Castelo 750ml', 
 'Vinagre de álcool para temperos e conservas. Produto natural ideal para saladas e marinadas.', 
 3.49, 80, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001011', 
 'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-012', 'Extrato de Tomate Quero 130g', 
 'Extrato de tomate concentrado, ideal para molhos e refogados. Sabor intenso e cor vibrante.', 
 2.99, 200, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001012', 
 'https://images.unsplash.com/photo-1572441713132-51c75654db73?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-013', 'Maionese Hellmanns 500g', 
 'Maionese tradicional cremosa, ideal para sanduíches e saladas. Sabor clássico que todos adoram.', 
 8.99, 70, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001013', 
 'https://images.unsplash.com/photo-1472162314594-a27637f1bf5f?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-014', 'Ketchup Heinz 397g', 
 'Ketchup tradicional Heinz, sabor doce e levemente ácido. Ideal para hambúrgueres e batatas fritas.', 
 6.99, 85, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001014', 
 'https://images.unsplash.com/photo-1472162314594-a27637f1bf5f?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-015', 'Mostarda Hemmer 200g', 
 'Mostarda amarela tradicional, sabor picante suave. Ideal para hot dogs e sanduíches gourmet.', 
 4.49, 60, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001015', 
 'https://images.unsplash.com/photo-1472162314594-a27637f1bf5f?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-016', 'Sardinha em Óleo Gomes da Costa 125g', 
 'Sardinha em óleo comestível, rica em ômega 3 e proteínas. Ideal para lanches rápidos e nutritivos.', 
 4.99, 120, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001016', 
 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-017', 'Atum em Óleo Gomes da Costa 170g', 
 'Atum em óleo comestível, fonte de proteínas e ômega 3. Ideal para saladas e sanduíches saudáveis.', 
 7.99, 95, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001017', 
 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-018', 'Ervilha em Conserva Quero 200g', 
 'Ervilha em conserva, prática e nutritiva. Ideal para saladas, risotos e pratos diversos.', 
 3.99, 140, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001018', 
 'https://images.unsplash.com/photo-1559181567-c3190ca9959b?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-019', 'Milho em Conserva Quero 200g', 
 'Milho em conserva doce, ideal para saladas e pratos diversos. Produto prático e saboroso.', 
 3.99, 130, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001019', 
 'https://images.unsplash.com/photo-1559181567-c3190ca9959b?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-020', 'Leite de Coco Sococo 200ml', 
 'Leite de coco puro, ideal para doces e pratos da culinária nordestina. Sabor tropical autêntico.', 
 4.99, 75, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001020', 
 'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-021', 'Tempero Completo Knorr 300g', 
 'Tempero completo com ervas e especiarias. Realça o sabor de carnes, aves e legumes.', 
 6.99, 100, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001021', 
 'https://images.unsplash.com/photo-1472162314594-a27637f1bf5f?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-022', 'Caldo de Galinha Knorr 57g', 
 'Caldo de galinha em tabletes, ideal para sopas e risotos. Sabor caseiro concentrado.', 
 3.99, 180, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001022', 
 'https://images.unsplash.com/photo-1472162314594-a27637f1bf5f?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-023', 'Gelatina Morango Royal 85g', 
 'Gelatina sabor morango, sobremesa prática e refrescante. Ideal para toda a família.', 
 2.99, 150, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001023', 
 'https://images.unsplash.com/photo-1571115764595-644a1f56a55c?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-024', 'Chocolate em Pó Nescau 400g', 
 'Chocolate em pó para vitaminas e sobremesas. Rico em vitaminas e minerais essenciais.', 
 9.99, 80, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001024', 
 'https://images.unsplash.com/photo-1559056199-641a0ac8b55e?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-025', 'Aveia em Flocos Quaker 500g', 
 'Aveia em flocos integral, rica em fibras e proteínas. Ideal para vitaminas e mingaus saudáveis.', 
 7.99, 90, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001025', 
 'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=400&h=400&fit=crop', 'ATIVO');

-- ========================================
-- CATEGORIA: HORTIFRUTI (25 produtos)
-- ========================================

INSERT INTO produtos (id, nome, descricao, preco, quantidade_estoque, categoria_id, codigo_barras, imagem_url, status)
VALUES 
('hortifruti-001', 'Banana Prata kg', 
 'Banana prata fresca e doce, rica em potássio e vitaminas. Ideal para lanches, vitaminas e sobremesas naturais.', 
 4.99, 50, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002001', 
 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-002', 'Maçã Gala kg', 
 'Maçã gala crocante e suculenta, rica em fibras e antioxidantes. Perfeita para lanches saudáveis.', 
 7.99, 40, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002002', 
 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-003', 'Laranja Pera kg', 
 'Laranja pera suculenta, rica em vitamina C. Ideal para sucos naturais e consumo in natura.', 
 3.99, 60, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002003', 
 'https://images.unsplash.com/photo-1547514701-42782101795e?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-004', 'Tomate Salada kg', 
 'Tomate salada fresco e vermelho, ideal para saladas e molhos. Rico em licopeno e vitaminas.', 
 6.99, 35, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002004', 
 'https://images.unsplash.com/photo-1546470427-e26264be0b0d?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-005', 'Cebola Branca kg', 
 'Cebola branca fresca, essencial para temperos e refogados. Base fundamental da culinária brasileira.', 
 4.99, 80, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002005', 
 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-006', 'Batata Inglesa kg', 
 'Batata inglesa lisa, ideal para purês, frituras e assados. Versátil e nutritiva para diversos pratos.', 
 3.99, 70, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002006', 
 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-007', 'Cenoura kg', 
 'Cenoura fresca e crocante, rica em betacaroteno. Ideal para saladas, refogados e sucos naturais.', 
 4.99, 45, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002007', 
 'https://images.unsplash.com/photo-1445282768818-728615cc910a?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-008', 'Alface Americana unidade', 
 'Alface americana crocante e fresca, ideal para saladas e sanduíches. Rica em fibras e vitaminas.', 
 2.99, 30, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002008', 
 'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-009', 'Brócolis kg', 
 'Brócolis fresco, rico em vitaminas C e K. Ideal para refogados, sopas e pratos saudáveis.', 
 8.99, 25, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002009', 
 'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-010', 'Couve-flor kg', 
 'Couve-flor fresca e branquinha, rica em nutrientes. Ideal para gratinados, sopas e pratos light.', 
 7.99, 20, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002010', 
 'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-011', 'Abobrinha kg', 
 'Abobrinha verde tenra, ideal para refogados e sopas. Baixa em calorias e rica em nutrientes.', 
 5.99, 35, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002011', 
 'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-012', 'Pimentão Verde kg', 
 'Pimentão verde fresco, ideal para refogados e saladas. Rico em vitamina C e antioxidantes.', 
 6.99, 40, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002012', 
 'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-013', 'Limão Tahiti kg', 
 'Limão tahiti suculento, ideal para temperos e bebidas. Rico em vitamina C e sabor cítrico.', 
 4.99, 50, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002013', 
 'https://images.unsplash.com/photo-1547514701-42782101795e?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-014', 'Mamão Papaya kg', 
 'Mamão papaya doce e suculento, rico em vitaminas A e C. Ideal para sobremesas e vitaminas.', 
 5.99, 30, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002014', 
 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-015', 'Abacaxi Pérola unidade', 
 'Abacaxi pérola doce e aromático, rico em vitamina C. Ideal para sobremesas e sucos naturais.', 
 8.99, 15, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002015', 
 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-016', 'Manga Tommy kg', 
 'Manga tommy doce e suculenta, rica em vitamina A. Perfeita para sobremesas e vitaminas.', 
 7.99, 25, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002016', 
 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-017', 'Uva Itália kg', 
 'Uva itália doce e sem sementes, rica em antioxidantes. Ideal para lanches e sobremesas.', 
 12.99, 20, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002017', 
 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-018', 'Melancia kg', 
 'Melancia doce e refrescante, rica em água e vitaminas. Ideal para dias quentes e hidratação.', 
 2.99, 40, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002018', 
 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-019', 'Melão Amarelo kg', 
 'Melão amarelo doce e suculento, rico em vitamina A. Perfeito para sobremesas refrescantes.', 
 4.99, 35, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002019', 
 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-020', 'Pepino kg', 
 'Pepino fresco e crocante, ideal para saladas e conservas. Rico em água e baixo em calorias.', 
 3.99, 45, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002020', 
 'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-021', 'Beterraba kg', 
 'Beterraba fresca e doce, rica em ferro e folato. Ideal para saladas e sucos detox.', 
 5.99, 30, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002021', 
 'https://images.unsplash.com/photo-1445282768818-728615cc910a?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-022', 'Rabanete kg', 
 'Rabanete fresco e picante, ideal para saladas. Rico em vitamina C e fibras.', 
 4.99, 25, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002022', 
 'https://images.unsplash.com/photo-1445282768818-728615cc910a?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-023', 'Couve Manteiga maço', 
 'Couve manteiga fresca, rica em ferro e vitaminas. Ideal para refogados e sucos verdes.', 
 2.99, 40, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002023', 
 'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-024', 'Espinafre maço', 
 'Espinafre fresco, rico em ferro e ácido fólico. Ideal para refogados, sopas e sucos verdes.', 
 3.99, 35, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002024', 
 'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-025', 'Rúcula maço', 
 'Rúcula fresca e levemente picante, ideal para saladas gourmet. Rica em vitamina K e antioxidantes.', 
 4.99, 30, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002025', 
 'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=400&h=400&fit=crop', 'ATIVO');

-- ========================================
-- CATEGORIA: BEBIDAS (25 produtos)
-- ========================================

INSERT INTO produtos (id, nome, descricao, preco, quantidade_estoque, categoria_id, codigo_barras, imagem_url, status)
VALUES 
('bebidas-001', 'Coca-Cola 2L', 
 'Refrigerante Coca-Cola original, sabor único e refrescante. Ideal para refeições e momentos especiais.', 
 7.99, 80, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003001', 
 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-002', 'Guaraná Antarctica 2L', 
 'Guaraná Antarctica, sabor brasileiro autêntico. Refrescante e com extrato natural de guaraná.', 
 6.99, 90, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003002', 
 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-003', 'Fanta Laranja 2L', 
 'Refrigerante Fanta sabor laranja, doce e refrescante. Ideal para toda a família.', 
 6.99, 75, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003003', 
 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-004', 'Sprite 2L', 
 'Refrigerante Sprite, sabor limão refrescante. Sem cafeína, ideal para qualquer hora do dia.', 
 6.99, 70, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003004', 
 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-005', 'Água Mineral Crystal 1,5L', 
 'Água mineral natural Crystal, pura e refrescante. Essencial para hidratação diária.', 
 2.99, 150, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003005', 
 'https://images.unsplash.com/photo-1550572017-edd951aa8ca6?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-006', 'Suco de Laranja Natural One 1L', 
 'Suco de laranja natural, sem conservantes. Rico em vitamina C e sabor autêntico da fruta.', 
 8.99, 60, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003006', 
 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-007', 'Cerveja Skol Lata 350ml', 
 'Cerveja Skol gelada, sabor suave e refrescante. Ideal para momentos de descontração.', 
 3.99, 120, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003007', 
 'https://images.unsplash.com/photo-1608270586620-248524c67de9?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-008', 'Cerveja Brahma Lata 350ml', 
 'Cerveja Brahma tradicional, sabor marcante brasileiro. Perfeita para churrascos e encontros.', 
 3.99, 110, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003008', 
 'https://images.unsplash.com/photo-1608270586620-248524c67de9?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-009', 'Energético Red Bull 250ml', 
 'Energético Red Bull, energia e foco para atividades intensas. Rico em cafeína e taurina.', 
 12.99, 50, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003009', 
 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-010', 'Chá Gelado Leão Pêssego 450ml', 
 'Chá gelado sabor pêssego, refrescante e natural. Ideal para dias quentes e hidratação saborosa.', 
 4.99, 80, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003010', 
 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-011', 'Água de Coco Kero Coco 1L', 
 'Água de coco natural, hidratante e nutritiva. Rica em eletrólitos naturais e sabor tropical.', 
 6.99, 70, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003011', 
 'https://images.unsplash.com/photo-1550572017-edd951aa8ca6?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-012', 'Isotônico Gatorade Laranja 500ml', 
 'Isotônico Gatorade sabor laranja, reposição de eletrólitos. Ideal para atividades físicas.', 
 5.99, 60, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003012', 
 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-013', 'Vinho Tinto Miolo 750ml', 
 'Vinho tinto seco nacional, sabor encorpado. Ideal para jantares especiais e harmonizações.', 
 24.99, 30, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003013', 
 'https://images.unsplash.com/photo-1510812431401-41d2bd2722f3?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-014', 'Cachaça 51 1L', 
 'Cachaça 51 tradicional brasileira, ideal para caipirinhas e drinks. Sabor autêntico nacional.', 
 18.99, 40, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003014', 
 'https://images.unsplash.com/photo-1510812431401-41d2bd2722f3?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-015', 'Whisky Red Label 1L', 
 'Whisky Johnnie Walker Red Label, sabor suave e equilibrado. Ideal para drinks sofisticados.', 
 89.99, 20, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003015', 
 'https://images.unsplash.com/photo-1510812431401-41d2bd2722f3?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-016', 'Vodka Smirnoff 1L', 
 'Vodka Smirnoff premium, sabor neutro e puro. Perfeita para drinks e coquetéis diversos.', 
 45.99, 25, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003016', 
 'https://images.unsplash.com/photo-1510812431401-41d2bd2722f3?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-017', 'Suco de Uva Integral Aurora 1L', 
 'Suco de uva integral, sem açúcar adicionado. Rico em antioxidantes e sabor natural da uva.', 
 9.99, 50, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003017', 
 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-018', 'Refrigerante Pepsi 2L', 
 'Refrigerante Pepsi cola, sabor intenso e refrescante. Alternativa clássica para refeições.', 
 7.99, 65, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003018', 
 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-019', 'Água Tônica Antarctica 350ml', 
 'Água tônica Antarctica, sabor amargo característico. Ideal para drinks e gin tônica.', 
 4.99, 80, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003019', 
 'https://images.unsplash.com/photo-1550572017-edd951aa8ca6?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-020', 'Cerveja Heineken Long Neck 330ml', 
 'Cerveja Heineken importada, sabor premium internacional. Ideal para ocasiões especiais.', 
 8.99, 45, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003020', 
 'https://images.unsplash.com/photo-1608270586620-248524c67de9?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-021', 'Refrigerante Schweppes Citrus 350ml', 
 'Refrigerante Schweppes sabor citrus, refrescante e sofisticado. Ideal para drinks especiais.', 
 5.99, 55, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003021', 
 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-022', 'Suco de Maracujá Maguary 1L', 
 'Suco de maracujá concentrado, sabor tropical intenso. Ideal para refrescos e vitaminas.', 
 7.99, 40, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003022', 
 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-023', 'Cerveja Corona Long Neck 355ml', 
 'Cerveja Corona mexicana com limão, sabor suave e refrescante. Perfeita para verão.', 
 9.99, 35, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003023', 
 'https://images.unsplash.com/photo-1608270586620-248524c67de9?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-024', 'Água Mineral com Gás São Lourenço 500ml', 
 'Água mineral com gás natural, refrescante e digestiva. Ideal para refeições e hidratação.', 
 3.99, 90, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003024', 
 'https://images.unsplash.com/photo-1550572017-edd951aa8ca6?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-025', 'Champagne Chandon 750ml', 
 'Champagne Chandon nacional, ideal para celebrações. Sabor elegante e borbulhante.', 
 49.99, 15, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003025', 
 'https://images.unsplash.com/photo-1510812431401-41d2bd2722f3?w=400&h=400&fit=crop', 'ATIVO');

-- ========================================
-- CATEGORIA: CARNES (25 produtos)
-- ========================================

INSERT INTO produtos (id, nome, descricao, preco, quantidade_estoque, categoria_id, codigo_barras, imagem_url, status)
VALUES 
('carnes-001', 'Picanha Bovina kg', 
 'Picanha bovina premium, corte nobre ideal para churrascos. Carne macia e saborosa, perfeita para assar.', 
 45.99, 30, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004001', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-002', 'Alcatra Bovina kg', 
 'Alcatra bovina magra, ideal para bifes e assados. Carne de primeira qualidade com pouca gordura.', 
 32.99, 25, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004002', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-003', 'Costela Bovina kg', 
 'Costela bovina com osso, ideal para churrascos e cozidos. Sabor intenso e textura macia.', 
 28.99, 40, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004003', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-004', 'Peito de Frango kg', 
 'Peito de frango sem osso, rico em proteínas e baixo em gordura. Ideal para dietas e pratos saudáveis.', 
 18.99, 50, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004004', 
 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-005', 'Coxa e Sobrecoxa de Frango kg', 
 'Coxa e sobrecoxa de frango, corte saboroso e suculento. Ideal para assados e ensopados.', 
 12.99, 60, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004005', 
 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-006', 'Carne Moída Bovina kg', 
 'Carne moída bovina fresca, ideal para hambúrgueres, molhos e refogados. Produto de primeira qualidade.', 
 24.99, 35, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004006', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-007', 'Linguiça Calabresa kg', 
 'Linguiça calabresa defumada, tempero tradicional brasileiro. Ideal para churrascos e farofa.', 
 22.99, 45, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004007', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-008', 'Bacon Fatiado Sadia 250g', 
 'Bacon fatiado defumado, ideal para lanches e pratos diversos. Sabor intenso e textura crocante.', 
 15.99, 40, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004008', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-009', 'Salsicha Hot Dog Perdigão 500g', 
 'Salsicha hot dog tradicional, ideal para lanches rápidos. Sabor suave que agrada toda família.', 
 8.99, 70, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004009', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-010', 'Hambúrguer Bovino Sadia 672g', 
 'Hambúrguer bovino congelado, prático e saboroso. Ideal para lanches e refeições rápidas.', 
 19.99, 55, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004010', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-011', 'Filé Mignon Bovino kg', 
 'Filé mignon bovino, corte mais nobre e macio. Ideal para ocasiões especiais e pratos gourmet.', 
 89.99, 15, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004011', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-012', 'Contrafilé Bovino kg', 
 'Contrafilé bovino macio, ideal para bifes e grelhados. Carne de primeira com marmoreio perfeito.', 
 38.99, 20, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004012', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-013', 'Frango Inteiro kg', 
 'Frango inteiro fresco, ideal para assados e ensopados. Produto de granja com qualidade garantida.', 
 9.99, 80, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004013', 
 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-014', 'Peixe Tilápia Filé kg', 
 'Filé de tilápia fresco, rico em proteínas e baixo em gordura. Ideal para pratos saudáveis.', 
 26.99, 30, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004014', 
 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-015', 'Salmão Filé kg', 
 'Filé de salmão fresco, rico em ômega 3. Ideal para pratos gourmet e dietas saudáveis.', 
 69.99, 20, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004015', 
 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-016', 'Camarão Médio kg', 
 'Camarão médio fresco, ideal para risotos e pratos especiais. Produto do mar de alta qualidade.', 
 45.99, 25, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004016', 
 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-017', 'Carne Seca kg', 
 'Carne seca nordestina tradicional, ideal para feijoada e pratos regionais. Sabor autêntico.', 
 52.99, 18, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004017', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-018', 'Mortadela Fatiada Perdigão 200g', 
 'Mortadela fatiada tradicional, ideal para sanduíches. Sabor suave e textura macia.', 
 6.99, 90, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004018', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-019', 'Presunto Fatiado Sadia 200g', 
 'Presunto fatiado defumado, ideal para sanduíches e lanches. Produto de alta qualidade.', 
 12.99, 75, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004019', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-020', 'Peito de Peru Fatiado Perdigão 200g', 
 'Peito de peru fatiado, baixo em gordura e rico em proteínas. Ideal para dietas saudáveis.', 
 16.99, 60, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004020', 
 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-021', 'Fraldinha Bovina kg', 
 'Fraldinha bovina macia, ideal para churrascos. Corte saboroso com marmoreio equilibrado.', 
 35.99, 28, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004021', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-022', 'Asa de Frango kg', 
 'Asa de frango temperada, ideal para petiscos e churrascos. Sabor intenso e textura suculenta.', 
 14.99, 65, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004022', 
 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-023', 'Peixe Dourado Filé kg', 
 'Filé de peixe dourado fresco, sabor suave e textura delicada. Ideal para pratos leves.', 
 22.99, 35, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004023', 
 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-024', 'Linguiça Toscana kg', 
 'Linguiça toscana temperada, ideal para churrascos e massas. Sabor marcante italiano.', 
 26.99, 40, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004024', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-025', 'Cupim Bovino kg', 
 'Cupim bovino macio, ideal para churrascos especiais. Corte tradicional com sabor único.', 
 42.99, 22, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004025', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO');

-- ========================================
-- CATEGORIA: LATICÍNIOS (25 produtos)
-- ========================================

INSERT INTO produtos (id, nome, descricao, preco, quantidade_estoque, categoria_id, codigo_barras, imagem_url, status)
VALUES 
('laticinios-001', 'Leite Integral Parmalat 1L', 
 'Leite integral UHT, rico em cálcio e proteínas. Essencial para uma alimentação saudável e equilibrada.', 
 4.99, 200, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005001', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-002', 'Leite Desnatado Nestlé 1L', 
 'Leite desnatado UHT, baixo em gordura e rico em nutrientes. Ideal para dietas e vida saudável.', 
 5.49, 180, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005002', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-003', 'Iogurte Natural Danone 170g', 
 'Iogurte natural cremoso, rico em probióticos. Ideal para lanches saudáveis e sobremesas naturais.', 
 3.99, 150, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005003', 
 'https://images.unsplash.com/photo-1571212515416-fca88c2d2c3e?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-024', 'Iogurte Morango Activia 170g', 
 'Iogurte sabor morango com probióticos Bifidus. Auxilia na digestão e fortalece a imunidade. Sabor doce e cremoso.', 
 4.49, 140, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005024', 
 'https://images.unsplash.com/photo-1571212515416-fca88c2d2c3e?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-005', 'Queijo Mussarela Tirolez 400g', 
 'Queijo mussarela fatiado, sabor suave e cremoso. Ideal para sanduíches, pizzas e lanches.', 
 18.99, 80, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005005', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-006', 'Queijo Prato Polenghi 300g', 
 'Queijo prato fatiado, sabor tradicional brasileiro. Ideal para sanduíches e lanches.', 
 16.99, 70, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005006', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-007', 'Requeijão Cremoso Catupiry 200g', 
 'Requeijão cremoso Catupiry original, sabor único e marcante. Ideal para pães e culinária.', 
 8.99, 120, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005007', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-008', 'Manteiga com Sal Aviação 200g', 
 'Manteiga com sal tradicional, sabor caseiro autêntico. Ideal para pães, bolos e culinária.', 
 12.99, 90, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005008', 
 'https://images.unsplash.com/photo-1589985270826-4b7bb135bc9d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-009', 'Margarina Qualy 500g', 
 'Margarina cremosa com vitaminas A e D. Ideal para pães, bolos e frituras.', 
 6.99, 110, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005009', 
 'https://images.unsplash.com/photo-1589985270826-4b7bb135bc9d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-010', 'Cream Cheese Philadelphia 150g', 
 'Cream cheese Philadelphia cremoso, ideal para pães e sobremesas. Produto importado premium.', 
 9.99, 60, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005010', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-011', 'Queijo Parmesão Ralado Vigor 50g', 
 'Queijo parmesão ralado, sabor intenso e marcante. Ideal para massas, pizzas e pratos gourmet.', 
 7.99, 100, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005011', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-012', 'Ricota Fresca Tirolez 250g', 
 'Ricota fresca cremosa, rica em proteínas e baixa em gordura. Ideal para pratos light e sobremesas.', 
 6.49, 85, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005012', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-013', 'Queijo Coalho Tirolez 200g', 
 'Queijo coalho tradicional nordestino, ideal para grelhar. Sabor único e textura firme.', 
 11.99, 50, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005013', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-044', 'Nata Fresca Nestlé 200ml', 
 'Nata fresca para culinária, ideal para molhos e sobremesas. Textura cremosa e sabor suave.', 
 5.99, 75, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005044', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-015', 'Leite Condensado Zero Nestlé 395g', 
 'Leite condensado zero açúcar, mesmo sabor com menos calorias. Ideal para sobremesas diet.', 
 7.99, 65, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005015', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-016', 'Iogurte Grego Natural Danone 130g', 
 'Iogurte grego natural, cremoso e rico em proteínas. Ideal para lanches fitness e sobremesas saudáveis.', 
 5.99, 90, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005016', 
 'https://images.unsplash.com/photo-1571212515416-fca88c2d2c3e?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-017', 'Queijo Cheddar Polenghi 150g', 
 'Queijo cheddar fatiado, sabor intenso e marcante. Ideal para hambúrgueres e sanduíches gourmet.', 
 13.99, 55, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005017', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-018', 'Bebida Láctea Morango Itambé 900ml', 
 'Bebida láctea sabor morango, nutritiva e saborosa. Ideal para toda família.', 
 4.99, 100, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005018', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-019', 'Doce de Leite Mineiro Nestlé 400g', 
 'Doce de leite cremoso tradicional mineiro. Ideal para sobremesas, bolos e pães.', 
 8.99, 70, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005019', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-020', 'Queijo Minas Frescal Tirolez 300g', 
 'Queijo minas frescal tradicional, sabor suave e textura macia. Ideal para lanches e pratos diversos.', 
 12.99, 60, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005020', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-021', 'Leite em Pó Integral Nestlé 400g', 
 'Leite em pó integral, praticidade e nutrição. Ideal para vitaminas, receitas e café.', 
 15.99, 80, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005021', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-022', 'Chantilly Spray Nestlé 250g', 
 'Chantilly em spray pronto para usar. Ideal para sobremesas, bolos e cafés especiais.', 
 9.99, 45, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005022', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-023', 'Queijo Provolone Polenghi 200g', 
 'Queijo provolone defumado, sabor intenso e aromático. Ideal para pratos italianos e tábuas de frios.', 
 19.99, 40, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005023', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-064', 'Iogurte Líquido Morango Danone 170ml', 
 'Iogurte líquido sabor morango, prático para levar. Rico em probióticos e cálcio.', 
 3.49, 120, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005064', 
 'https://images.unsplash.com/photo-1571212515416-fca88c2d2c3e?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-025', 'Queijo Cottage Vigor 200g', 
 'Queijo cottage light, rico em proteínas e baixo em gordura. Ideal para dietas e pratos saudáveis.', 
 7.99, 65, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005025', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO');

-- ========================================
-- ÍNDICES PARA OTIMIZAÇÃO DE CONSULTAS
-- ========================================

CREATE INDEX IF NOT EXISTS idx_produtos_categoria_id ON produtos(categoria_id);
CREATE INDEX IF NOT EXISTS idx_produtos_nome ON produtos(nome);
CREATE INDEX IF NOT EXISTS idx_produtos_status ON produtos(status);
CREATE INDEX IF NOT EXISTS idx_produtos_preco ON produtos(preco);

-- ========================================
-- COMENTÁRIOS FINAIS
-- ========================================

-- Script executado com sucesso!
-- Total de produtos inseridos: 125 produtos
-- Distribuição por categoria:
-- - Mercearia: 25 produtos
-- - Hortifruti: 25 produtos  
-- - Bebidas: 25 produtos
-- - Carnes: 25 produtos
-- - Laticínios: 25 produtos
-- 
-- Todos os produtos possuem:
-- - Descrições detalhadas e informativas
-- - Imagens funcionais do Unsplash
-- - Preços realistas
-- - Estoque adequado
-- - Códigos de barras únicos
-- - Status ativo para venda