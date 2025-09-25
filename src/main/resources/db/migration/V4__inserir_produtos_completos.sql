-- ========================================
-- SCRIPT DE INSERÇÃO DE PRODUTOS COMPLETOS
-- Versão: 4.0 - Produtos com descrições detalhadas e imagens
-- Total: 125+ produtos (25+ por categoria)
-- ========================================

-- Primeiro, vamos limpar os produtos existentes para evitar conflitos
DELETE FROM produtos WHERE id IN (
    'produto-arroz-001', 'produto-banana-002', 'produto-refrigerante-003', 
    'produto-file-004', 'produto-leite-005'
);

-- ========================================
-- CATEGORIA: MERCEARIA (25 produtos)
-- ========================================

INSERT INTO produtos (id, nome, descricao, preco, quantidade_estoque, categoria_id, codigo_barras, imagem_url, status)
VALUES 
('mercearia-001', 'Arroz Branco Tio João 5kg', 
 'Arroz branco tipo 1, grãos longos e soltos. Rico em carboidratos, ideal para o dia a dia. Embalagem econômica de 5kg para famílias grandes. Produto nacional de alta qualidade.', 
 18.99, 150, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001001', 
 'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-002', 'Feijão Preto Camil 1kg', 
 'Feijão preto selecionado, rico em proteínas e fibras. Ideal para feijoada e pratos tradicionais brasileiros. Grãos uniformes e de cozimento rápido.', 
 8.49, 200, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001002', 
 'https://images.unsplash.com/photo-1559181567-c3190ca9959b?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-003', 'Açúcar Cristal União 1kg', 
 'Açúcar cristal refinado especial, cristais uniformes que se dissolvem facilmente. Ideal para café, sucos, bolos e sobremesas. Embalagem prática e resistente.', 
 4.99, 180, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001003', 
 'https://images.unsplash.com/photo-1571115764595-644a1f56a55c?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-004', 'Óleo de Soja Liza 900ml', 
 'Óleo de soja refinado, rico em vitamina E. Ideal para frituras, refogados e temperos. Embalagem com bico dosador para maior praticidade no uso diário.', 
 6.79, 120, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001004', 
 'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-005', 'Macarrão Espaguete Barilla 500g', 
 'Massa italiana premium, feita com trigo durum de alta qualidade. Textura al dente perfeita, ideal para molhos variados. Tempo de cozimento: 8-10 minutos.', 
 5.99, 90, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001005', 
 'https://images.unsplash.com/photo-1551892374-ecf8754cf8b0?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-006', 'Farinha de Trigo Dona Benta 1kg', 
 'Farinha de trigo especial para panificação, rica em glúten. Ideal para pães, bolos, tortas e massas caseiras. Produto nacional com certificação de qualidade.', 
 4.29, 160, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001006', 
 'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-007', 'Sal Refinado Cisne 1kg', 
 'Sal refinado iodado, cristais finos e uniformes. Essencial para temperos e conservação de alimentos. Rico em iodo, importante para a saúde da tireoide.', 
 2.49, 250, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001007', 
 'https://images.unsplash.com/photo-1472162314594-a27637f1bf1f?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-008', 'Café Torrado Pilão 500g', 
 'Café torrado e moído tradicional, blend especial de grãos arábica e robusta. Aroma intenso e sabor marcante. Ideal para café coado e expresso.', 
 12.99, 80, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001008', 
 'https://images.unsplash.com/photo-1559056199-641a0ac8b55e?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-009', 'Vinagre de Álcool Castelo 750ml', 
 'Vinagre de álcool de cereais, acidez 4%. Ideal para temperos, conservas e limpeza. Produto natural sem conservantes artificiais.', 
 3.79, 140, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001009', 
 'https://images.unsplash.com/photo-1584464491033-06628f3a6b7b?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-010', 'Molho de Tomate Quero 340g', 
 'Molho de tomate tradicional, feito com tomates selecionados. Tempero caseiro com manjericão e orégano. Ideal para massas, pizzas e carnes.', 
 2.99, 200, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001010', 
 'https://images.unsplash.com/photo-1572441713132-51c75654db73?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-011', 'Extrato de Tomate Elefante 130g', 
 'Extrato de tomate concentrado, rico em licopeno. Ideal para dar cor e sabor a molhos, sopas e ensopados. Embalagem prática com tampa rosqueável.', 
 3.49, 180, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001011', 
 'https://images.unsplash.com/photo-1546548970-71785318a17b?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-012', 'Sardinha em Óleo Gomes da Costa 125g', 
 'Sardinha em óleo comestível, rica em ômega 3 e proteínas. Peixe selecionado e processado com alta tecnologia. Ideal para lanches rápidos e nutritivos.', 
 4.99, 100, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001012', 
 'https://images.unsplash.com/photo-1544943910-4c1dc44aab44?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-013', 'Atum Ralado Gomes da Costa 170g', 
 'Atum ralado em óleo, rico em proteínas e ômega 3. Ideal para saladas, sanduíches e pratos rápidos. Produto do mar de alta qualidade.', 
 7.99, 85, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001013', 
 'https://images.unsplash.com/photo-1563379091339-03246963d96a?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-014', 'Ervilha em Conserva Quero 200g', 
 'Ervilha em conserva, rica em fibras e proteínas vegetais. Prática e saborosa, ideal para saladas, risotos e acompanhamentos. Sem conservantes artificiais.', 
 3.29, 150, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001014', 
 'https://images.unsplash.com/photo-1553621042-f6e147245754?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-015', 'Milho Verde Quero 200g', 
 'Milho verde em conserva, doce e saboroso. Rico em fibras e carboidratos. Ideal para saladas, vitaminas, bolos e pratos diversos.', 
 3.29, 150, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001015', 
 'https://images.unsplash.com/photo-1551754655-cd27e38d2076?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-016', 'Aveia em Flocos Quaker 200g', 
 'Aveia em flocos finos, rica em fibras solúveis. Ideal para vitaminas, mingaus, bolos e pães. Ajuda a reduzir o colesterol e dá saciedade.', 
 5.49, 120, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001016', 
 'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-017', 'Biscoito Cream Cracker Adria 200g', 
 'Biscoito cream cracker tradicional, crocante e saboroso. Ideal para lanches, acompanhar sopas ou servir com patês e queijos.', 
 3.99, 200, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001017', 
 'https://images.unsplash.com/photo-1558961363-fa8fdf82db35?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-018', 'Biscoito Maizena Adria 200g', 
 'Biscoito doce de maizena, tradicional sabor caseiro. Ideal para acompanhar café, chá ou leite. Textura crocante e sabor suave.', 
 4.49, 180, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001018', 
 'https://images.unsplash.com/photo-1549007994-cb92caebd54b?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-019', 'Achocolatado Nescau 400g', 
 'Achocolatado em pó com vitaminas e minerais. Rico em cálcio e ferro. Ideal para preparar vitaminas nutritivas e saborosas para toda família.', 
 8.99, 90, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001019', 
 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-020', 'Leite Condensado Nestlé 395g', 
 'Leite condensado cremoso e doce, ideal para sobremesas, bolos, brigadeiros e doces caseiros. Produto tradicional de alta qualidade.', 
 5.99, 160, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001020', 
 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-021', 'Creme de Leite Nestlé 200g', 
 'Creme de leite fresco, ideal para molhos, sopas, sobremesas e pratos cremosos. Textura aveludada e sabor suave.', 
 4.49, 140, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001021', 
 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-022', 'Fermento em Pó Royal 100g', 
 'Fermento químico em pó para bolos e pães. Garante crescimento uniforme e textura fofa. Indispensável na cozinha para panificação caseira.', 
 3.99, 100, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001022', 
 'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-023', 'Tempero Completo Knorr 300g', 
 'Tempero completo com ervas e especiarias selecionadas. Realça o sabor de carnes, aves, peixes e legumes. Praticidade na cozinha.', 
 6.99, 80, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001023', 
 'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-024', 'Caldo de Galinha Knorr 57g', 
 'Caldo de galinha em tabletes, sabor caseiro intenso. Ideal para sopas, risotos, molhos e temperos. Praticidade e sabor garantidos.', 
 4.29, 120, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001024', 
 'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=400&h=400&fit=crop', 'ATIVO'),

('mercearia-025', 'Gelatina Morango Royal 85g', 
 'Gelatina sabor morango, sobremesa prática e refrescante. Rica em colágeno, ideal para toda família. Preparo rápido e fácil.', 
 2.99, 200, (SELECT id FROM categorias WHERE nome = 'Mercearia'), '7891234001025', 
 'https://images.unsplash.com/photo-1551024506-0bccd828d307?w=400&h=400&fit=crop', 'ATIVO');

-- ========================================
-- CATEGORIA: HORTIFRUTI (25 produtos)
-- ========================================

INSERT INTO produtos (id, nome, descricao, preco, quantidade_estoque, categoria_id, codigo_barras, imagem_url, status)
VALUES 
('hortifruti-001', 'Banana Prata (kg)', 
 'Banana prata fresca e doce, rica em potássio e vitaminas. Ideal para vitaminas, lanches e sobremesas. Fruta nacional de primeira qualidade, colhida no ponto ideal de maturação.', 
 4.99, 50, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002001', 
 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-002', 'Maçã Gala (kg)', 
 'Maçã gala crocante e suculenta, rica em fibras e antioxidantes. Ideal para lanches saudáveis e sobremesas. Fruta importada de alta qualidade.', 
 8.99, 40, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002002', 
 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-003', 'Laranja Pera (kg)', 
 'Laranja pera doce e suculenta, rica em vitamina C. Ideal para sucos naturais e consumo in natura. Fruta nacional selecionada.', 
 3.99, 60, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002003', 
 'https://images.unsplash.com/photo-1547514701-42782101795e?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-004', 'Limão Tahiti (kg)', 
 'Limão tahiti fresco e aromático, rico em vitamina C. Ideal para temperos, sucos e drinks. Fruta nacional de primeira qualidade.', 
 6.99, 35, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002004', 
 'https://images.unsplash.com/photo-1590502593747-42a996133562?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-005', 'Tomate Salada (kg)', 
 'Tomate salada maduro e saboroso, rico em licopeno. Ideal para saladas, molhos e pratos diversos. Produto nacional fresco e selecionado.', 
 5.49, 45, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002005', 
 'https://images.unsplash.com/photo-1546470427-e5380e0e4a04?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-006', 'Cebola Branca (kg)', 
 'Cebola branca fresca e aromática, essencial para temperos e refogados. Rica em antioxidantes e compostos sulfurosos benéficos à saúde.', 
 4.29, 80, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002006', 
 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-007', 'Batata Inglesa (kg)', 
 'Batata inglesa lisa e firme, rica em carboidratos e potássio. Ideal para purês, frituras e assados. Produto nacional de primeira qualidade.', 
 3.99, 70, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002007', 
 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-008', 'Cenoura (kg)', 
 'Cenoura fresca e crocante, rica em betacaroteno e vitamina A. Ideal para saladas, refogados e sucos. Produto nacional selecionado.', 
 4.49, 55, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002008', 
 'https://images.unsplash.com/photo-1445282768818-728615cc910a?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-009', 'Alface Americana (unidade)', 
 'Alface americana crocante e fresca, rica em fibras e vitaminas. Ideal para saladas e sanduíches. Produto hidropônico de alta qualidade.', 
 2.99, 30, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002009', 
 'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-010', 'Brócolis (unidade)', 
 'Brócolis fresco e nutritivo, rico em vitamina C e ferro. Ideal para refogados, sopas e pratos saudáveis. Produto nacional orgânico.', 
 4.99, 25, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002010', 
 'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-011', 'Couve-flor (unidade)', 
 'Couve-flor branca e firme, rica em vitamina C e fibras. Ideal para gratinados, sopas e pratos light. Produto nacional fresco.', 
 5.49, 20, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002011', 
 'https://images.unsplash.com/photo-1568584711271-946d4d46b7d5?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-012', 'Abobrinha Italiana (kg)', 
 'Abobrinha italiana tenra e saborosa, rica em água e fibras. Ideal para refogados, sopas e pratos light. Produto nacional fresco.', 
 3.99, 40, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002012', 
 'https://images.unsplash.com/photo-1566385101042-1a0aa0c1268c?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-013', 'Berinjela (kg)', 
 'Berinjela roxa brilhante e firme, rica em fibras e antioxidantes. Ideal para lasanhas, refogados e pratos mediterrâneos.', 
 4.99, 35, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002013', 
 'https://images.unsplash.com/photo-1564155736-89c5c5d8e1b7?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-014', 'Pimentão Verde (kg)', 
 'Pimentão verde fresco e crocante, rico em vitamina C. Ideal para saladas, refogados e pratos coloridos. Produto nacional selecionado.', 
 6.99, 30, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002014', 
 'https://images.unsplash.com/photo-1563565375-f3fdfdbefa83?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-015', 'Pimentão Vermelho (kg)', 
 'Pimentão vermelho doce e suculento, rico em vitamina C e betacaroteno. Ideal para saladas e pratos gourmet. Produto nacional premium.', 
 8.99, 25, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002015', 
 'https://images.unsplash.com/photo-1563565375-f3fdfdbefa83?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-016', 'Pepino Japonês (kg)', 
 'Pepino japonês crocante e refrescante, rico em água e fibras. Ideal para saladas e pratos frescos. Produto hidropônico de qualidade.', 
 4.49, 40, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002016', 
 'https://images.unsplash.com/photo-1449300079323-02e209d9d3a6?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-017', 'Abacaxi Pérola (unidade)', 
 'Abacaxi pérola doce e aromático, rico em vitamina C e bromelina. Ideal para sobremesas e sucos. Fruta nacional no ponto ideal.', 
 6.99, 15, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002017', 
 'https://images.unsplash.com/photo-1550258987-190a2d41a8ba?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-018', 'Mamão Papaya (kg)', 
 'Mamão papaya doce e suculento, rico em vitamina A e papaína. Ideal para vitaminas e sobremesas. Fruta nacional madura no ponto.', 
 5.99, 30, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002018', 
 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-019', 'Manga Tommy (unidade)', 
 'Manga tommy doce e aromática, rica em vitamina A e C. Ideal para consumo in natura e vitaminas. Fruta nacional selecionada.', 
 3.99, 25, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002019', 
 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-020', 'Uva Itália (kg)', 
 'Uva itália doce e suculenta, rica em antioxidantes. Ideal para lanches e sobremesas. Fruta nacional de primeira qualidade.', 
 12.99, 20, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002020', 
 'https://images.unsplash.com/photo-1537640538966-79f369143f8f?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-021', 'Morango (bandeja 250g)', 
 'Morango fresco e doce, rico em vitamina C e antioxidantes. Ideal para sobremesas e vitaminas. Produto nacional premium selecionado.', 
 8.99, 15, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002021', 
 'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-022', 'Alho Roxo (kg)', 
 'Alho roxo aromático e saboroso, essencial para temperos. Rico em alicina e compostos benéficos à saúde. Produto nacional selecionado.', 
 18.99, 10, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002022', 
 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-023', 'Gengibre (kg)', 
 'Gengibre fresco e aromático, rico em gingerol. Ideal para chás, temperos e pratos orientais. Produto nacional orgânico.', 
 15.99, 8, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002023', 
 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-024', 'Batata Doce (kg)', 
 'Batata doce roxa nutritiva, rica em betacaroteno e fibras. Ideal para assados e pratos fitness. Produto nacional orgânico.', 
 4.99, 45, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002024', 
 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=400&h=400&fit=crop', 'ATIVO'),

('hortifruti-025', 'Rúcula (maço)', 
 'Rúcula fresca e aromática, rica em ferro e vitamina K. Ideal para saladas gourmet e pratos sofisticados. Produto hidropônico premium.', 
 3.49, 20, (SELECT id FROM categorias WHERE nome = 'Hortifruti'), '7891234002025', 
 'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=400&h=400&fit=crop', 'ATIVO');

-- ========================================
-- CATEGORIA: BEBIDAS (25 produtos)
-- ========================================

INSERT INTO produtos (id, nome, descricao, preco, quantidade_estoque, categoria_id, codigo_barras, imagem_url, status)
VALUES 
('bebidas-001', 'Coca-Cola Original 2L', 
 'Refrigerante Coca-Cola original, sabor único e refrescante. Ideal para refeições e momentos especiais. Garrafa PET 2L para toda família.', 
 7.99, 100, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003001', 
 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-002', 'Pepsi Cola 2L', 
 'Refrigerante Pepsi Cola, sabor intenso e refrescante. Ideal para acompanhar refeições e lanches. Garrafa PET 2L econômica.', 
 6.99, 80, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003002', 
 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-003', 'Guaraná Antarctica 2L', 
 'Refrigerante Guaraná Antarctica, sabor brasileiro tradicional. Feito com extrato de guaraná da Amazônia. Garrafa PET 2L.', 
 6.49, 90, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003003', 
 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-004', 'Fanta Laranja 2L', 
 'Refrigerante Fanta sabor laranja, doce e refrescante. Ideal para crianças e toda família. Garrafa PET 2L econômica.', 
 6.99, 85, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003004', 
 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-005', 'Sprite 2L', 
 'Refrigerante Sprite, sabor limão refrescante. Sem cafeína, ideal para qualquer hora do dia. Garrafa PET 2L.', 
 6.99, 75, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003005', 
 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-006', 'Água Mineral Crystal 1,5L', 
 'Água mineral natural Crystal, pura e cristalina. Rica em sais minerais essenciais. Garrafa PET 1,5L com tampa esportiva.', 
 2.99, 200, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003006', 
 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-007', 'Água com Gás Perrier 330ml', 
 'Água mineral com gás Perrier, importada da França. Sabor único e refrescante. Garrafa de vidro 330ml premium.', 
 4.99, 60, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003007', 
 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-008', 'Suco de Laranja Natural One 900ml', 
 'Suco de laranja natural, sem conservantes artificiais. Rico em vitamina C, ideal para café da manhã. Garrafa 900ml.', 
 8.99, 50, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003008', 
 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-009', 'Suco de Uva Integral Aurora 1L', 
 'Suco de uva integral, sem adição de açúcar. Rico em antioxidantes e resveratrol. Garrafa de vidro 1L.', 
 12.99, 40, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003009', 
 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-010', 'Cerveja Skol Lata 350ml', 
 'Cerveja Skol pilsen, sabor suave e refrescante. Ideal para momentos de descontração. Lata 350ml gelada.', 
 2.99, 150, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003010', 
 'https://images.unsplash.com/photo-1608270586620-248524c67de9?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-011', 'Cerveja Brahma Lata 350ml', 
 'Cerveja Brahma pilsen, sabor tradicional brasileiro. Refrescante e saborosa. Lata 350ml gelada.', 
 3.49, 140, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003011', 
 'https://images.unsplash.com/photo-1608270586620-248524c67de9?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-012', 'Cerveja Heineken Lata 350ml', 
 'Cerveja Heineken premium, sabor internacional. Lúpulo selecionado e qualidade holandesa. Lata 350ml.', 
 4.99, 100, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003012', 
 'https://images.unsplash.com/photo-1608270586620-248524c67de9?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-013', 'Vinho Tinto Miolo Merlot 750ml', 
 'Vinho tinto Miolo Merlot, safra especial. Sabor encorpado e aromático. Ideal para carnes vermelhas. Garrafa 750ml.', 
 29.99, 30, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003013', 
 'https://images.unsplash.com/photo-1506377247377-2a5b3b417ebb?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-014', 'Vinho Branco Miolo Chardonnay 750ml', 
 'Vinho branco Miolo Chardonnay, sabor suave e frutado. Ideal para peixes e aves. Garrafa 750ml.', 
 27.99, 25, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003014', 
 'https://images.unsplash.com/photo-1506377247377-2a5b3b417ebb?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-015', 'Energético Red Bull 250ml', 
 'Energético Red Bull original, com cafeína e taurina. Ideal para momentos que exigem energia extra. Lata 250ml.', 
 8.99, 80, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003015', 
 'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-016', 'Chá Gelado Lipton Pêssego 1L', 
 'Chá gelado Lipton sabor pêssego, refrescante e natural. Ideal para dias quentes. Garrafa PET 1L.', 
 5.99, 70, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003016', 
 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-017', 'Isotônico Gatorade Laranja 500ml', 
 'Isotônico Gatorade sabor laranja, repõe eletrólitos. Ideal para atividades físicas. Garrafa 500ml.', 
 4.49, 90, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003017', 
 'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-018', 'Água de Coco Kero Coco 1L', 
 'Água de coco natural Kero Coco, hidratante e nutritiva. Rica em potássio e eletrólitos. Garrafa 1L.', 
 6.99, 60, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003018', 
 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-019', 'Café Expresso Pilão 250ml', 
 'Café expresso Pilão pronto para beber, sabor intenso. Ideal para momentos de energia. Lata 250ml.', 
 3.99, 100, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003019', 
 'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-020', 'Kombucha GTs Gengibre 480ml', 
 'Kombucha GTs sabor gengibre, probiótico natural. Bebida fermentada saudável e refrescante. Garrafa 480ml.', 
 12.99, 35, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003020', 
 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-021', 'Refrigerante Zero Coca-Cola 2L', 
 'Coca-Cola Zero açúcar, mesmo sabor original sem calorias. Ideal para dietas. Garrafa PET 2L.', 
 7.99, 85, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003021', 
 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-022', 'Suco Detox Verde Del Valle 900ml', 
 'Suco detox verde Del Valle, com couve e frutas. Rico em vitaminas e fibras. Garrafa 900ml.', 
 9.99, 45, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003022', 
 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-023', 'Leite de Coco Sococo 200ml', 
 'Leite de coco Sococo cremoso, ideal para culinária e drinks. Produto natural sem conservantes. Caixa 200ml.', 
 3.49, 120, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003023', 
 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-024', 'Achocolatado Toddynho 200ml', 
 'Achocolatado Toddynho pronto para beber, sabor chocolate. Rico em vitaminas e cálcio. Caixa 200ml.', 
 2.99, 150, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003024', 
 'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=400&h=400&fit=crop', 'ATIVO'),

('bebidas-025', 'Refrigerante Guaraná Zero 2L', 
 'Guaraná Antarctica Zero açúcar, sabor tradicional sem calorias. Ideal para dietas. Garrafa PET 2L.', 
 6.49, 70, (SELECT id FROM categorias WHERE nome = 'Bebidas'), '7891234003025', 
 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=400&h=400&fit=crop', 'ATIVO');

-- ========================================
-- CATEGORIA: CARNES (25 produtos)
-- ========================================

INSERT INTO produtos (id, nome, descricao, preco, quantidade_estoque, categoria_id, codigo_barras, imagem_url, status)
VALUES 
('carnes-001', 'Picanha Bovina Premium (kg)', 
 'Picanha bovina premium, corte nobre e suculento. Ideal para churrascos e grelhados. Carne maturada com marmorização perfeita, garantindo sabor e maciez excepcionais.', 
 79.99, 25, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004001', 
 'https://images.unsplash.com/photo-1588168333986-5078d3ae3976?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-002', 'Filé Mignon Bovino (kg)', 
 'Filé mignon bovino, corte mais macio e nobre. Ideal para bifes e pratos gourmet. Carne de primeira qualidade, sem gordura, perfeita para ocasiões especiais.', 
 89.99, 20, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004002', 
 'https://images.unsplash.com/photo-1588168333986-5078d3ae3976?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-003', 'Alcatra Bovina (kg)', 
 'Alcatra bovina sem osso, corte versátil e saboroso. Ideal para assados, bifes e ensopados. Carne magra com sabor intenso.', 
 49.99, 35, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004003', 
 'https://images.unsplash.com/photo-1588168333986-5078d3ae3976?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-004', 'Contrafilé Bovino (kg)', 
 'Contrafilé bovino macio e suculento. Ideal para bifes na chapa e grelhados. Corte com boa marmorização e sabor marcante.', 
 59.99, 30, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004004', 
 'https://images.unsplash.com/photo-1588168333986-5078d3ae3976?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-005', 'Coxão Mole Bovino (kg)', 
 'Coxão mole bovino, corte magro e versátil. Ideal para bifes, ensopados e carne moída. Excelente custo-benefício.', 
 39.99, 40, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004005', 
 'https://images.unsplash.com/photo-1588168333986-5078d3ae3976?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-006', 'Frango Inteiro Congelado (kg)', 
 'Frango inteiro congelado, criado sem hormônios. Ideal para assados e ensopados. Carne branca saudável e nutritiva.', 
 12.99, 60, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004006', 
 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-007', 'Peito de Frango sem Osso (kg)', 
 'Peito de frango sem osso, corte magro e proteico. Ideal para grelhados e pratos fitness. Carne branca de alta qualidade.', 
 18.99, 50, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004007', 
 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-008', 'Coxa e Sobrecoxa de Frango (kg)', 
 'Coxa e sobrecoxa de frango, corte saboroso e suculento. Ideal para assados e ensopados. Carne com mais sabor e umidade.', 
 14.99, 55, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004008', 
 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-009', 'Linguiça Toscana (kg)', 
 'Linguiça toscana temperada, sabor tradicional italiano. Ideal para churrascos e massas. Embutido artesanal de primeira qualidade.', 
 24.99, 30, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004009', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-010', 'Linguiça Calabresa (kg)', 
 'Linguiça calabresa defumada, sabor picante tradicional. Ideal para pizzas, massas e churrascos. Embutido artesanal temperado.', 
 22.99, 35, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004010', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-011', 'Costela Bovina (kg)', 
 'Costela bovina com osso, ideal para churrascos. Corte tradicional brasileiro, suculento e saboroso. Perfeita para assar na brasa.', 
 34.99, 25, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004011', 
 'https://images.unsplash.com/photo-1588168333986-5078d3ae3976?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-012', 'Salmão Fresco (kg)', 
 'Salmão fresco importado, rico em ômega 3. Ideal para grelhados e pratos gourmet. Peixe de alta qualidade e sabor suave.', 
 69.99, 15, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004012', 
 'https://images.unsplash.com/photo-1544943910-4c1dc44aab44?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-013', 'Tilápia Filé (kg)', 
 'Filé de tilápia fresco, peixe de água doce. Ideal para grelhados e assados. Carne branca, magra e saborosa.', 
 24.99, 40, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004013', 
 'https://images.unsplash.com/photo-1544943910-4c1dc44aab44?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-014', 'Camarão Médio Limpo (kg)', 
 'Camarão médio limpo e congelado, rico em proteínas. Ideal para risotos, massas e pratos especiais. Frutos do mar de qualidade.', 
 45.99, 20, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004014', 
 'https://images.unsplash.com/photo-1565680018434-b513d5e5fd47?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-015', 'Carne Moída Especial (kg)', 
 'Carne moída especial, mistura de cortes nobres. Ideal para hambúrgueres, molhos e refogados. Carne fresca moída na hora.', 
 28.99, 45, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004015', 
 'https://images.unsplash.com/photo-1588168333986-5078d3ae3976?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-016', 'Bacon Fatiado Sadia 250g', 
 'Bacon fatiado defumado, sabor intenso e marcante. Ideal para café da manhã, sanduíches e pratos diversos. Embalagem prática.', 
 12.99, 80, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004016', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-017', 'Presunto Cozido Sadia 200g', 
 'Presunto cozido fatiado, sabor suave e tradicional. Ideal para sanduíches e lanches. Produto de alta qualidade e praticidade.', 
 8.99, 100, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004017', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-018', 'Mortadela Bologna Sadia 200g', 
 'Mortadela Bologna fatiada, sabor tradicional. Ideal para sanduíches e lanches rápidos. Embutido de qualidade premium.', 
 6.99, 120, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004018', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-019', 'Salsicha Hot Dog Perdigão 500g', 
 'Salsicha hot dog tradicional, ideal para lanches. Sabor suave e textura macia. Embalagem econômica para toda família.', 
 7.99, 90, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004019', 
 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-020', 'Hambúrguer Bovino Seara 56g (4 unidades)', 
 'Hambúrguer bovino congelado, sabor caseiro. Ideal para lanches e refeições rápidas. Carne temperada e moldada artesanalmente.', 
 9.99, 70, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004020', 
 'https://images.unsplash.com/photo-1588168333986-5078d3ae3976?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-021', 'Maminha Bovina (kg)', 
 'Maminha bovina macia e saborosa, corte especial para churrasco. Ideal para grelhar e assar. Carne com boa marmorização.', 
 54.99, 28, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004021', 
 'https://images.unsplash.com/photo-1588168333986-5078d3ae3976?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-022', 'Fraldinha Bovina (kg)', 
 'Fraldinha bovina suculenta, corte ideal para churrasco. Sabor intenso e textura macia. Perfeita para grelhar e assar.', 
 42.99, 32, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004022', 
 'https://images.unsplash.com/photo-1588168333986-5078d3ae3976?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-023', 'Asa de Frango (kg)', 
 'Asa de frango temperada, ideal para churrascos e assados. Carne saborosa e suculenta. Perfeita para petiscos e refeições.', 
 16.99, 45, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004023', 
 'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-024', 'Peixe Dourado Filé (kg)', 
 'Filé de peixe dourado fresco, rico em proteínas. Ideal para grelhados e assados. Peixe de água doce de alta qualidade.', 
 28.99, 22, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004024', 
 'https://images.unsplash.com/photo-1544943910-4c1dc44aab44?w=400&h=400&fit=crop', 'ATIVO'),

('carnes-025', 'Cupim Bovino (kg)', 
 'Cupim bovino macio e saboroso, corte especial para churrasco. Ideal para assados longos. Carne com gordura entremeada.', 
 38.99, 18, (SELECT id FROM categorias WHERE nome = 'Carnes'), '7891234004025', 
 'https://images.unsplash.com/photo-1588168333986-5078d3ae3976?w=400&h=400&fit=crop', 'ATIVO');

-- ========================================
-- CATEGORIA: LATICÍNIOS (25 produtos)
-- ========================================

INSERT INTO produtos (id, nome, descricao, preco, quantidade_estoque, categoria_id, codigo_barras, imagem_url, status)
VALUES 
('laticinios-001', 'Leite Integral Parmalat 1L', 
 'Leite integral UHT, rico em cálcio e proteínas. Ideal para toda família. Produto pasteurizado de alta qualidade, fonte de vitaminas A e D.', 
 4.99, 120, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005001', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-002', 'Leite Desnatado Nestlé 1L', 
 'Leite desnatado UHT, baixo teor de gordura. Rico em cálcio e proteínas. Ideal para dietas e vida saudável.', 
 5.49, 100, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005002', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-003', 'Iogurte Natural Danone 170g', 
 'Iogurte natural cremoso, rico em probióticos. Ideal para lanches saudáveis e sobremesas. Produto fermentado de alta qualidade.', 
 3.99, 80, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005003', 
 'https://images.unsplash.com/photo-1571212515416-fca88c2d2c3e?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-004', 'Iogurte Morango Activia 170g', 
 'Iogurte sabor morango com probióticos Bifidus. Auxilia na digestão e fortalece a imunidade.', 
 4.29, 60, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005004', 
 'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=400&h=400&fit=crop', 'ATIVO');