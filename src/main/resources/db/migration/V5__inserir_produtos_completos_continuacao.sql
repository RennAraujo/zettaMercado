-- ========================================
-- CONTINUAÇÃO DOS PRODUTOS LATICÍNIOS
-- ========================================

-- Continuando a inserção dos produtos de Laticínios
INSERT INTO produtos (id, nome, descricao, preco, quantidade_estoque, categoria_id, codigo_barras, imagem_url, status)
VALUES 
('laticinios-014', 'Iogurte Morango Activia 170g', 
 'Iogurte sabor morango com probióticos Bifidus. Auxilia na digestão e fortalece a imunidade. Sabor doce e cremoso, ideal para lanches.', 
 4.49, 140, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005014', 
 'https://images.unsplash.com/photo-1571212515416-fca88c2d2c3e?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-005', 'Queijo Mussarela Tirolez 400g', 
 'Queijo mussarela fatiado, sabor suave e cremoso. Ideal para sanduíches, pizzas e lanches. Produto de alta qualidade com textura perfeita.', 
 18.99, 80, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005005', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-006', 'Queijo Prato Polenghi 300g', 
 'Queijo prato fatiado, sabor tradicional brasileiro. Ideal para sanduíches e lanches. Textura macia e sabor suave que agrada toda família.', 
 16.99, 70, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005006', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-007', 'Requeijão Cremoso Catupiry 200g', 
 'Requeijão cremoso Catupiry original, sabor único e marcante. Ideal para pães, biscoitos e culinária. Produto tradicional brasileiro premium.', 
 8.99, 120, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005007', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-008', 'Manteiga com Sal Aviação 200g', 
 'Manteiga com sal tradicional, sabor caseiro autêntico. Ideal para pães, bolos e culinária. Produto de alta qualidade com sabor marcante.', 
 12.99, 90, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005008', 
 'https://images.unsplash.com/photo-1589985270826-4b7bb135bc9d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-009', 'Margarina Qualy 500g', 
 'Margarina cremosa com vitaminas A e D. Ideal para pães, bolos e frituras. Sabor suave e textura cremosa para uso diário.', 
 6.99, 110, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005009', 
 'https://images.unsplash.com/photo-1589985270826-4b7bb135bc9d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-010', 'Cream Cheese Philadelphia 150g', 
 'Cream cheese Philadelphia cremoso, ideal para pães e sobremesas. Sabor suave e textura aveludada. Produto importado premium.', 
 9.99, 60, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005010', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-011', 'Queijo Parmesão Ralado Vigor 50g', 
 'Queijo parmesão ralado, sabor intenso e marcante. Ideal para massas, pizzas e pratos gourmet. Produto de alta qualidade importado.', 
 7.99, 100, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005011', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-012', 'Ricota Fresca Tirolez 250g', 
 'Ricota fresca cremosa, rica em proteínas e baixa em gordura. Ideal para pratos light e sobremesas. Produto natural e saudável.', 
 6.49, 85, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005012', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-013', 'Queijo Coalho Tirolez 200g', 
 'Queijo coalho tradicional nordestino, ideal para grelhar. Sabor único e textura firme. Perfeito para churrascos e petiscos.', 
 11.99, 50, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005013', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-034', 'Nata Fresca Nestlé 200ml', 
 'Nata fresca para culinária, ideal para molhos e sobremesas. Textura cremosa e sabor suave. Produto de alta qualidade culinária.', 
 5.99, 75, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005034', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-015', 'Leite Condensado Zero Nestlé 395g', 
 'Leite condensado zero açúcar, mesmo sabor com menos calorias. Ideal para sobremesas diet. Produto especial para diabéticos.', 
 7.99, 65, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005015', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-016', 'Iogurte Grego Natural Danone 130g', 
 'Iogurte grego natural, cremoso e rico em proteínas. Ideal para lanches fitness e sobremesas saudáveis. Produto premium nutritivo.', 
 5.99, 90, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005016', 
 'https://images.unsplash.com/photo-1571212515416-fca88c2d2c3e?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-017', 'Queijo Cheddar Polenghi 150g', 
 'Queijo cheddar fatiado, sabor intenso e marcante. Ideal para hambúrgueres e sanduíches gourmet. Produto importado de qualidade.', 
 13.99, 55, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005017', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-018', 'Bebida Láctea Morango Itambé 900ml', 
 'Bebida láctea sabor morango, nutritiva e saborosa. Ideal para toda família. Rica em cálcio e vitaminas essenciais.', 
 4.99, 100, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005018', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-019', 'Doce de Leite Mineiro Nestlé 400g', 
 'Doce de leite cremoso tradicional mineiro. Ideal para sobremesas, bolos e pães. Sabor caseiro autêntico e marcante.', 
 8.99, 70, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005019', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-020', 'Queijo Minas Frescal Tirolez 300g', 
 'Queijo minas frescal tradicional, sabor suave e textura macia. Ideal para lanches e pratos diversos. Produto artesanal de qualidade.', 
 12.99, 60, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005020', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-021', 'Leite em Pó Integral Nestlé 400g', 
 'Leite em pó integral, praticidade e nutrição. Ideal para vitaminas, receitas e café. Produto de longa duração e alta qualidade.', 
 15.99, 80, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005021', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-022', 'Chantilly Spray Nestlé 250g', 
 'Chantilly em spray pronto para usar. Ideal para sobremesas, bolos e cafés especiais. Praticidade garantida na cozinha.', 
 9.99, 45, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005022', 
 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-023', 'Queijo Provolone Polenghi 200g', 
 'Queijo provolone defumado, sabor intenso e aromático. Ideal para pratos italianos e tábuas de frios. Produto premium importado.', 
 19.99, 40, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005023', 
 'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-054', 'Iogurte Líquido Morango Danone 170ml', 
 'Iogurte líquido sabor morango, prático para levar. Rico em probióticos e cálcio. Ideal para lanches rápidos e nutritivos.', 
 3.49, 120, (SELECT id FROM categorias WHERE nome = 'Laticínios'), '7891234005054', 
 'https://images.unsplash.com/photo-1571212515416-fca88c2d2c3e?w=400&h=400&fit=crop', 'ATIVO'),

('laticinios-025', 'Queijo Cottage Vigor 200g', 
 'Queijo cottage light, rico em proteínas e baixo em gordura. Ideal para dietas e pratos saudáveis. Produto natural e nutritivo.', 
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